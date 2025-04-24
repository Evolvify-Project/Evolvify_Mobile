import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/circular_row.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/question_section.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';

import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                ArrowBackButton(),
                Spacer(flex: 1),
                CutomTitle(title: 'Test your skills     '),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: 25),
            CircularRow(),
            SizedBox(height: 35),
            QuestionSection(),
            SizedBox(height: 75),
            Row(
              children: [
                Expanded(
                  child: CustomButtonCoursesBorder(
                    text: 'Back',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: CustomButtonCourses(
                    text: 'Continue',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
