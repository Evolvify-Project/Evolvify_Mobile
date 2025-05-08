import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AssessmentView extends StatelessWidget {
  const AssessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesAssessmentBackground),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 300),
              Spacer(flex: 3),
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(
                    context,
                    fontSize: getResponsiveFontSize(context, fontSize: 40),
                  ),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32),
              // Spacer(flex: 1),
              Text(
                'This assessment will help you discover \n'
                '     your creative potential and identify \n'
                ' ways to develop your skills to enhance \n '
                '                                  your abilities.',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 19),
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 170),
              // Spacer(flex: 2),
              CustomButtonCourses(
                text: 'Get Start',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kTestView);
                },
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
