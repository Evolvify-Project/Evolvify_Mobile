part of 'courses_cubit.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}

final class CoursesLosding extends CoursesState {}

final class CoursesSuccess extends  CoursesState {
  final List<CoursesModel> coursesList;

 const CoursesSuccess({required this.coursesList});


}

final class  CoursesFailure extends  CoursesState {
  final String errMessage;

const  CoursesFailure({required this.errMessage});

 
}