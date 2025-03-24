import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';

import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 23),

            CustomArrowBack(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Forgot Password ?', style: AppStyle.styleMedium28),
                  const SizedBox(height: 20),
                  SvgPicture.asset('assets/images/forgot_Password .svg'),
                  const SizedBox(height: 20),
                  Text(
                    'Where would you like to receive a \n                    Verification Code ?',
                    style: AppStyle.styleRegular15,
                  ),
                  const SizedBox(height: 20),
                  ContactCard(
                    title: 'via SMS',
                    subTitle: '+1 123******99',
                    image: 'assets/images/message fill.svg',
                  ),
                  const SizedBox(height: 20),
                  ContactCard(
                    title: 'via Email',
                    subTitle: 'lauran****@email.com',
                    image: 'assets/images/mail-fill.svg',
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Next',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kVerifyPassWordView);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
