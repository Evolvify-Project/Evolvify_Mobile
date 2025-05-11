part of 'modules_of_course_cubit.dart';

sealed class ModulesOfCourseState extends Equatable {
  const ModulesOfCourseState();

  @override
  List<Object> get props => [];
}

final class ModulesOfCourseInitial extends ModulesOfCourseState {}

final class ModulesOfCourseLosding extends ModulesOfCourseState {}

final class ModulesOfCourseSuccess extends ModulesOfCourseState {
  final ModulesOfCourse modulesOfCourse;

  const ModulesOfCourseSuccess({required this.modulesOfCourse});
}

final class ModulesOfCourseFailure extends ModulesOfCourseState {
  final String errMessage;

  const ModulesOfCourseFailure({required this.errMessage});
}
