
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_evolvify_text.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset('assets/images/logo.svg'),
              const SizedBox(height: 11),
              CustomEvolvifyText(),
              SizedBox(height: 123),
              CustomButton(),
              SizedBox(height: 44),
              CustomButtonBorder(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
