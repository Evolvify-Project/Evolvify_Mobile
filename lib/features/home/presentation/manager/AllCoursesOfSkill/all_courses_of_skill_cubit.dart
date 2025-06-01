import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart'
    show CoursesModel;
import 'package:evolvify/features/home/data/repo/home_repo_impl.dart';

part 'all_courses_of_skill_state.dart';

class AllCoursesOfSkillCubit extends Cubit<AllCoursesOfSkillState> {
  AllCoursesOfSkillCubit() : super(AllCoursesOfSkillInitial());

  Future<void> getAllCoursesOfSkill({required skillId}) async {
    emit(AllCoursesOfSkillLosding());
    var courses = await HomeRepoImpl().getAllCoursesOfSkill(skillId: skillId);
    courses.fold(
      (failure) {
        emit(AllCoursesOfSkillFailure(errMessage: failure.errMessge));
      },
      (allCoursesOfSkillList) {
        emit(
          AllCoursesOfSkillSuccess(
            allCoursesOfSkillList: allCoursesOfSkillList,
          ),
        );

        print(allCoursesOfSkillList);
      },
    );
  }
}
