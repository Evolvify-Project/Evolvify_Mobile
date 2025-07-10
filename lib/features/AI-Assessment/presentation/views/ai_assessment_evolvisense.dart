import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class AiAssessmentEvolviSense extends StatefulWidget {
  final List<String> prompts;
  final int durationPerPrompt;

  const AiAssessmentEvolviSense({
    super.key,
    required this.prompts,
    this.durationPerPrompt = 10,
  });

  @override
  State<AiAssessmentEvolviSense> createState() =>
      _AiAssessmentEvolviSenseState();
}

class _AiAssessmentEvolviSenseState extends State<AiAssessmentEvolviSense> {
  CameraController? _cameraController;
  bool _cameraInitialized = false;
  bool _recording = false;
  bool _loading = false;
  bool _isRecordingFinished = false;
  String? _videoPath;
  int _currentPrompt = 0;
  int _promptTimer = 0;
  Timer? _timer;
  final List<Map<String, dynamic>> _emotionData = [];
  String? _error;
  String? _message;

  // Mock summary stats for demo
  final Map<String, dynamic> _summaryStats = {
    'confidence': 85,
    'anxiety': 20,
    'stress': 30,
    'primaryEmotion': 'Happy',
    'peakStress': 40,
    'emotionalStability': 80,
  };

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    setState(() => _loading = true);

    try {
      // Skip permission requests on Linux desktop
      if (!kIsWeb && Platform.isLinux || Platform.isWindows) {
        setState(() {
          _error =
              "Camera recording is not supported on Linux desktop. This feature works on mobile devices.";
          _loading = false;
        });
        return;
      }

      // Request permissions only on supported platforms
      if (!kIsWeb) {
        await Permission.camera.request();
        await Permission.microphone.request();
      }

      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() {
          _error = "No camera found";
          _loading = false;
        });
        return;
      }

      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: true,
      );
      await _cameraController!.initialize();
      setState(() {
        _cameraInitialized = true;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Failed to initialize camera: $e";
        _loading = false;
      });
    }
  }

  void _startRecording() async {
    if (!_cameraInitialized || _recording) return;

    // For Linux desktop, provide a mock recording experience
    if (!kIsWeb && Platform.isLinux) {
      setState(() {
        _recording = true;
        _isRecordingFinished = false;
        _currentPrompt = 0;
        _promptTimer = widget.durationPerPrompt;
        _error = null;
        _message = "Mock recording started (Linux desktop mode)";
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        setState(() {
          if (_promptTimer > 0) {
            _promptTimer--;
          } else {
            if (_currentPrompt < widget.prompts.length - 1) {
              _currentPrompt++;
              _promptTimer = widget.durationPerPrompt;
            } else {
              _stopRecording();
            }
          }
        });
      });
      return;
    }

    setState(() {
      _recording = true;
      _isRecordingFinished = false;
      _currentPrompt = 0;
      _promptTimer = widget.durationPerPrompt;
      _error = null;
      _message = "Recording started";
    });
    final dir = await getTemporaryDirectory();
    final filePath = path.join(
      dir.path,
      "${DateTime.now().millisecondsSinceEpoch}.mp4",
    );
    await _cameraController!.startVideoRecording();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        if (_promptTimer > 0) {
          _promptTimer--;
        } else {
          if (_currentPrompt < widget.prompts.length - 1) {
            _currentPrompt++;
            _promptTimer = widget.durationPerPrompt;
          } else {
            _stopRecording();
          }
        }
      });
    });
  }

  void _stopRecording() async {
    if (!_recording) return;
    _timer?.cancel();

    // For Linux desktop, simulate recording completion
    if (!kIsWeb && Platform.isLinux) {
      setState(() {
        _videoPath = "mock_video_path.mp4";
        _recording = false;
        _isRecordingFinished = true;
        _message = "Mock recording finished. You can submit or reset.";
      });
      return;
    }

    final file = await _cameraController!.stopVideoRecording();
    setState(() {
      _videoPath = file.path;
      _recording = false;
      _isRecordingFinished = true;
      _message = "Recording finished. You can submit or reset.";
    });
  }

  void _resetSession() {
    setState(() {
      _videoPath = null;
      _isRecordingFinished = false;
      _currentPrompt = 0;
      _promptTimer = widget.durationPerPrompt;
      _emotionData.clear();
      _error = null;
      _message = "Session reset";
    });
  }

  void _submitVideo() async {
    setState(() {
      _loading = true;
      _message = "Uploading and analyzing video...";
    });
    // TODO: Upload _videoPath to backend and get results
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _loading = false;
      _message = "Analysis complete!";
      // TODO: Set _emotionData and _summaryStats from backend response
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EvolviSense'),
        backgroundColor: const Color(0xFF233A66),
        foregroundColor: Colors.white,
      ),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      if (_error != null)
                        Container(
                          color: Colors.red[100],
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            _error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      if (_message != null)
                        Container(
                          color: Colors.blue[50],
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            _message!,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      _buildCameraPreview(),
                      const SizedBox(height: 16),
                      _buildPromptCard(),
                      const SizedBox(height: 16),
                      _buildControls(),
                      const SizedBox(height: 24),
                      _buildSummaryCards(),
                      const SizedBox(height: 24),
                      _buildLineChart(),
                      const SizedBox(height: 24),
                      _buildKeyInsights(),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildCameraPreview() {
    // For Linux desktop, show a placeholder
    if (!kIsWeb && Platform.isLinux) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt, size: 48, color: Colors.grey),
              SizedBox(height: 8),
              Text(
                'Camera Preview\n(Linux Desktop Mode)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    if (_videoPath != null && _isRecordingFinished) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayerWidget(videoPath: _videoPath!),
      );
    }
    if (_cameraInitialized) {
      return AspectRatio(
        aspectRatio: _cameraController!.value.aspectRatio,
        child: CameraPreview(_cameraController!),
      );
    }
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: const Center(child: Text('Camera not ready')),
    );
  }

  Widget _buildPromptCard() {
    if (!_recording && !_isRecordingFinished) return const SizedBox.shrink();
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Prompt  ${_currentPrompt + 1} of ${widget.prompts.length}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.prompts[_currentPrompt]),
            const SizedBox(height: 8),
            Text("Time left: $_promptTimer s"),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: _recording ? null : _startRecording,
          icon: const Icon(Icons.fiber_manual_record),
          label: const Text('Start'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
        ElevatedButton.icon(
          onPressed: _recording ? _stopRecording : null,
          icon: const Icon(Icons.stop),
          label: const Text('Stop'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
        ElevatedButton.icon(
          onPressed: _isRecordingFinished ? _submitVideo : null,
          icon: const Icon(Icons.cloud_upload),
          label: const Text('Submit'),
        ),
        ElevatedButton.icon(
          onPressed: _resetSession,
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _statCard(
          'Confidence',
          _summaryStats['confidence'].toString(),
          Colors.green,
        ),
        _statCard(
          'Anxiety',
          _summaryStats['anxiety'].toString(),
          Colors.purple,
        ),
        _statCard('Stress', _summaryStats['stress'].toString(), Colors.red),
      ],
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "$value%",
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    // Mock data for demo
    final data = [
      FlSpot(0, 30),
      FlSpot(1, 40),
      FlSpot(2, 35),
      FlSpot(3, 50),
      FlSpot(4, 45),
    ];
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Emotional Trends',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: data,
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyInsights() {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Insights',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Primary Emotion: ${_summaryStats['primaryEmotion']}'),
            Text('Peak Stress: ${_summaryStats['peakStress']}%'),
            Text(
              'Emotional Stability: ${_summaryStats['emotionalStability']}%',
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
        : const Center(child: CircularProgressIndicator());
  }
}
