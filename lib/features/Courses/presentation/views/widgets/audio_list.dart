import 'package:evolvify/features/Courses/presentation/manager/ModulesOfCourse/modules_of_course_cubit.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/audio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return AudioItem(module: modulesList[index]);
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
