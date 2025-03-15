import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/arrow_button.dart' show ArrowBackButton;
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_evolvify_text.dart';

import 'package:evolvify/core/widgets/custom_text_field.dart';

import 'package:evolvify/features/auth/presentation/views/widgets/social_media_Item.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 23),
              
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: ArrowBackButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
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
                          'Create your account',
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
                        CustomTextFormField(
                          hintText: 'Email',
                          image: 'assets/images/Email.svg',
                        ),
                        SizedBox(height: 34),
                        CustomTextFormField(
                          hintText: 'phone',
                          image: 'assets/images/phone.svg',
                        ),
                        SizedBox(height: 22),
                        CustomButton(title: 'Sign up'),
                        SizedBox(height: 15),
                        LineWithText(),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialMediaItem(image: 'assets/images/google.svg'),
                              SocialMediaItem(
                                image: 'assets/images/facebook.svg',
                              ),
                              SocialMediaItem(image: 'assets/images/apple2.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 0,
              top: 40,
              child: SvgPicture.asset('assets/images/Ellipse 32.svg'),
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

class LineWithText extends StatelessWidget {
  const LineWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xffE1E1E1), height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'or continue with',

            style: TextStyle(
              fontSize: 12,
              color: Color(0xffB9B9B9),
            ), // Text style
          ),
        ),
        Expanded(child: Divider(color: Color(0xffE1E1E1), height: 1)),
      ],
    );
  }
}
