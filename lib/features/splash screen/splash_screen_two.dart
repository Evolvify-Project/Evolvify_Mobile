import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_evolvify_text.dart';

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Spacer(flex: 1),
              SvgPicture.asset('assets/images/logo.svg'),
              const SizedBox(height: 11),
              CustomEvolvifyText(),
              SizedBox(height: 102),
              Text(
                'Choose your role',
                style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontSize: getResponsiveFontSize(context, fontSize: 24),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 23),

              CustomButton(title: '🎓 Student'),
              SizedBox(height: 44),
              CustomButton(title: '🏛️ Administrator'),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
