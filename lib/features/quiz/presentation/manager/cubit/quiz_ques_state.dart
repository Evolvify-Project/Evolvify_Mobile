part of 'quiz_ques_cubit.dart';

sealed class QuizQuesState extends Equatable {
  const QuizQuesState();

  @override
  List<Object> get props => [];
}

final class QuizQuesInitial extends QuizQuesState {}

final class QuizQuesLoading extends QuizQuesState {}

final class QuizQuesSuccess extends QuizQuesState {
  final List<QuizModel> quizQues;

  const QuizQuesSuccess({required this.quizQues});
}

final class QuizQuesFailure extends QuizQuesState {
  final String errMessage;

  const QuizQuesFailure({required this.errMessage});
}
