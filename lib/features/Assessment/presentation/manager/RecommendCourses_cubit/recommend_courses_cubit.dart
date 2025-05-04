import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';
import 'package:evolvify/features/Assessment/data/repo/assessment_repo_impl.dart';

part 'recommend_courses_state.dart';

class RecommendCoursesCubit extends Cubit<RecommendCoursesState> {
  RecommendCoursesCubit() : super(RecommendCoursesInitial());
  Future<void> getRecommendCourses() async {
    emit(RecommendCoursesLosding());
    var questions = await AssessmentRepoImpl().getRecommendCourses();
    questions.fold(
      (failure) {
        emit(RecommendCoursesFailure(errMessage: failure.errMessge));
      },
      (recommendCourses) {
        emit(RecommendCoursesSuccess(recommendCoursesList: recommendCourses));
        print(recommendCourses);
      },
    );
  }
}
