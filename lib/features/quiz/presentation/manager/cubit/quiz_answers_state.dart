part of 'quiz_answers_cubit.dart';

sealed class QuizAnswersState extends Equatable {
  const QuizAnswersState();

  @override
  List<Object> get props => [];
}

final class QuizAnswersInitial extends QuizAnswersState {}

final class QuizAnswersloading extends QuizAnswersState {}

final class QuizAnswersSuccess extends QuizAnswersState {}

final class QuizAnswersFailure extends QuizAnswersState {
  final String errMessage;

 const QuizAnswersFailure({required this.errMessage});
}
