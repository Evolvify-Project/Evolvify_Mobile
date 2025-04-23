import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_evolvify_text.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 240),
                SvgPicture.asset(Assets.imagesLogo),
                const SizedBox(height: 11),
                CustomEvolvifyText(),
                SizedBox(height: 123),
                CustomButton(
                  title: ' Sign in',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kloginView);
                  },
                ),
                SizedBox(height: 16),
                CustomButtonBorder(
                  title: 'Sign up',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
