import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/chatbot _ai/data/models/chat_message_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/speech_to_text_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/text_to_speech_model.dart';

abstract class ChatbotRepo {
  /// Send a text message to the chatbot and get AI response
  Future<Either<Failure, ChatMessageModel>> sendTextMessage(String message);

  /// Convert speech (audio file) to text
  Future<Either<Failure, SpeechToTextModel>> speechToText(File audioFile);

  /// Convert text to speech and return audio data
  Future<Either<Failure, TextToSpeechModel>> textToSpeech(String text);
}
