import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/data/repo/home_repo_impl.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());
  
  Future<void> getgetMostWatchingSkill() async {
    emit(CoursesLosding());
    var courses = await HomeRepoImpl().getMostWatchingSkill();
    courses.fold(
      (failure) {
        emit(CoursesFailure(errMessage: failure.errMessge));
      },
      (coursesList) {
        emit(CoursesSuccess(coursesList:coursesList));
        print(coursesList);
      },
    );
  }
}
