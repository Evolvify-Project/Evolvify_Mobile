part of 'skill_cubit.dart';

sealed class SkillState extends Equatable {
  const SkillState();

  @override
  List<Object> get props => [];
}

final class SkillInitial extends SkillState {}

final class SkillLosding extends SkillState {}

final class SkillSuccess extends SkillState {
  final List<SkillModel> skillList;

  const SkillSuccess({required this.skillList});
}

final class SkillFailure extends SkillState {
  final String errMessage;

  const SkillFailure({required this.errMessage});
}