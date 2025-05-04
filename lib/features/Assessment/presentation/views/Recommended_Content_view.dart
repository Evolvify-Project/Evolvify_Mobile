import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/skills_list.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/title_ofSkill_plan.dart';
import 'package:flutter/material.dart';

class RecommendedContentView extends StatelessWidget {
  const RecommendedContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CutsomArrowios(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CutomTitle(title: 'Your  Recommended Plan'),
            ),
            SizedBox(height: 20),
            TitleOfSkillPlan(
              title: 'Time Management Skills',
              color: Color(0xffFFA927),
            ),
            SizedBox(height: 20),
            RecommendedSkillList(),
            SizedBox(height: 30),
            TitleOfSkillPlan(
              title: 'Communication Skills',
              color: Color(0xff98D1FF),
            ),
            SizedBox(height: 20),
            RecommendedSkillList(),
            SizedBox(height: 30),
            TitleOfSkillPlan(
              title: 'Communication Skills',
              color: Color(0xff98D1FF),
            ),
            SizedBox(height: 20),
            RecommendedSkillList(),
            SizedBox(height: 30),
            TitleOfSkillPlan(
              title: 'Communication Skills',
              color: Color(0xff98D1FF),
            ),
            SizedBox(height: 20),
            RecommendedSkillList(),
            SizedBox(height: 30),
            TitleOfSkillPlan(
              title: 'Communication Skills',
              color: Color(0xff98D1FF),
            ),
            SizedBox(height: 20),
            RecommendedSkillList(),
          ],
        ),
      ),
    );
  }
}
