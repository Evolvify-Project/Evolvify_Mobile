import 'package:equatable/equatable.dart';

class TextToSpeechModel extends Equatable {
  final String? text;
  final List<int>? audioData;
  final String? error;

  const TextToSpeechModel({this.text, this.audioData, this.error});

  factory TextToSpeechModel.fromJson(Map<String, dynamic> json) =>
      TextToSpeechModel(
        text: json['text'] as String?,
        error:
            json['detail'] as String?, // Error messages come in 'detail' field
      );

  // Factory for creating request model
  factory TextToSpeechModel.request(String text) =>
      TextToSpeechModel(text: text);

  // Factory for creating response model with audio data
  factory TextToSpeechModel.response(List<int> audioData) =>
      TextToSpeechModel(audioData: audioData);

  // Factory for creating error response model
  factory TextToSpeechModel.error(String error) =>
      TextToSpeechModel(error: error);

  Map<String, dynamic> toJson() => {'text': text, 'error': error};

  bool get isSuccess => audioData != null && error == null;

  @override
  List<Object?> get props => [text, audioData, error];
}
