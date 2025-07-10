// lib/features/AI-Assessment/data/repositories/ai_assessment_repository_impl.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:evolvify/features/AI-Assessment/data/models/emotion_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/models/video_analysis_response_model.dart';
import 'package:evolvify/features/AI-Assessment/data/repos/ai_assessment_repository.dart';

class AiAssessmentRepositoryImpl implements AiAssessmentRepository {
  final String _baseUrl = "moodydev-EvolviSense.hf.space"; // Without https://
  final String _wsBaseUrl = "wss://moodydev-EvolviSense.hf.space";
  final bool _useMockData = false; // Set to false to use real API

  WebSocketChannel? _channel;
  StreamController<EmotionAnalysisResponseModel>? _emotionStreamController;

  @override
  Stream<EmotionAnalysisResponseModel> connectToEmotionStream() {
    if (_emotionStreamController != null &&
        !_emotionStreamController!.isClosed) {
      _emotionStreamController!.close();
    }
    _emotionStreamController =
        StreamController<EmotionAnalysisResponseModel>.broadcast();

    if (_useMockData) {
      // Return mock stream for testing
      print('Using mock data for emotion stream');
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (_emotionStreamController?.isClosed == false) {
          final mockEmotion = EmotionAnalysisResponseModel(
            emotion:
                ['Happy', 'Neutral', 'Sad', 'Angry'][DateTime.now().second % 4],
            confidence: 0.7 + (DateTime.now().millisecond % 30) / 100,
            mentalHealth: MentalHealthModel(
              stress: 0.2 + (DateTime.now().second % 40) / 100,
              anxiety: 0.15 + (DateTime.now().second % 35) / 100,
              confidence: 0.8 + (DateTime.now().second % 20) / 100,
            ),
            trendData: TrendDataModel(
              stressHistory: [0.2, 0.25, 0.3, 0.22, 0.28],
              anxietyHistory: [0.15, 0.18, 0.22, 0.19, 0.21],
              confidenceHistory: [0.8, 0.82, 0.78, 0.85, 0.83],
            ),
          );
          _emotionStreamController?.add(mockEmotion);
        } else {
          timer.cancel();
        }
      });
      return _emotionStreamController!.stream;
    }

    final wsUrl = Uri.parse('$_wsBaseUrl/ws/emotion-stream/');
    _channel = WebSocketChannel.connect(wsUrl);

    _channel!.stream.listen(
      (data) {
        try {
          final decodedData = jsonDecode(data as String);
          final responseModel = EmotionAnalysisResponseModel.fromJson(
            decodedData as Map<String, dynamic>,
          );
          _emotionStreamController?.add(responseModel);
        } catch (e) {
          _emotionStreamController?.addError(
            'Error parsing WebSocket message: $e',
          );
          // Consider more robust error handling/logging
        }
      },
      onError: (error) {
        _emotionStreamController?.addError('WebSocket error: $error');
        // Consider attempting to reconnect or notifying the user
        disconnectFromEmotionStream(); // Clean up on error
      },
      onDone: () {
        _emotionStreamController?.close();
        // Connection closed by the server
      },
      cancelOnError: true,
    );
    return _emotionStreamController!.stream;
  }

  @override
  void sendVideoFrame(String base64Frame) {
    if (_channel != null && _channel?.sink != null) {
      _channel!.sink.add(base64Frame);
    } else {
      // Handle case where channel is not open or already closed
      print("WebSocket channel is not available to send frame.");
    }
  }

  @override
  void disconnectFromEmotionStream() {
    _channel?.sink.close();
    _emotionStreamController?.close();
    _channel = null;
    _emotionStreamController = null;
  }

  @override
  Future<VideoAnalysisResponseModel> analyzeUploadedVideo({
    required File videoFile,
    int? frameSkip,
    int? maxFrames,
  }) async {
    if (_useMockData) {
      // Return mock data for testing
      print('Using mock data for video analysis');
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate processing time

      print('Creating mock VideoAnalysisResponseModel');
      final mockResult = VideoAnalysisResponseModel(
        emotions: {
          'Happy': [0.9, 0.8],
          'Sad': [0.1, 0.2],
        },
        mentalHealth: {'depression': 0.15, 'stress': 0.25, 'anxiety': 0.20},
        voiceAnalysis: {'stress': 0.2, 'anxiety': 0.1},
        frameData: [
          {'time': 0.0, 'stress': 0.2, 'anxiety': 0.1, 'confidence': 0.9},
          {'time': 1.0, 'stress': 0.25, 'anxiety': 0.15, 'confidence': 0.8},
        ],
        peakStress: 0.25,
        videoDuration: 2.0,
      );
      print('Mock result created: $mockResult');
      return mockResult;
    }

    final url = Uri.https(_baseUrl, '/analyze-video/');
    final request = http.MultipartRequest('POST', url);

    try {
      // Add timeout to the request
      request.files.add(
        await http.MultipartFile.fromPath('file', videoFile.path),
      );

      if (frameSkip != null) {
        request.fields['frame_skip'] = frameSkip.toString();
      }
      if (maxFrames != null) {
        request.fields['max_frames'] = maxFrames.toString();
      }

      print('Uploading video to: $url');
      print('Video file path: ${videoFile.path}');
      print('File size: ${await videoFile.length()} bytes');

      final streamedResponse = await request.send().timeout(
        const Duration(minutes: 5), // 5 minute timeout
        onTimeout: () {
          throw Exception('Request timed out after 5 minutes');
        },
      );

      final response = await http.Response.fromStream(streamedResponse);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return VideoAnalysisResponseModel.fromJson(
          decodedData as Map<String, dynamic>,
        );
      } else {
        // Consider more specific error handling based on status code
        throw Exception(
          'Failed to analyze video (status code: ${response.statusCode}): ${response.body}',
        );
      }
    } catch (e) {
      print('Error in analyzeUploadedVideo: $e');
      // Handle network errors, parsing errors etc.
      throw Exception('Error uploading or analyzing video: $e');
    }
  }
}
