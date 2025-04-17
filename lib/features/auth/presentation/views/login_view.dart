import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_text_field.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/CustomMedia.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/Remember_and_Forgot_Password.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/line_with_text.dart'
    show LineWithText;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
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
                    'Sign in',
                    style: AppStyle.styleBold52.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 90),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        SizedBox(height: 6),

                        SvgPicture.asset(Assets.imagesSmallEvolvify),
                        const SizedBox(height: 11),
                        Text(
                          'Evolvify',
                          style: AppStyle.styleBold52.copyWith(fontSize: 24),
                        ),
                        SizedBox(height: 41),

                        CustomTextFormField(
                          hintText: 'Username',
                          image: 'assets/images/person.svg',
                        ),
                        SizedBox(height: 19),
                        CustomTextFormField(
                          hintText: 'Password',
                          image: 'assets/images/lock.svg',
                        ),
                        SizedBox(height: 25),
                        RememberandForgotPassword(),
                        SizedBox(height: 39),
                        CustomButton(title: 'Sign in', borderRadius: 15),
                        SizedBox(height: 20),
                        LineWithText(),
                        SizedBox(height: 25),
                        CustomMedia(),
                        SizedBox(height: 25),
                        CustomRow(
                          text1: 'Don’t have an account?',
                          text2: 'Sign Up',
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kSignUpView);
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
