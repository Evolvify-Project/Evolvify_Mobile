part of 'chatbot_cubit.dart';

abstract class ChatbotState {
  const ChatbotState();

  @override
  List<Object> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class ChatbotMessagesUpdated extends ChatbotState {
  final List<ChatMessageModel> messages;

  const ChatbotMessagesUpdated({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatbotTextToSpeechSuccess extends ChatbotState {
  final List<int> audioData;

  const ChatbotTextToSpeechSuccess({required this.audioData});

  @override
  List<Object> get props => [audioData];
}

class ChatbotError extends ChatbotState {
  final String message;

  const ChatbotError({required this.message});

  @override
  List<Object> get props => [message];
}
