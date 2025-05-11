import 'package:evolvify/core/utils/app_style.dart';

import 'package:evolvify/features/Courses/presentation/manager/ModulesOfCourse/modules_of_course_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulesOfCourseCubit, ModulesOfCourseState>(
      builder: (context, state) {
        if (state is ModulesOfCourseLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ModulesOfCourseSuccess) {
          final modulesOfCourse = state.modulesOfCourse;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Video(),
              const SizedBox(height: 15),
              Text(
                modulesOfCourse.title ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                modulesOfCourse.description ?? '',
                style: TextStyle(
                  color: Color(0xff888C94),
                  fontSize: getResponsiveFontSize(context, fontSize: 14),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                '(${modulesOfCourse.level})',
                style: const TextStyle(color: Color(0xffFF001E)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    modulesOfCourse.duration ?? '',
                    style: TextStyle(
                      color: const Color(0xff888C94),
                      fontSize: getResponsiveFontSize(context, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '${modulesOfCourse.numberOfModules} Lessons',
                    style: TextStyle(
                      color: const Color(0xff888C94),
                      fontSize: getResponsiveFontSize(context, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is ModulesOfCourseFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Text(' No Courses availble');
      },
    );
  }
}
