import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int? id;
  final String? answerText;
  final bool? isCorrect;

  const Answer({this.id, this.answerText, this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json['id'] as int?,
    answerText: json['answerText'] as String?,
    isCorrect: json['isCorrect'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'answerText': answerText,
    'isCorrect': isCorrect,
  };

  @override
  List<Object?> get props => [id, answerText, isCorrect];
}
