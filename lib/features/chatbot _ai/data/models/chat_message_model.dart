import 'package:equatable/equatable.dart';

class ChatMessageModel extends Equatable {
  final String? message;
  final String? response;
  final DateTime? timestamp;
  final bool isUserMessage;

  const ChatMessageModel({
    this.message,
    this.response,
    this.timestamp,
    required this.isUserMessage,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        message: json['message'] as String?,
        response:
            json['message'] as String?, // API returns 'message' for AI response
        timestamp:
            json['timestamp'] != null
                ? DateTime.parse(json['timestamp'] as String)
                : DateTime.now(),
        isUserMessage: false, // API responses are always AI messages
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'timestamp': timestamp?.toIso8601String(),
  };

  // Factory for creating user messages
  factory ChatMessageModel.userMessage(String message) => ChatMessageModel(
    message: message,
    timestamp: DateTime.now(),
    isUserMessage: true,
  );

  // Factory for creating AI response messages
  factory ChatMessageModel.aiResponse(String response) => ChatMessageModel(
    response: response,
    timestamp: DateTime.now(),
    isUserMessage: false,
  );

  @override
  List<Object?> get props => [message, response, timestamp, isUserMessage];
}
