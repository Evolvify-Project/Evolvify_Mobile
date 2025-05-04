part of 'recommend_courses_cubit.dart';

sealed class RecommendCoursesState extends Equatable {
  const RecommendCoursesState();

  @override
  List<Object> get props => [];
}

final class RecommendCoursesInitial extends RecommendCoursesState {}

final class RecommendCoursesLosding extends RecommendCoursesState {}

final class RecommendCoursesSuccess extends RecommendCoursesState {
  final List<RecommendCoursesModel> recommendCoursesList;

  const RecommendCoursesSuccess({required this.recommendCoursesList});
}

final class RecommendCoursesFailure extends RecommendCoursesState {
  final String errMessage;

  const RecommendCoursesFailure({required this.errMessage});
}
