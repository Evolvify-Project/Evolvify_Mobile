import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/details_of_course.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';

class ShowCourseVideo extends StatelessWidget {
  const ShowCourseVideo({super.key});

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

                  DetailsOfCourse(),

                  SizedBox(height: 70),
                  CustomButtonBorder(
                    title: 'Continue to next lesson',
                    verticalPadding: 13,
                  ),
                  SizedBox(height: 20),
                  // CustomButton(
                  //   title: 'Quick Quiz',
                  //   verticalPadding: 14,
                  //   onTap: () {
                  //     GoRouter.of(context).push(AppRouter.kQuizView, extra: 1);
                  //   },
                  // ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
