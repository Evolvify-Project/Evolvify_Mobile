import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/on_Boarding/model/on_Boarding_model.dart';
import 'package:evolvify/features/on_Boarding/presentation/views/widgets/skip_and_next_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({
    super.key,
    required this.onBoardingModel,
    this.onPressedSkip,
    this.onTapNext,
    required this.index,
  });
  final OnBoardingModel onBoardingModel;
  final void Function()? onPressedSkip;
  final void Function()? onTapNext;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 100),

            Image.asset(onBoardingModel.image),
            SizedBox(height: 20),
            Text(
              onBoardingModel.titlt,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              maxLines: 3,

              overflow: TextOverflow.ellipsis,
              onBoardingModel.desc,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff2A2A2A),
              ),
            ),
            index <= 2 ? SizedBox(height: 120) : SizedBox(height: 70),

            index <= 2
                ? SkipAndNextButton(
                  onTapNext: onTapNext,
                  onPressedSkip: onPressedSkip,
                )
                : CustomButton(
                  title: 'Get Started',
                  borderRadius: 15,
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
