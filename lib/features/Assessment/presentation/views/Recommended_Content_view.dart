import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';
import 'package:evolvify/features/Assessment/presentation/manager/RecommendCourses_cubit/recommend_courses_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/recommend_course_list.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/skills_list.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/title_ofSkill_plan.dart';
import 'package:flutter/material.dart';

class RecommendedContentView extends StatelessWidget {
  const RecommendedContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CutsomArrowios(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CutomTitle(title: 'Your  Recommended Plan'),
            ),
            SizedBox(height: 20),
            RecommendCourseList(),
          ],
        ),
      ),
    );
  }
}
