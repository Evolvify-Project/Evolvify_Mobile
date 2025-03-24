import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';

import 'package:evolvify/core/widgets/custom_evolvify_text.dart';
import 'package:evolvify/core/widgets/custom_text_field.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/Remember_and_Forgot_Password.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            Column(
              children: [
                CustomArrowBack(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Column(
                    children: [
                      SizedBox(height: 6),

                      SvgPicture.asset('assets/images/logo.svg'),
                      const SizedBox(height: 11),
                      CustomEvolvifyText(),
                      SizedBox(height: 65),
                      Text(
                        'Sign in to your account',
                        style: AppStyle.styleMedium20,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        hintText: 'Username',
                        image: 'assets/images/person.svg',
                      ),
                      SizedBox(height: 34),
                      CustomTextFormField(
                        hintText: 'Password',
                        image: 'assets/images/lock.svg',
                      ),
                      SizedBox(height: 34),
                      RememberandForgotPassword(),
                      SizedBox(height: 30),
                      CustomButton(title: 'Sign in', borderRadius: 15),
                      SizedBox(height: 34),
                      CustomRow(),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              right: 0,
              top: 40,
              child: SvgPicture.asset('assets/images/Ellipse 31.svg'),
            ),
            Positioned(
              left: 0,
              // bottom: 10,
              bottom: 0,
              child: SvgPicture.asset('assets/images/Ellipse 31 (1).svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have an account?', style: AppStyle.styleRegular14),
        SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignUpView);
          },
          child: Text(
            'Sign Up',
            style: AppStyle.styleMedium20.copyWith(
              fontSize: 14,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
