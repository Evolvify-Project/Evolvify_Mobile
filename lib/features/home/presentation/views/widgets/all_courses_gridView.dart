import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/presentation/views/widgets/course_item.dart';
import 'package:flutter/material.dart';

class AllCoursesGridView extends StatelessWidget {
  const AllCoursesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.3 / 3,
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return CourseItem(coursesModel: CoursesModel());
      },
    );
  }
}
