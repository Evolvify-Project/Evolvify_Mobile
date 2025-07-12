import 'package:equatable/equatable.dart';

class SpeechToTextModel extends Equatable {
  final String? transcription;
  final String? error;

  const SpeechToTextModel({this.transcription, this.error});

  factory SpeechToTextModel.fromJson(Map<String, dynamic> json) =>
      SpeechToTextModel(
        transcription: json['transcription'] as String?,
        error:
            json['detail'] as String?, // Error messages come in 'detail' field
      );

  Map<String, dynamic> toJson() => {
    'transcription': transcription,
    'error': error,
  };

  bool get isSuccess => transcription != null && error == null;

  @override
  List<Object?> get props => [transcription, error];
}
