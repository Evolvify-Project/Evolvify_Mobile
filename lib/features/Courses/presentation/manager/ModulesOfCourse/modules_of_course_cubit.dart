import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Courses/data/models/modules/modules_of_course.dart';
import 'package:evolvify/features/Courses/data/repo/courses_repo_impl.dart';
part 'modules_of_course_state.dart';

class ModulesOfCourseCubit extends Cubit<ModulesOfCourseState> {
  ModulesOfCourseCubit() : super(ModulesOfCourseInitial());
  Future<void> getModulesOfCourse({required int id}) async {
    emit(ModulesOfCourseLosding());
    var modulesOfCourse = await CoursesRepoImpl().getModulesOfCourse(id: id);
    modulesOfCourse.fold(
      (failure) {
        emit(ModulesOfCourseFailure(errMessage: failure.errMessge));
      },
      (modulesOfCourse) {
        emit(ModulesOfCourseSuccess(modulesOfCourse: modulesOfCourse));
        print(modulesOfCourse);
      },
    );
  }
}
