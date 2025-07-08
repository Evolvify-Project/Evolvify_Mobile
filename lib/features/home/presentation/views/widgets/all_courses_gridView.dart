import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/presentation/manager/AllCoursesOfSkill/all_courses_of_skill_cubit.dart';
import 'package:evolvify/features/home/presentation/views/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesGridView extends StatelessWidget {
  const AllCoursesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCoursesOfSkillCubit, AllCoursesOfSkillState>(
      builder: (context, state) {
        if (state is AllCoursesOfSkillLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AllCoursesOfSkillSuccess) {
          final List<CoursesModel> allCoursesOfSkillList =
              state.allCoursesOfSkillList;
          print(allCoursesOfSkillList);
          return Column(
            children: [
              Center(
                child: Text(
                  '${allCoursesOfSkillList[0].skill} Courses',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,

                    fontSize: getResponsiveFontSize(context, fontSize: 25),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              GridView.builder(
                itemCount: allCoursesOfSkillList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3 / 1.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  return CourseItem(coursesModel: allCoursesOfSkillList[index],);
                },
              ),
            ],
          );
        } else if (state is AllCoursesOfSkillFailure) {
          return Center(child: Text(state.errMessage.toString()));
        }
        return Center(child: Text('No search Result.'));
      },
    );
  }
}
