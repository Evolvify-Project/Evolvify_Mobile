import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';
import 'package:evolvify/features/Assessment/presentation/manager/RecommendCourses_cubit/recommend_courses_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendCourseList extends StatelessWidget {
  const RecommendCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendCoursesCubit, RecommendCoursesState>(
      builder: (context, state) {
        if (state is RecommendCoursesLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecommendCoursesSuccess) {
          final List<RecommendCoursesModel> recommededCourses =
              state.recommendCoursesList;
          print(recommededCourses);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: recommededCourses.length,
            itemBuilder: (context, index) {
              return RecommendCourse(
                recommendCoursesModel: recommededCourses[index],
              );
            },
          );
        } else if (state is RecommendCoursesFailure) {
          return Center(child: Text(state.errMessage.toString()));
        }
        return Center(child: Text('No courses available.'));
      },
    );
  }
}
