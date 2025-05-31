import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularSkillgridView extends StatelessWidget {
  PopularSkillgridView({super.key});

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
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kAllcourseOfSkillsView);
          },
          child: AspectRatio(aspectRatio: 1 / 2, child: images[index]),
        );
      },
    );
  }

  List images = [
    Image.asset(Assets.imagesInterview),
    Image.asset(Assets.imagesPresentation),
    Image.asset(Assets.imagesCommunication),
    Image.asset(Assets.imagesTeamWork),
    Image.asset(Assets.imagesTimeMang),
  ];
  //   GestureDetector(
  //     onTap: () {},
  //     child: AspectRatio(
  //       aspectRatio: 1 / 2,
  //       child: Image.asset(Assets.imagesInterview),
  //     ),
  //   ),
  //   GestureDetector(
  //     onTap: () {},
  //     child: AspectRatio(
  //       aspectRatio: 1 / 2,
  //       child: Image.asset(Assets.imagesPresentation),
  //     ),
  //   ),
  //   GestureDetector(
  //     onTap: () {},
  //     child: AspectRatio(
  //       aspectRatio: 1 / 2,
  //       child: Image.asset(Assets.imagesCommunication),
  //     ),
  //   ),
  //   GestureDetector(
  //     onTap: () {},
  //     child: AspectRatio(
  //       aspectRatio: 1 / 2,
  //       child: Image.asset(Assets.imagesTeamWork),
  //     ),
  //   ),
  //   GestureDetector(
  //     onTap: () {},
  //     child: AspectRatio(
  //       aspectRatio: 1 / 2,
  //       child: Image.asset(Assets.imagesTimeMang),
  //     ),
  //   ),
  // ];
}
