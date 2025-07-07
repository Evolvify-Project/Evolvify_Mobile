import 'package:equatable/equatable.dart';

import 'score.dart';

class QuizScoreModel extends Equatable {
  final Score? score;
  final String? percentage;

  const QuizScoreModel({this.score, this.percentage});

  factory QuizScoreModel.fromJson(Map<String, dynamic> json) {
    return QuizScoreModel(
      score:
          json['score'] == null
              ? null
              : Score.fromJson(json['score'] as Map<String, dynamic>),
      percentage: json['percentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'score': score?.toJson(),
    'percentage': percentage,
  };

  @override
  List<Object?> get props => [score, percentage];
}
