import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/presentation/manager/submit_ques_cubit/submit_ques_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/Level_of_User.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/start_plan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestResultView extends StatelessWidget {
  const TestResultView({super.key, required this.skillResult});
  final List<SkillResult> skillResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F1FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: const [
                  ArrowBackButton(),
                  Spacer(flex: 1),
                  CutomTitle(title: 'Assessment Result'),
                  Spacer(flex: 1),
                ],
              ),

              Image.asset(Assets.imagesTestResult),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skillResult.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: buildSkillTile(skillResult[index]),
                  );
                },
              ),

              const StartPlanButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
