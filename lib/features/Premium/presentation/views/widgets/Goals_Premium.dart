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
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: getResponsiveFontSize(context, fontSize: 16),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Goalofpremium(text: 'Ad-Free Experience')),
                    SizedBox(width: 20),
                    Expanded(child: Goalofpremium(text: 'Advanced Analytics')),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Goalofpremium(text: 'Exclusive AI Insights'),
                    ),
                    SizedBox(width: 20),
                    Expanded(child: Goalofpremium(text: 'Premium Simulations')),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
