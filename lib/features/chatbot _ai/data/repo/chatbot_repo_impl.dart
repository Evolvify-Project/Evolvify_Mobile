import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';

import 'package:evolvify/features/chatbot _ai/data/models/chat_message_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/speech_to_text_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/text_to_speech_model.dart';
import 'package:evolvify/features/chatbot _ai/data/repo/chatbot_repo.dart';

class ChatbotRepoImpl implements ChatbotRepo {
  final Dio _dio = Dio();

  @override
  Future<Either<Failure, ChatMessageModel>> sendTextMessage(
    String message,
  ) async {
    try {
      final response = await _dio.post(
        'https://moodydev-evolva.hf.space/api/chat',
        data: {'message': message},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return right(ChatMessageModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SpeechToTextModel>> speechToText(
    File audioFile,
  ) async {
    try {
      // Create FormData for multipart/form-data request
      final formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(
          audioFile.path,
          filename: audioFile.path.split('/').last,
        ),
      });

      final response = await _dio.post(
        'https://moodydev-evolva.hf.space/api/speech-to-text',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      return right(SpeechToTextModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TextToSpeechModel>> textToSpeech(String text) async {
    try {
      final response = await _dio.post(
        'https://moodydev-evolva.hf.space/api/text-to-speech',
        data: {'text': text},
        options: Options(
          headers: {'Content-Type': 'application/json'},
          responseType: ResponseType.bytes, // Expect binary audio data
        ),
      );

      // Check if response is successful and contains audio data
      if (response.statusCode == 200 && response.data is List<int>) {
        return right(TextToSpeechModel.response(response.data as List<int>));
      } else {
        // Try to parse error response
        try {
          final errorData = response.data as Map<String, dynamic>;
          return right(
            TextToSpeechModel.error(errorData['detail'] ?? 'Unknown error'),
          );
        } catch (_) {
          return right(TextToSpeechModel.error('Failed to generate speech'));
        }
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
