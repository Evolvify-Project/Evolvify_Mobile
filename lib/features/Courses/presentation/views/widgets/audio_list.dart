import 'package:evolvify/core/utils/app_router.dart';

import 'package:evolvify/features/Courses/presentation/manager/ModulesOfCourse/modules_of_course_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/audio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AudioList extends StatelessWidget {
  const AudioList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulesOfCourseCubit, ModulesOfCourseState>(
      builder: (context, state) {
        if (state is ModulesOfCourseLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ModulesOfCourseSuccess) {
          final modulesOfCourse = state.modulesOfCourse;

          final modulesList = modulesOfCourse.modules!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: modulesList.length,
            itemBuilder: (context, index) {
              return AudioItem(
                module: modulesList[index],
                onTap: () {
                  final contentType = modulesList[index].contentType;
                  if (contentType == "Video") {
                    GoRouter.of(context).push(
                      AppRouter.kShowCourse,
                      extra: {
                        'moduleId': modulesList[index].id,
                        'courseId': modulesOfCourse.id,
                      },
                    );
                  } else if (contentType == "Text" ||
                      contentType == "Article") {
                    GoRouter.of(context).push(AppRouter.kShowCourseText);
                  } else {
                    GoRouter.of(context).push(
                      AppRouter.kShowCourse,
                      extra: {
                        'moduleId': modulesList[index].id,
                        'courseId': modulesOfCourse.id,
                      },
                    );
                  }
                },
              );
            },
          );
        } else if (state is ModulesOfCourseFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Text(' No Courses availble');
      },
    );
  }
}
