import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_cubit.dart';
import 'package:evolvify/features/AI-Assessment/presentation/manager/ai_assessment_cubit/ai_assessment_state.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/analysis_results_view.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';

class AiAssessmentEvolviSense extends StatefulWidget {
  final String testType;
  final List<String> prompts;
  final int durationPerPrompt;

  const AiAssessmentEvolviSense({
    super.key,
    required this.testType,
    required this.prompts,
    this.durationPerPrompt = 30,
  });

  @override
  State<AiAssessmentEvolviSense> createState() =>
      _AiAssessmentEvolviSenseState();
}

class _AiAssessmentEvolviSenseState extends State<AiAssessmentEvolviSense>
    with WidgetsBindingObserver {
  final ImagePicker _picker = ImagePicker();
  File? _recordedVideo;
  bool _isRecording = false;
  bool _isUploading = false;
  bool _isRecordingFinished = false;
  int _currentPrompt = 0;
  int _promptTimer = 30;
  int _countdown = 0;
  String _uploadStatus = '';
  double _uploadProgress = 0.0;
  double _actualRecordingDuration = 0.0; // Track actual recording duration
  DateTime? _recordingStartTime; // Track when recording started
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _isVideoPlaying = false;

  // Camera related variables
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isMicEnabled = true;
  List<CameraDescription> _cameras = [];
  int _currentCameraIndex = 0;
  bool _isDisposing = false; // Track if widget is being disposed
  bool _isInitializing = false; // Track if camera is being initialized

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _promptTimer = widget.durationPerPrompt;
    _countdown = widget.prompts.length * widget.durationPerPrompt;
    _initializeCamera();
  }

  @override
  void dispose() {
    _isDisposing = true;
    WidgetsBinding.instance.removeObserver(this);

    _videoController?.dispose();
    _videoController = null;

    // Properly dispose camera controller
    if (_cameraController != null) {
      try {
        _cameraController!.dispose();
      } catch (e) {
        print('Error disposing camera controller: $e');
      }
      _cameraController = null;
    }

    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    // Handle hot reload by forcing camera cleanup and reinitialization
    if (mounted && !_isDisposing) {
      // Force cleanup first, then reinitialize after a longer delay
      _forceCameraCleanup().then((_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted && !_isDisposing) {
            _initializeCamera();
          }
        });
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Handle app lifecycle changes
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        // Dispose camera when app goes to background
        if (_cameraController != null) {
          try {
            _cameraController!.dispose();
            _cameraController = null;
          } catch (e) {
            print('Error disposing camera on app pause: $e');
          }
        }
        break;
      case AppLifecycleState.resumed:
        // Reinitialize camera when app comes back to foreground
        if (mounted && !_isDisposing && !_isCameraInitialized) {
          _initializeCamera();
        }
        break;
      default:
        break;
    }
  }

  // Force camera cleanup to prevent hot reload issues
  Future<void> _forceCameraCleanup() async {
    if (_cameraController != null) {
      try {
        print('Force cleaning up camera controller');
        // Stop any ongoing operations first
        if (_cameraController!.value.isRecordingVideo) {
          await _cameraController!.stopVideoRecording();
        }

        await _cameraController!.dispose();
        print('Camera controller disposed successfully');
      } catch (e) {
        print('Error in force camera cleanup: $e');
      }
      _cameraController = null;
    }

    // Reset camera state
    if (mounted && !_isDisposing) {
      setState(() {
        _isCameraInitialized = false;
      });
    }
  }

  void _showMessage(String message, {String type = 'info'}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            type == 'success'
                ? Colors.green
                : type == 'error'
                ? Colors.red
                : Colors.blue,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _startRecording() async {
    if (_isRecording || _isUploading) return;

    // Check if camera is initialized
    if (!_isCameraInitialized || _cameraController == null) {
      _showMessage('Camera not ready. Please wait...', type: 'error');
      return;
    }

    try {
      // Check if camera controller is still valid
      if (!_cameraController!.value.isInitialized) {
        _showMessage('Camera not initialized. Please wait...', type: 'error');
        return;
      }

      // Start recording video with timeout
      await _cameraController!.startVideoRecording().timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw Exception('Recording start timeout');
        },
      );

      setState(() {
        _isRecording = true;
        _currentPrompt = 0;
        _promptTimer = widget.durationPerPrompt;
        _countdown = widget.prompts.length * widget.durationPerPrompt;
        _isRecordingFinished = false;
        _recordingStartTime = DateTime.now(); // Track when recording started
      });

      _showMessage('${widget.testType} started...');

      // Start prompt timer
      _startPromptTimer();
    } catch (e) {
      print('Error starting recording: $e');
      _showMessage(
        'Failed to start recording. Please try again.',
        type: 'error',
      );

      // Reset camera if there's an error
      if (mounted) {
        await _forceCameraCleanup();
        await Future.delayed(const Duration(milliseconds: 200));
        await _initializeCamera();
      }
    }
  }

  void _startPromptTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!_isRecording) return;

      setState(() {
        if (_promptTimer > 0) {
          _promptTimer--;
          _countdown--;
        } else {
          if (_currentPrompt < widget.prompts.length - 1) {
            _currentPrompt++;
            _promptTimer = widget.durationPerPrompt;
          } else {
            _stopRecording();
            return;
          }
        }
      });

      _startPromptTimer();
    });
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      // Stop recording and get the video file
      final XFile videoFile = await _cameraController!.stopVideoRecording();

      setState(() {
        _isRecording = false;
        _isRecordingFinished = true;
        _countdown = 0;
        _currentPrompt = 0;
        _promptTimer = widget.durationPerPrompt;
        _recordedVideo = File(videoFile.path);

        // Calculate actual recording duration based on real time elapsed
        if (_recordingStartTime != null) {
          _actualRecordingDuration =
              DateTime.now()
                  .difference(_recordingStartTime!)
                  .inSeconds
                  .toDouble();
        } else {
          // Fallback to prompt-based calculation if start time is not available
          _actualRecordingDuration =
              (widget.prompts.length * widget.durationPerPrompt).toDouble();
        }
      });

      // Initialize video player for the recorded video
      await _initializeVideoPlayer(videoFile.path);

      _showMessage('${widget.testType} finished. Please submit or cancel.');
    } catch (e) {
      _showMessage('Failed to stop recording: $e', type: 'error');
      setState(() {
        _isRecording = false;
        _isRecordingFinished = false;
      });
    }
  }

  void _cancelRecording() {
    // Stop recording if it's still active
    if (_isRecording && _cameraController != null) {
      _cameraController!.stopVideoRecording();
    }

    _videoController?.dispose();
    setState(() {
      _isRecording = false;
      _isRecordingFinished = false;
      _recordedVideo = null;
      _countdown = 0;
      _currentPrompt = 0;
      _promptTimer = widget.durationPerPrompt;
      _actualRecordingDuration = 0.0;
      _recordingStartTime = null;
      _videoController = null;
      _isVideoInitialized = false;
      _isVideoPlaying = false;
    });

    _showMessage('Recording cancelled');
  }

  void _resetSession() {
    // Stop recording if it's still active
    if (_isRecording && _cameraController != null) {
      _cameraController!.stopVideoRecording();
    }

    _videoController?.dispose();
    setState(() {
      _isRecording = false;
      _isRecordingFinished = false;
      _recordedVideo = null;
      _countdown = 0;
      _currentPrompt = 0;
      _promptTimer = widget.durationPerPrompt;
      _uploadStatus = '';
      _uploadProgress = 0.0;
      _actualRecordingDuration = 0.0;
      _recordingStartTime = null;
      _videoController = null;
      _isVideoInitialized = false;
      _isVideoPlaying = false;
    });

    _showMessage('Session reset');
  }

  Future<void> _pickVideo() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        // Get actual video duration using video_player
        final duration = await _getVideoDuration(video.path);

        setState(() {
          _recordedVideo = File(video.path);
          _isRecordingFinished = true;
          _actualRecordingDuration = duration;
        });

        // Initialize video player for preview
        await _initializeVideoPlayer(video.path);

        _showMessage(
          'Video uploaded with ${duration.toInt()}s duration. Please submit or cancel.',
          type: 'success',
        );
      }
    } catch (e) {
      _showMessage('Error picking video: $e', type: 'error');
    }
  }

  Future<void> _initializeCamera() async {
    if (_isDisposing || _isInitializing) return;

    try {
      print('Starting camera initialization');
      _isInitializing = true;

      // Force cleanup any existing camera resources
      await _forceCameraCleanup();

      // Add a small delay to ensure camera resources are released
      await Future.delayed(const Duration(milliseconds: 200));

      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        print('No cameras available');
        if (mounted && !_isDisposing) {
          setState(() {
            _isCameraInitialized = false;
          });
        }
        _isInitializing = false;
        return;
      }

      // Debug: Print available cameras
      print('Available cameras: ${_cameras.length}');
      for (int i = 0; i < _cameras.length; i++) {
        final camera = _cameras[i];
        print('Camera $i: ${camera.name} - ${camera.lensDirection}');
      }

      // Find front camera index (default to first camera if no front camera found)
      _currentCameraIndex = 0; // Default to first camera
      for (int i = 0; i < _cameras.length; i++) {
        if (_cameras[i].lensDirection == CameraLensDirection.front) {
          _currentCameraIndex = i;
          break;
        }
      }

      print(
        'Selected camera index: $_currentCameraIndex (${_cameras[_currentCameraIndex].lensDirection})',
      );

      await _initializeCameraController();
      print('Camera initialization process completed');

      // Verify camera state after initialization
      if (mounted && !_isDisposing) {
        print('Final camera state check:');
        print('- _isCameraInitialized: $_isCameraInitialized');
        print(
          '- _cameraController: ${_cameraController != null ? 'exists' : 'null'}',
        );
        if (_cameraController != null) {
          print(
            '- _cameraController.isInitialized: ${_cameraController!.value.isInitialized}',
          );
        }
      }

      // Set initialization flag to false only after everything is complete
      _isInitializing = false;
      print('Camera initialization flag set to false');
    } catch (e) {
      print('Error initializing camera: $e');
      if (mounted && !_isDisposing) {
        setState(() {
          _isCameraInitialized = false;
        });
      }
      _isInitializing = false;
      print('Camera initialization flag set to false (error case)');
    }
  }

  Future<void> _initializeCameraController() async {
    print('_initializeCameraController called');
    print('- _isDisposing: $_isDisposing');
    print('- _isInitializing: $_isInitializing');

    if (_isDisposing) {
      print('Returning early due to disposal');
      return;
    }

    try {
      // Check if cameras list is valid
      if (_cameras.isEmpty || _currentCameraIndex >= _cameras.length) {
        print('Invalid camera index or no cameras available');
        print('- _cameras.length: ${_cameras.length}');
        print('- _currentCameraIndex: $_currentCameraIndex');
        if (mounted && !_isDisposing) {
          setState(() {
            _isCameraInitialized = false;
          });
        }
        return;
      }

      print('Initializing camera controller for camera $_currentCameraIndex');

      // Create new camera controller with lower resolution to avoid conflicts
      final newController = CameraController(
        _cameras[_currentCameraIndex],
        ResolutionPreset.low, // Use low resolution to reduce resource conflicts
        enableAudio: _isMicEnabled,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      print('Camera controller created, starting initialization...');

      // Initialize the new controller with timeout
      await newController.initialize().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Camera initialization timeout');
        },
      );

      print('Camera controller initialized successfully');

      // Only update state if widget is still mounted and not disposing
      print('Checking state conditions:');
      print('- mounted: $mounted');
      print('- !_isDisposing: ${!_isDisposing}');
      print('- _isInitializing: $_isInitializing');

      if (mounted && !_isDisposing) {
        // Dispose old controller if it exists
        if (_cameraController != null) {
          try {
            print('Disposing old camera controller');
            await _cameraController!.dispose();
          } catch (e) {
            print('Error disposing old camera controller: $e');
          }
        }

        print('Setting new camera controller');
        setState(() {
          _cameraController = newController;
          _isCameraInitialized = true;
        });
        print('Camera initialization complete');
      } else {
        print(
          'Widget disposed or not initializing during camera initialization, disposing new controller',
        );
        // Widget was disposed during initialization, dispose the new controller
        try {
          await newController.dispose();
        } catch (e) {
          print('Error disposing camera controller after widget disposal: $e');
        }
      }
    } catch (e) {
      print('Error initializing camera controller: $e');
      // Try to recover by forcing cleanup
      await _forceCameraCleanup();
      if (mounted && !_isDisposing) {
        setState(() {
          _isCameraInitialized = false;
          _cameraController = null;
        });
      }
    }
  }

  void _switchCamera() async {
    if (_cameras.length <= 1) {
      _showMessage('Only one camera available', type: 'info');
      return;
    }

    try {
      final newCameraIndex = (_currentCameraIndex + 1) % _cameras.length;
      print(
        'Switching from camera $_currentCameraIndex to camera $newCameraIndex',
      );

      // Dispose the old controller first
      if (_cameraController != null) {
        setState(() {
          _isCameraInitialized = false;
        });
        await _cameraController!.dispose();
        _cameraController = null;
        // Add a longer delay to allow the system to release the camera
        await Future.delayed(const Duration(milliseconds: 700));
      }

      _currentCameraIndex = newCameraIndex;

      // Now initialize the new controller
      await _initializeCameraController();

      setState(() {}); // Force rebuild to use the new controller

      final cameraDirection = _cameras[_currentCameraIndex].lensDirection;
      final directionText =
          cameraDirection == CameraLensDirection.front ? 'Front' : 'Back';
      _showMessage('Switched to $directionText camera', type: 'success');
    } catch (e) {
      print('Error switching camera: $e');
      _showMessage('Failed to switch camera. Please try again.', type: 'error');
      // Optionally revert to previous camera
    }
  }

  void _toggleMic() async {
    if (!mounted) return;

    setState(() {
      _isMicEnabled = !_isMicEnabled;
    });

    // Reinitialize camera with new mic setting
    if (_isCameraInitialized) {
      try {
        await _initializeCameraController();
      } catch (e) {
        print('Error toggling mic: $e');
      }
    }
  }

  Future<double> _getVideoDuration(String videoPath) async {
    try {
      final VideoPlayerController controller = VideoPlayerController.file(
        File(videoPath),
      );
      await controller.initialize();
      final duration = controller.value.duration.inSeconds.toDouble();
      await controller.dispose();
      return duration;
    } catch (e) {
      // Fallback to manual input if video_player fails
      final manualDuration = await _showDurationDialog();
      return manualDuration ?? 11.0;
    }
  }

  Future<void> _initializeVideoPlayer(String videoPath) async {
    try {
      _videoController?.dispose();
      _videoController = VideoPlayerController.file(File(videoPath));
      await _videoController!.initialize();
      setState(() {
        _isVideoInitialized = true;
        _isVideoPlaying = false;
      });
    } catch (e) {
      // Handle initialization error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading video: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _toggleVideoPlayPause() {
    if (_videoController != null && _isVideoInitialized) {
      setState(() {
        if (_isVideoPlaying) {
          _videoController!.pause();
        } else {
          _videoController!.play();
        }
        _isVideoPlaying = !_isVideoPlaying;
      });
    }
  }

  Widget _buildVideoPlayer() {
    if (!_isVideoInitialized || _videoController == null) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Stack(
      children: [
        // Video player with proper cropping
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 300, // Fixed width
              height: 280, // Fixed height
              child: ClipRect(
                child: OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoController!.value.aspectRatio * 280,
                      height: 280,
                      child: VideoPlayer(_videoController!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Play/Pause overlay
        Center(
          child: GestureDetector(
            onTap: _toggleVideoPlayPause,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<double?> _showDurationDialog() async {
    double duration = 11.0; // Default to 11 seconds
    return showDialog<double>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Video Duration'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Please specify the duration of your uploaded video:',
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Duration (seconds)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    duration = double.tryParse(value) ?? 11.0;
                  },
                  controller: TextEditingController(text: '11'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(duration),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _submitVideo() async {
    if (_recordedVideo == null) {
      _showMessage('No video to submit', type: 'error');
      return;
    }

    print('EvolviSense: Starting video submission');
    print('EvolviSense: Video file path: ${_recordedVideo!.path}');
    print('EvolviSense: Video file exists: ${await _recordedVideo!.exists()}');

    setState(() {
      _isUploading = true;
      _uploadStatus = 'Uploading video...';
      _uploadProgress = 10.0;
    });

    // Use Bloc to analyze the video via the real API
    final cubit = BlocProvider.of<AiAssessmentCubit>(context, listen: false);
    print('EvolviSense: Cubit found: ${cubit != null}');
    print('EvolviSense: Current cubit state: ${cubit?.state.runtimeType}');

    if (cubit != null) {
      print('EvolviSense: Calling cubit.analyzeVideo');
      cubit.analyzeVideo(videoFile: _recordedVideo!);
    } else {
      print('EvolviSense: ERROR - Cubit not found!');
      setState(() {
        _isUploading = false;
        _uploadStatus = 'Error: Cubit not available';
        _uploadProgress = 0.0;
      });
      _showMessage('Error: Analysis service not available', type: 'error');
    }
    // The rest is handled by BlocListener below
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AiAssessmentCubit, AiAssessmentState>(
      listener: (context, state) {
        print('EvolviSense: BlocListener received state: ${state.runtimeType}');

        if (state is Loading) {
          print('EvolviSense: Loading state received');
          setState(() {
            _isUploading = true;
            _uploadStatus = 'Analyzing...';
            _uploadProgress = 50.0;
          });
        } else if (state is VideoAnalysisSuccess) {
          print('EvolviSense: VideoAnalysisSuccess state received');
          print('EvolviSense: Result data: ${state.result}');
          setState(() {
            _isUploading = false;
            _isRecordingFinished = false;
            _uploadStatus = '';
            _uploadProgress = 0.0;
          });
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (context) =>
                      AnalysisResultsView(videoAnalysisResult: state.result),
            ),
          );
        } else if (state is Error) {
          print('EvolviSense: Error state received: ${state.message}');
          setState(() {
            _isUploading = false;
            _uploadStatus = 'Analysis failed: ${state.message}';
            _uploadProgress = 0.0;
          });
          _showMessage('Analysis failed: ${state.message}', type: 'error');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.testType),
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildVideoSection(),
              const SizedBox(height: 16),
              if (_isRecording) _buildCurrentPromptSection(),
              const SizedBox(height: 16),
              _buildControlButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Container(
      width: double.infinity,
      height: 280, // Reduced height for better proportions
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Camera preview or video player
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:
                _recordedVideo != null
                    ? _buildVideoPlayer()
                    : _buildCameraPreview(),
          ),
          // Recording indicator
          if (_isRecording && _countdown > 0)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${_countdown}s',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // Upload progress overlay
          if (_isUploading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _uploadStatus,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: _uploadProgress / 100,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCurrentPromptSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.help_outline, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'Current Prompt (${_currentPrompt + 1} of ${widget.prompts.length})',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '${_promptTimer}s',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.prompts[_currentPrompt],
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: _promptTimer / widget.durationPerPrompt,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButtons() {
    if (_isRecordingFinished && !_isUploading) {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              title: 'Submit',
              onTap: _submitVideo,
              borderRadius: 12,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CustomButton(
              title: 'Cancel',
              onTap: _cancelRecording,
              borderRadius: 12,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                title: 'Start',
                onTap: _startRecording,
                borderRadius: 12,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                title: 'Stop',
                onTap: () async => await _stopRecording(),
                borderRadius: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                title: 'Reset',
                onTap: _resetSession,
                borderRadius: 12,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                title: 'Upload',
                onTap: _pickVideo,
                borderRadius: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCameraPreview() {
    if (!_isCameraInitialized ||
        _cameraController == null ||
        !_cameraController!.value.isInitialized) {
      return Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                size: 64,
                color: Colors.white.withOpacity(0.7),
              ),
              const SizedBox(height: 16),
              Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        // Camera preview with simple, clean approach
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 280,
              height: 320,
              child: Builder(
                builder: (context) {
                  try {
                    return CameraPreview(_cameraController!);
                  } catch (e) {
                    print('Error building camera preview: $e');
                    return Container(
                      color: Colors.black87,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Camera Error',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        // Camera controls overlay
        Positioned(
          top: 12,
          left: 12,
          child: Column(
            children: [
              _buildControlButton(
                icon: _isMicEnabled ? Icons.mic : Icons.mic_off,
                onPressed: _toggleMic,
              ),
              const SizedBox(height: 8),
              _buildControlButton(
                icon: Icons.switch_camera,
                onPressed: _switchCamera,
              ),
              const SizedBox(height: 8),
              // Camera indicator
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _cameras.isNotEmpty && _currentCameraIndex < _cameras.length
                      ? _cameras[_currentCameraIndex].lensDirection ==
                              CameraLensDirection.front
                          ? 'Front'
                          : 'Back'
                      : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Recording indicator
        if (_isRecording)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'REC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.black54,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
