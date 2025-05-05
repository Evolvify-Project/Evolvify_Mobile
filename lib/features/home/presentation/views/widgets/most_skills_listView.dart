import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/presentation/manager/Courses_cubit/courses_cubit.dart';
import 'package:evolvify/features/home/presentation/views/widgets/most_watching_Item.dart'
 show MostWatchingItem;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostSkillsListView extends StatelessWidget {
  const MostSkillsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CoursesSuccess) {
          final List<CoursesModel> coursesList = state.coursesList;
          print(coursesList);
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coursesList.length,
              itemBuilder: (buildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: MostWatchingItem(coursesModel: coursesList[index]),
                );
              },
            ),
          );
        } else if (state is CoursesFailure) {
          return Center(child: Text(state.errMessage.toString()));
        }
        return Center(child: Text('No courses available.'));
      },
    );
  }
}
