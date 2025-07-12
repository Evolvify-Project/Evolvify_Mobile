import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:evolvify/features/chatbot _ai/data/models/chat_message_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/speech_to_text_model.dart';
import 'package:evolvify/features/chatbot _ai/data/models/text_to_speech_model.dart';
import 'package:evolvify/features/chatbot _ai/data/repo/chatbot_repo_impl.dart';
import 'package:meta/meta.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotRepoImpl _repository;
  List<ChatMessageModel> _messages = [];

  ChatbotCubit(this._repository) : super(ChatbotInitial());

  List<ChatMessageModel> get messages => _messages;

  /// Send a text message to the chatbot
  Future<void> sendTextMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Add user message to the list
    final userMessage = ChatMessageModel.userMessage(message);
    _messages.add(userMessage);
    if (!isClosed) {
      emit(ChatbotMessagesUpdated(messages: List.from(_messages)));
    }

    // Send to API and get response
    if (!isClosed) {
      emit(ChatbotLoading());
    }

    final result = await _repository.sendTextMessage(message);

    if (!isClosed) {
      result.fold(
        (failure) {
          emit(ChatbotError(message: failure.errMessge));
        },
        (aiResponse) {
          _messages.add(aiResponse);
          emit(ChatbotMessagesUpdated(messages: List.from(_messages)));
        },
      );
    }
  }

  /// Convert speech to text
  Future<void> convertSpeechToText(File audioFile) async {
    if (!isClosed) {
      emit(ChatbotLoading());
    }

    final result = await _repository.speechToText(audioFile);

    if (!isClosed) {
      result.fold(
        (failure) {
          emit(ChatbotError(message: failure.errMessge));
        },
        (speechResult) {
          if (speechResult.isSuccess) {
            // Add the transcribed text as a user message
            final userMessage = ChatMessageModel.userMessage(
              speechResult.transcription!,
            );
            _messages.add(userMessage);
            emit(ChatbotMessagesUpdated(messages: List.from(_messages)));

            // Send the transcribed text to get AI response
            sendTextMessage(speechResult.transcription!);
          } else {
            emit(
              ChatbotError(
                message: speechResult.error ?? 'Failed to transcribe speech',
              ),
            );
          }
        },
      );
    }
  }

  /// Convert text to speech
  Future<void> convertTextToSpeech(String text) async {
    if (!isClosed) {
      emit(ChatbotLoading());
    }

    final result = await _repository.textToSpeech(text);

    if (!isClosed) {
      result.fold(
        (failure) {
          emit(ChatbotError(message: failure.errMessge));
        },
        (speechResult) {
          if (speechResult.isSuccess) {
            emit(
              ChatbotTextToSpeechSuccess(audioData: speechResult.audioData!),
            );
          } else {
            emit(
              ChatbotError(
                message: speechResult.error ?? 'Failed to generate speech',
              ),
            );
          }
        },
      );
    }
  }

  /// Clear all messages
  void clearMessages() {
    _messages.clear();
    if (!isClosed) {
      emit(ChatbotMessagesUpdated(messages: List.from(_messages)));
    }
  }

  /// Reset to initial state
  void reset() {
    _messages.clear();
    if (!isClosed) {
      emit(ChatbotInitial());
    }
  }
}
