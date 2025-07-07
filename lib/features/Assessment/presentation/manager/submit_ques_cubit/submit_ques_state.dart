part of 'submit_ques_cubit.dart';

sealed class SubmitQuesState extends Equatable {
  const SubmitQuesState();

  @override
  List<Object> get props => [];
}

final class SubmitQuesInitial extends SubmitQuesState {}

final class SubmitQuesLoading extends SubmitQuesState {}

final class SubmitQuesSucess extends SubmitQuesState {
  final List<SkillResult> results;

const  SubmitQuesSucess({required this.results});
}

final class SubmitQuesFailure extends SubmitQuesState {
  final String errMessage;

  const SubmitQuesFailure({required this.errMessage});
}
