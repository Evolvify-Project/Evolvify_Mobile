part of 'all_courses_of_skill_cubit.dart';

sealed class AllCoursesOfSkillState extends Equatable {
  const AllCoursesOfSkillState();

  @override
  List<Object> get props => [];
}

final class AllCoursesOfSkillInitial extends AllCoursesOfSkillState {}

final class AllCoursesOfSkillLosding extends AllCoursesOfSkillState {}

final class AllCoursesOfSkillSuccess extends AllCoursesOfSkillState {
  final List<CoursesModel> allCoursesOfSkillList;

  const AllCoursesOfSkillSuccess({required this.allCoursesOfSkillList});
}

final class AllCoursesOfSkillFailure extends AllCoursesOfSkillState {
  final String errMessage;

  const AllCoursesOfSkillFailure({required this.errMessage});
}
