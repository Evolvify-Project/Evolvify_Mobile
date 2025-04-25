import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/Level_of_User.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/start_plan_button.dart';
import 'package:flutter/material.dart';

class TestResultView extends StatelessWidget {
  const TestResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  ArrowBackButton(),
                  Spacer(flex: 1),
                  CutomTitle(title: 'Assessment Result'),
                  Spacer(flex: 1),
                ],
              ),

              Image.asset(Assets.imagesTestResult),
              CustomLevelofUser(
                title: 'Interview Skills',
                subtitle: 'Advanced',
                icon: Assets.imagesAdvanced,
                progress: Assets.imagesAdvancedIndicatior,
              ),
              SizedBox(height: 15),
              CustomLevelofUser(
                title: 'Presentation Skills',
                subtitle: 'Intermediate',
                icon: Assets.imagesInter,
                progress: Assets.imagesIntermediateIndicatior,
              ),
              SizedBox(height: 15),
              CustomLevelofUser(
                title: 'Teamwork Skills',
                subtitle: 'Beginner',
                icon: Assets.imagesBegginer,
                progress: Assets.imagesBeginnerIndicatior,
              ),
              SizedBox(height: 25),

              StartPlanButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// class LevelsOfUser extends StatelessWidget {
//   LevelsOfUser({super.key});
//   final List levelsOfUser = [
//     CustomLevelofUser(
//       title: 'Interview Skills',
//       subtitle: 'Advanced',
//       icon: '',
//       progress: Assets.imagesAdvancedIndicatior,
//     ),
//     CustomLevelofUser(
//       title: 'Presentation Skills',
//       subtitle: 'Advanced',
//       icon: '',
//       progress: Assets.imagesAdvancedIndicatior,
//     ),
//     CustomLevelofUser(
//       title: 'Interview Skills',
//       subtitle: 'Advanced',
//       icon: '',
//       progress: Assets.imagesAdvancedIndicatior,
//     ),
//     CustomLevelofUser(
//       title: 'Interview Skills',
//       subtitle: 'Advanced',
//       icon: '',
//       progress: Assets.imagesAdvancedIndicatior,
//     ),
//     CustomLevelofUser(
//       title: 'Interview Skills',
//       subtitle: 'Advanced',
//       icon: '',
//       progress: Assets.imagesAdvancedIndicatior,
//     ),
//   ];
//   @override

// }
