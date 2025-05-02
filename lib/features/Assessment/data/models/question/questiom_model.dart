import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'choices.dart';

class QuestionModel extends Equatable {
  final String? questionId;
  final String? code;
  final String? questionText;
  final Choices? choices;

  const QuestionModel({
    this.questionId,
    this.code,
    this.questionText,
    this.choices,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    questionId: json['questionId'] as String?,
    code: json['code'] as String?,
    questionText: json['questionText'] as String?,
    choices:
        json['choices'] == null
            ? null
            : Choices.fromMap(json['choices'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'questionId': questionId,
    'code': code,
    'questionText': questionText,
    'choices': choices?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory QuestionModel.fromMap(String data) {
    return QuestionModel.fromJson(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [questionId, code, questionText, choices];
}
