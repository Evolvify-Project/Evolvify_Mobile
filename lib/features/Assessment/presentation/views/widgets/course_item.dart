import 'dart:convert';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/skills_list.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/title_ofSkill_plan.dart';
import 'package:flutter/material.dart';

class RecommendCourse extends StatelessWidget {
  const RecommendCourse({super.key, required this.recommendCoursesModel});
  final RecommendCoursesModel recommendCoursesModel;
  @override
  Widget build(BuildContext context) {
    List<CoursesModel> courses =
        recommendCoursesModel.courses!
            .map((e) => CoursesModel.fromJson(e))
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleOfSkillPlan(
          title: '${recommendCoursesModel.level ?? ''} Skills',
          color: Color.fromARGB(255, 235, 181, 101),
        ),
        SizedBox(height: 20),
        RecommendedSkillList(courses: courses),
        SizedBox(height: 30),
      ],
    );
  }
}
