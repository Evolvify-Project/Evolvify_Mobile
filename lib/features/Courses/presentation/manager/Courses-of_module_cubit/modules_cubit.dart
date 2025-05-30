import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Courses/data/models/modules/all_modules/courses_module.dart';
import 'package:evolvify/features/Courses/data/repo/courses_repo_impl.dart';
part 'modules_state.dart';

class ModulesCubit extends Cubit<ModulesState> {
  ModulesCubit() : super(ModulesInitial());
  Future<void> getAllModules({
    required int courseId,
    required int moduleId,
  }) async {
    emit(ModulesLosding());
    var allModules = await CoursesRepoImpl().getAllCoursesOfModule(
      courseId: courseId,
      moduleId: moduleId,
    );
    allModules.fold(
      (failure) {
        emit(ModulesFailure(errMessage: failure.errMessge));
      },
      (allModuless) {
        emit(ModulesSuccess(allCoursesModule: allModuless));
      },
    );
  }
}
