import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/camera_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Recording extends StatefulWidget {
  const Recording({super.key});

  @override
  State<Recording> createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  CameraController? _cameraController;
  bool _isRecording = false;

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _onCameraInitialized(CameraController controller) {
    setState(() {
      _cameraController = controller;
    });
  }

  void _onStartRecording() {
    setState(() {
      _isRecording = true;
    });
    // Add recording logic here
    print('Recording started');
  }

  void _onStopRecording() {
    setState(() {
      _isRecording = false;
    });
    // Add stop recording logic here
    print('Recording stopped');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: CameraPreviewWidget(
        onCameraInitialized: _onCameraInitialized,
        isRecording: _isRecording,
        onStartRecording: _onStartRecording,
        onStopRecording: _onStopRecording,
      ),
    );
  }
}

class AudioWaveformPlaceholder extends StatelessWidget {
  const AudioWaveformPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
