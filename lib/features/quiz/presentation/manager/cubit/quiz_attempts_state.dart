part of 'quiz_attempts_cubit.dart';

sealed class QuizAttemptsState extends Equatable {
  const QuizAttemptsState();

  @override
  List<Object> get props => [];
}

final class QuizAttemptsInitial extends QuizAttemptsState {}

final class QuizAttemptsloading extends QuizAttemptsState {}

final class QuizAttemptsSuccess extends QuizAttemptsState {
  final int quizAttemptId;

  const QuizAttemptsSuccess({required this.quizAttemptId});
}

final class QuizAttemptsFailure extends QuizAttemptsState {
  final String errMessage;

  const QuizAttemptsFailure({required this.errMessage});
}
