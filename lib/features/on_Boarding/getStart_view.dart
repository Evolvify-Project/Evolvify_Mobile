import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class GetstartView extends StatelessWidget {
  const GetstartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 119),
            SvgPicture.asset(Assets.imagesOnBoardingFive),
            SizedBox(height: 42),
            Text(
              'Ready to Begin?',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 24),
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: 28),
            Text(
              maxLines: 3,
              'Start your journey with Evolvify  \n    and develop your skills!',

              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 20),
                fontWeight: FontWeight.w400,
                color: Color(0xff2A2A2A),
              ),
            ),
            SizedBox(height: 145),
            CustomButton(
              title: 'Get Started',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSplashScreenOne);
              },
            ),
          ],
        ),
      ),
    );
  }
}
