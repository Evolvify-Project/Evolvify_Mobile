import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/Level_of_User.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/start_plan_button.dart';
import 'package:flutter/material.dart';

class TestResultView extends StatefulWidget {
  TestResultView({super.key, required this.skillResult});
  final List<SkillResult> skillResult;
  // final List skills = [
  //   {"skill": "Interview", "level": "Beginner"},
  //   {"skill": "Communication", "level": "Beginner"},
  //   {"skill": "Time Management", "level": "Intermediate"},
  //   {"skill": "Presentation", "level": "Beginner"},
  //   {"skill": "Teamwork", "level": "Beginner"},
  // ];

  @override
  State<TestResultView> createState() => _TestResultViewState();
}

class _TestResultViewState extends State<TestResultView> {
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

              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.skillResult.length,
                itemBuilder: (context, index) {
                  final results = widget.skillResult[index];
                  return buildSkillTile(results);
                },
              ),

              SizedBox(height: 20),

              StartPlanButton(),
            ],
          ),
        ),
      ),
    );
  }
}
