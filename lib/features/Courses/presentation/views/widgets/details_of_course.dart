import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Courses/data/models/modules/all_modules/content.dart';
import 'package:evolvify/features/Courses/presentation/manager/Courses-of_module_cubit/modules_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsOfCourse extends StatelessWidget {
  const DetailsOfCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulesCubit, ModulesState>(
      builder: (context, state) {
        if (state is ModulesLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ModulesSuccess) {
          final courseOfodules = state.allCoursesModule;
          final List<Content> contentOfCourse = courseOfodules.contents!;
          final courseContent = contentOfCourse[0];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseOfodules.title ?? '',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,

                  fontSize: getResponsiveFontSize(context, fontSize: 21),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Video(urlVideo: courseContent.url ?? ''),
              SizedBox(height: 12),
              Text(
                courseContent.title ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),

              const SizedBox(height: 8),
              Divider(height: 24, color: Color(0xff8C8C8C), thickness: 2),
              Text(
                'What you’ll learn in this video:',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,

                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' • ',

                    style: TextStyle(
                      color: Colors.black,

                      fontSize: getResponsiveFontSize(context, fontSize: 30),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' ${courseContent.text ?? ''}',
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: getResponsiveFontSize(context, fontSize: 20),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is ModulesFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Text(' No Courses availble');
      },
    );
  }
}
