import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
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
          final List contentOfCourse = courseOfodules.contents!;

          // return ListView.builder(
          //   itemBuilder: (BuildContext context, index) {
          //     final contentItem = contentOfCourse[index];
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const SizedBox(height: 15),
          //         Video(urlVideo: ''),
          //         SizedBox(height: 12),
          //         Text(
          //           '  bjhjhvghcfhxdng   ',
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontSize: getResponsiveFontSize(context, fontSize: 20),
          //             fontWeight: FontWeight.bold,
          //           ),
          //           maxLines: 2,
          //         ),
          //         const SizedBox(height: 5),
          //         Text(
          //           ' bhjbhtkb3v',
          //           style: TextStyle(
          //             color: Color(0xff888C94),
          //             fontSize: getResponsiveFontSize(context, fontSize: 14),
          //             fontWeight: FontWeight.bold,
          //           ),
          //           maxLines: 2,
          //         ),
          //         const SizedBox(height: 5),
          //         Text(
          //           '(${'hjfbhvg'})',
          //           style: const TextStyle(color: Color(0xffFF001E)),
          //         ),
          //         const SizedBox(height: 8),
          //         Divider(height: 24, color: Color(0xff8C8C8C), thickness: 2),
          //         Text(
          //           'What you’ll learn in this video:',
          //           style: TextStyle(
          //             color: AppColors.kPrimaryColor,

          //             fontSize: getResponsiveFontSize(context, fontSize: 20),
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //         SizedBox(height: 20),
          //         Text(
          //           'What you’ll learn in this video:',
          //           style: TextStyle(
          //             color: AppColors.kPrimaryColor,

          //             fontSize: getResponsiveFontSize(context, fontSize: 20),
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //         SizedBox(height: 20),
          //         Text(
          //           '',
          //           style: TextStyle(
          //             color: AppColors.kPrimaryColor,

          //             fontSize: getResponsiveFontSize(context, fontSize: 20),
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Video(urlVideo: ''),
              SizedBox(height: 12),
              Text(
                courseOfodules.title ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                ' bhjbhtkb3v',
                style: TextStyle(
                  color: Color(0xff888C94),
                  fontSize: getResponsiveFontSize(context, fontSize: 14),
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                '(${'hjfbhvg'})',
                style: const TextStyle(color: Color(0xffFF001E)),
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

              SizedBox(height: 20),
              Text(
                '',
                style: TextStyle(
                  color: Colors.black,

                  fontSize: getResponsiveFontSize(context, fontSize: 20),
                  fontWeight: FontWeight.w400,
                ),
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
