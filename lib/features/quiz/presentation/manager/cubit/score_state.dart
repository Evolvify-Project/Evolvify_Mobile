part of 'score_cubit.dart';

sealed class ScoreState extends Equatable {
  const ScoreState();

  @override
  List<Object> get props => [];
}

final class ScoreInitial extends ScoreState {}

final class ScoreLoading extends ScoreState {}

final class ScoreSuccess extends ScoreState {
  final Score score;

  const ScoreSuccess({required this.score});
}

final class ScoreFailure extends ScoreState {
  final String errMessage;

  const ScoreFailure({required this.errMessage});
}
