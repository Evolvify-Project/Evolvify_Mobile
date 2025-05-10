
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class Goalofpremium extends StatelessWidget {
  const Goalofpremium({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesStar),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: getResponsiveFontSize(context, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class GoalsPremium extends StatelessWidget {
  const GoalsPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Row(
          children: [
            Goalofpremium(text: 'Ad-Free Experience'),
            Expanded(child: SizedBox()),
            Goalofpremium(text: ' Advanced Analytics'),
          ],
        ),
        Row(
          children: [
            Goalofpremium(text: 'Exclusive AI Insights'),
            Expanded(child: SizedBox()),
            Goalofpremium(text: 'Premium Simulations'),
          ],
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
