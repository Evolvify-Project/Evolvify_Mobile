import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';

import 'package:evolvify/features/Courses/presentation/views/widgets/audio_list.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';

import 'package:evolvify/features/Courses/presentation/views/widgets/video_section.dart';

import 'package:flutter/material.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 12),

                    Center(
                      child: Text(
                        'Course Overview',
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 25,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const VideoSection(),
                    SizedBox(height: 20),
                    Text(
                      'Course Content',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: getResponsiveFontSize(context, fontSize: 25),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const AudioList(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonCoursesBorder(
                            text: 'Save',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: CustomButtonCourses(
                            text: 'Watch now',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
