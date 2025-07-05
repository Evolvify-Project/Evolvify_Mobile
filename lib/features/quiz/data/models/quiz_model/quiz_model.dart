import 'package:equatable/equatable.dart';

import 'answer.dart';

class QuizModel extends Equatable {
  final int? id;
  final int? questionNumber;
  final String? questionText;
  final int? quizId;
  final List<Answer>? answers;

  const QuizModel({
    this.id,
    this.questionNumber,
    this.questionText,
    this.quizId,
    this.answers,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json['id'] as int?,
    questionNumber: json['questionNumber'] as int?,
    questionText: json['questionText'] as String?,
    quizId: json['quizId'] as int?,
    answers:
        (json['answers'] as List<dynamic>?)
            ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'questionNumber': questionNumber,
    'questionText': questionText,
    'quizId': quizId,
    'answers': answers?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [id, questionNumber, questionText, quizId, answers];
  }
}
