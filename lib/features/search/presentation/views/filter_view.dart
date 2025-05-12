import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/widgets/duration_list.dart';
import 'package:evolvify/features/search/presentation/views/widgets/filter_text.dart';
import 'package:evolvify/features/search/presentation/views/widgets/level_list.dart';
import 'package:evolvify/features/search/presentation/views/widgets/skill_list.dart';
import 'package:evolvify/features/search/presentation/views/widgets/sort_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 25,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    FilterText(text: 'Level'),
                    SizedBox(height: 15),
                    LevelListView(),
                    SizedBox(height: 35),
                    FilterText(text: 'Skill'),
                    SizedBox(height: 15),

                    SkillList(),

                    SizedBox(height: 35),
                    FilterText(text: 'Sort by'),
                    SizedBox(height: 15),

                    SortList(),
                    SizedBox(height: 35),

                    FilterText(text: 'Duration'),
                    SizedBox(height: 15),
                    DurationList(),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonCoursesBorder(
                            text: 'Reset',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: CustomButtonCourses(
                            text: 'Apply',
                            onPressed: () {
                              GoRouter.of(context).pop();
                              context.read<SearchCubit>().applyFilters();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
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
