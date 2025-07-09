import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/features/home/data/models/skill_model.dart';
import 'package:evolvify/features/home/presentation/manager/skill/skill_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PopularSkillGridView extends StatelessWidget {
  PopularSkillGridView({super.key});
  int skillId = 0;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 5,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.3 / 3,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        final skillId = index + 1;

        return GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kAllcourseOfSkillsView, extra: skillId);
          },
          child: AspectRatio(aspectRatio: 1 / 2, child: images[index]),
        );
      },
    );
  }

  List images = [
    Image.asset(Assets.imagesCommunication),
    Image.asset(Assets.imagesInterview),
    Image.asset(Assets.imagesTeamWork),
    Image.asset(Assets.imagesPresentation),
    Image.asset(Assets.imagesTimeMang),
  ];
}
