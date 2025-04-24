import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:flutter/material.dart';

class AssessmentView extends StatelessWidget {
  const AssessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                // color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'This assessment will help you discover \n'
              '     your creative potential and identify \n'
              ' ways to develop your skills to enhance \n '
              '                                  your abilities.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 170),
            CustomButtonCourses(text: 'Get Start'),
          ],
        ),
      ),
    );
  }
}
