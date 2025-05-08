import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Courses/data/models/modules/modules_of_course.dart';
import 'package:evolvify/features/Courses/data/repo/courses_repo_impl.dart';

part 'modules_state.dart';

class ModulesCubit extends Cubit<ModulesState> {
  ModulesCubit() : super(ModulesInitial());
  Future<void> getModulesOfCourse({required id}) async {
    emit(ModulesLosding());
    var modulesOfCourse = await CoursesRepoImpl().getModulesOfCourse(id: id);
    modulesOfCourse.fold(
      (failure) {
        emit(ModulesFailure(errMessage: failure.errMessge));
      },
      (modulesOfCourseList) {
        emit(ModulesSuccess(modulesOfCourseList: modulesOfCourseList));
        print(modulesOfCourseList);
      },
    );
  }
}
