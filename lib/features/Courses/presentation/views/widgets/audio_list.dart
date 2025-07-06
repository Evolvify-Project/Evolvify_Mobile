import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';

import 'package:evolvify/features/Courses/presentation/manager/ModulesOfCourse/modules_of_course_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/audio_item.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/show_course_complete.dart';
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
          final int lastIndex = modulesList.length - 1;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: modulesList.length,
            itemBuilder: (context, index) {
              final contentType = modulesList[index].contentType;

              return AudioItem(
                image: switch (contentType) {
                  "Video" => Assets.imagesVideoIcon,
                  "Text" => Assets.imagesText,
                  "Article" => Assets.imagesArticle,
                  "Pdf" => Assets.imagesPdf,
                  _ => Assets.imagesVideoIcon,
                },
                module: modulesList[index],
                onTap: () {
                  final isLast = index == lastIndex;

                 
                  if (contentType == "Video") {
                    GoRouter.of(context).push(
                      AppRouter.kShowCourse,
                      extra: {
                        'moduleId': modulesList[index].id,
                        'courseId': modulesOfCourse.id,
                      },
                    );
                  } else if (contentType == "Text" || contentType == "Article") {
                    GoRouter.of(context).push(
                      AppRouter.kShowCourseText,
                      extra: {
                        'moduleId': modulesList[index].id,
                        'courseId': modulesOfCourse.id,
                      },
                    );
                  } else {
                    GoRouter.of(context).push(
                      AppRouter.kShowCourse,
                      extra: {
                        'moduleId': modulesList[index].id,
                        'courseId': modulesOfCourse.id,
                      },
                    );
                  }

                  
                  if (isLast) {
                    Future.delayed(Duration(milliseconds: 300), () {
                      showCourseComplete(context);
                    });
                  }
                },
              );
            },
          );
        } else if (state is ModulesOfCourseFailure) {
          return Center(child: Text(state.errMessage));
        }

        return Text('No Courses available');
      },
    );
  }
}
