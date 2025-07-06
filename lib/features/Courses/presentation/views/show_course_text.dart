import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/articles_details.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';

class ShowCourseText extends StatelessWidget {
  const ShowCourseText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            CutsomArrowios(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  ArticlesDetails(),

                  SizedBox(height: 80),
                  CustomButtonBorder(
                    title: 'Continue to next lesson',
                    verticalPadding: 13,
                  ),
                  SizedBox(height: 20),
                  // CustomButton(title: 'Quick Quiz', verticalPadding: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
