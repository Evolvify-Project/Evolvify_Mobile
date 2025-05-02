part of 'question_cubit.dart';

sealed class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

final class QuestionInitial extends QuestionState {}

final class QuestionLosding extends QuestionState {}

final class QuestionSuccess extends QuestionState {
  final List questionsList;

  const QuestionSuccess({required this.questionsList});
}

final class QuestionFailure extends QuestionState {
  final String errMessage;

  const QuestionFailure({required this.errMessage});
}
