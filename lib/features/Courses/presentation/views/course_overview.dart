import 'package:evolvify/core/utils/constant.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Color(0xff292D32),
              ),
            ),
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
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const VideoSection(),
                    SizedBox(height: 20),
                    const Text(
                      'Course Content',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const AudioList(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonCoursesBorder(text: 'Save'),
                        ),
                        SizedBox(width: 16),
                        Expanded(child: CustomButtonCourses(text: 'Watch now')),
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
