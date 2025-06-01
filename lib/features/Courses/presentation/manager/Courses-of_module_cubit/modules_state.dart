part of 'modules_cubit.dart';

sealed class ModulesState extends Equatable {
  const ModulesState();

  @override
  List<Object> get props => [];
}

final class ModulesInitial extends ModulesState {}

final class ModulesLosding extends ModulesState {}

final class ModulesSuccess extends ModulesState {
  final CoursesOfModuleModel allCoursesModule;

  const ModulesSuccess({required this.allCoursesModule});
}

final class ModulesFailure extends ModulesState {
  final String errMessage;

  const ModulesFailure({required this.errMessage});
}
