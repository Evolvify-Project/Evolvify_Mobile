import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/PremiumSection.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/emotional_State.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AiassessmentView extends StatelessWidget {
  const AiassessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 35),
          UpgradetoPremiumSection(),
          SizedBox(height: 50),
          Image.asset(Assets.imagesSelectCamera),
          SizedBox(height: 18),
          Text(
            'Try Now',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryColor,
              fontSize: getResponsiveFontSize(context, fontSize: 26),
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Enhance your soft skills through immersive \n                                     simulations.',
            style: TextStyle(
              color: Color(0xff92919A),
              fontWeight: FontWeight.w400,
              fontSize: getResponsiveFontSize(context, fontSize: 16),
            ),
          ),
          SizedBox(height: 50),
          CustomButton(
            title: 'Start Presentation Analysis',
            borderRadius: 15,
            onTap: () {
              showEmotionalState(context);
            },
          ),
          SizedBox(height: 17),
          CustomButton(
            title: 'Start Interview Analysis',
            borderRadius: 15,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kInterviewView);
            },
          ),
        ],
      ),
    );
  }
}
