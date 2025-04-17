import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';

import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';

import 'package:evolvify/core/widgets/custom_text_field.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/CustomMedia.dart';

import 'package:evolvify/features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/line_with_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesBack),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(top: 48, left: 0, child: CustomArrowBack()),

          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Create your account',
                    style: AppStyle.styleBold52.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 29),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        SvgPicture.asset(Assets.imagesSmallEvolvify),
                        const SizedBox(height: 11),
                        Text(
                          'Evolvify',
                          style: AppStyle.styleBold52.copyWith(fontSize: 24),
                        ),
                        SizedBox(height: 35),

                        CustomTextFormField(
                          hintText: 'Username',
                          image: 'assets/images/person.svg',
                        ),
                        SizedBox(height: 19),
                        CustomTextFormField(
                          hintText: 'Password',
                          image: 'assets/images/lock.svg',
                        ),
                        SizedBox(height: 19),
                        CustomTextFormField(
                          hintText: 'Email',
                          image: 'assets/images/Email.svg',
                        ),
                        SizedBox(height: 19),

                        CustomTextFormField(
                          hintText: 'phone',
                          image: 'assets/images/phone.svg',
                        ),

                        SizedBox(height: 35),
                        CustomButton(title: 'Sign up', borderRadius: 15),
                        SizedBox(height: 20),
                        LineWithText(),
                        SizedBox(height: 25),
                        CustomMedia(),
                        SizedBox(height: 25),
                        CustomRow(
                          text1: 'Already have an account?',
                          text2: 'Sign In',
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kloginView);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
