// lib/features/AI-Assessment/data/repositories/ai_assessment_repository.dart
import 'dart:io';
import 'package:evolvify/features/AI-Assessment/data/models/emotion_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';

abstract class AiAssessmentRepository {
  /// Connects to the WebSocket for real-time emotion analysis.
  ///
  /// The stream should emit [EmotionAnalysisResponseModel] instances.
  /// You'll need to handle sending base64 encoded video frames to the WebSocket.
  Stream<EmotionAnalysisResponseModel> connectToEmotionStream();

  /// Sends a video frame to the WebSocket for analysis.
  /// This might be part of the WebSocket handling logic rather than a separate repo method,
  /// depending on your WebSocket client library.
  void sendVideoFrame(String base64Frame);

  /// Closes the WebSocket connection.
  void disconnectFromEmotionStream();

  /// Uploads a video file for emotion analysis.
  Future<VideoAnalysisResponseModel> analyzeUploadedVideo({
    required File videoFile,
    int? frameSkip,
    int? maxFrames,
  });
}