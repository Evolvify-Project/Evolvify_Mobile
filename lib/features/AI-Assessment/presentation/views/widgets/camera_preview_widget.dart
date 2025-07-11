import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatefulWidget {
  final Function(CameraController) onCameraInitialized;
  final bool isRecording;
  final VoidCallback? onStartRecording;
  final VoidCallback? onStopRecording;

  const CameraPreviewWidget({
    super.key,
    required this.onCameraInitialized,
    this.isRecording = false,
    this.onStartRecording,
    this.onStopRecording,
  });

  @override
  State<CameraPreviewWidget> createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget>
    with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isEmulator = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _detectEmulator();
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  void _detectEmulator() {
    // Simple emulator detection based on common characteristics
    bool isEmulator = false;

    try {
      if (Platform.isAndroid) {
        // Check for common emulator indicators
        // For now, we'll assume it's an emulator if we're on Android
        // This is a simplified approach - in a real app you might want more sophisticated detection
        isEmulator = true; // Assume emulator for safety
      }
    } catch (e) {
      print('Camera: Emulator detection failed: $e');
    }

    setState(() {
      _isEmulator = isEmulator;
    });
    print('Camera: Running on emulator: $_isEmulator');
  }

  Future<void> _initializeCamera() async {
    try {
      // Get available cameras
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        print('Camera: No cameras available');
        setState(() {
          _errorMessage = 'No cameras available';
        });
        _showFallbackUI();
        return;
      }

      // Use front camera if available, otherwise use the first camera
      CameraDescription camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.medium, // Use medium resolution for better performance
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _controller!.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _errorMessage = '';
        });
        widget.onCameraInitialized(_controller!);
        print('Camera: Camera initialized successfully');
      }
    } catch (e) {
      print('Camera: Error initializing camera: $e');
      setState(() {
        _errorMessage = 'Failed to initialize camera: $e';
      });
      _showFallbackUI();
    }
  }

  void _showFallbackUI() {
    setState(() {
      _isInitialized = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Always show fallback UI on emulator or if camera failed to initialize
    if (_isEmulator || !_isInitialized || _controller == null) {
      return _buildFallbackUI();
    }

    return _buildCameraPreview();
  }

  Widget _buildFallbackUI() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          // Background image or gradient
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade900, Colors.purple.shade900],
                ),
              ),
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
                      _isEmulator
                          ? 'Camera Preview\n(Emulator Mode)'
                          : _errorMessage.isNotEmpty
                          ? 'Camera Error'
                          : 'Camera Unavailable',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (_isEmulator) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Using demo mode for testing',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ] else if (_errorMessage.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        _errorMessage,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
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
                _buildControlButton(icon: Icons.mic, onPressed: () {}),
                const SizedBox(height: 8),
                _buildControlButton(
                  icon: Icons.video_camera_front,
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                _buildControlButton(
                  icon: widget.isRecording ? Icons.pause : Icons.play_arrow,
                  onPressed:
                      widget.isRecording
                          ? widget.onStopRecording
                          : widget.onStartRecording,
                ),
                const SizedBox(height: 8),
                _buildControlButton(
                  icon: Icons.stop,
                  onPressed: widget.isRecording ? widget.onStopRecording : null,
                ),
              ],
            ),
          ),
          // Recording indicator
          if (widget.isRecording)
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
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Camera preview
            CameraPreview(_controller!),
            // Camera controls overlay
            Positioned(
              top: 12,
              left: 12,
              child: Column(
                children: [
                  _buildControlButton(icon: Icons.mic, onPressed: () {}),
                  const SizedBox(height: 8),
                  _buildControlButton(
                    icon: Icons.video_camera_front,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  _buildControlButton(
                    icon: widget.isRecording ? Icons.pause : Icons.play_arrow,
                    onPressed:
                        widget.isRecording
                            ? widget.onStopRecording
                            : widget.onStartRecording,
                  ),
                  const SizedBox(height: 8),
                  _buildControlButton(
                    icon: Icons.stop,
                    onPressed:
                        widget.isRecording ? widget.onStopRecording : null,
                  ),
                ],
              ),
            ),
            // Recording indicator
            if (widget.isRecording)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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
        ),
      ),
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }
}
