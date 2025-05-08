part of 'modules_cubit.dart';

sealed class ModulesState extends Equatable {
  const ModulesState();

  @override
  List<Object> get props => [];
}
final class ModulesInitial extends ModulesState {}

final class ModulesLosding extends ModulesState {}

final class ModulesSuccess extends ModulesState {
  final List<ModulesOfCourse> modulesOfCourseList;

  const ModulesSuccess({required this.modulesOfCourseList});
}

final class ModulesFailure extends ModulesState {
  final String errMessage;

  const ModulesFailure({required this.errMessage});
}
