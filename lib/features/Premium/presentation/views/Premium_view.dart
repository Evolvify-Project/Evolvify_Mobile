import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Goals_Premium.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_Offer.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/yearly_plan.dart';
import 'package:flutter/material.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(alignment: Alignment.topLeft, child: CutsomArrowios()),
              Image.asset(Assets.imagesPremiumImage),
              Text(
                'Upgrade to ',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveFontSize(context, fontSize: 40),
                ),
              ),
              Text(
                'Premium',
                style: TextStyle(
                  color: Color(0xffFFAE6C),
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveFontSize(context, fontSize: 40),
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Upgrade to Premium for Advanced Insights!',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: getResponsiveFontSize(context, fontSize: 19),
                ),
              ),
              GoalsPremium(),

              PremiumOffer(),
              SizedBox(height: 25),
              YearlyPlan(),
            ],
          ),
        ),
      ),
    );
  }
}
