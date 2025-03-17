import 'package:evolvify/core/utils/app_style.dart';

import 'package:evolvify/core/widgets/custom_arrow_back.dart';

import 'package:evolvify/features/auth/presentation/views/widgets/Verification_password.dart';
import 'package:flutter/material.dart';

class VerifyPasswordView extends StatelessWidget {
  const VerifyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomArrowBack(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: AppStyle.styleMedium28.copyWith(fontSize: 15),
                ),
                SizedBox(height: 75),
                Text('Verify ', style: AppStyle.styleMedium28),
                SizedBox(height: 6),
                Text(
                  'Please enter the code we sent you to email',
                  style: AppStyle.styleMedium12,
                ),
                SizedBox(height: 40),
                VerityPassword(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
