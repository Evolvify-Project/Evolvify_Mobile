import 'package:equatable/equatable.dart';

class Score extends Equatable {
  final int? correct;
  final int? total;

  const Score({this.correct, this.total});

  factory Score.fromJson(Map<String, dynamic> json) =>
      Score(correct: json['correct'] as int?, total: json['total'] as int?);

  Map<String, dynamic> toJson() => {'correct': correct, 'total': total};

  @override
  List<Object?> get props => [correct, total];
}
