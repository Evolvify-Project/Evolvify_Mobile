import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';

import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';

import 'package:evolvify/core/widgets/custom_text_field.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/auth/presentation/manager/register_cubit/cubit/register_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/CustomMedia.dart';

import 'package:evolvify/features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/line_with_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(value) ||
        !RegExp(r'[a-z]').hasMatch(value) ||
        !RegExp(r'[@#]').hasMatch(value)) {
      return 'Use at least one capital letter, one small letter, and one symbol ( @ or #)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var c = context.read<RegisterCubit>();

    String? validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Confirm Password is required';
      }
      if (value != c.passwordController.text ||
          !RegExp(r'[A-Z]').hasMatch(value) ||
          !RegExp(r'[a-z]').hasMatch(value) ||
          !RegExp(r'[@#]').hasMatch(value)) {
        return 'Use at least one capital letter, one small letter, and one symbol ( @ or #)';
      }
      return null;
    }

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is Registerloading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is Registersuccess) {
          showSnackBar(context, text: 'login success');
          GoRouter.of(context).push(AppRouter.kAssessmentView);
        } else if (state is Registerfailure) {
          showSnackBar(context, text: state.errMassage);
        }
      },
      builder: (context, state) {
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
              const Positioned(top: 48, left: 0, child: CustomArrowBack()),

              Positioned(
                child: SingleChildScrollView(
                  child: Form(
                    key: c.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Create your account',
                          style: AppStyle.styleBold52(context).copyWith(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(height: 39),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Column(
                            children: [
                              SvgPicture.asset(Assets.imagesSmallEvolvify),
                              const SizedBox(height: 11),
                              Text(
                                'Evolvify',
                                style: AppStyle.styleBold52(context).copyWith(
                                  fontSize: getResponsiveFontSize(
                                    context,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 35),

                              CustomTextFormField(
                                controller: c.userNameController,
                                hintText: 'Username',
                                image: 'assets/images/lock.svg',
                                validate: (value) {
                                  if (value!.contains(' ')) {
                                    return 'can only contain letters or digits no space';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 19),
                              CustomTextFormField(
                                controller: c.emailController,
                                hintText: 'Email',
                                image: 'assets/images/Email.svg',
                                validate: (value) {
                                  if (!value!.contains("@gmail.com")) {
                                    return 'email should contain @gmail.com  ';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 19),
                              CustomTextFormField(
                                controller: c.passwordController,
                                hintText: 'Password',
                                image: 'assets/images/lock.svg',
                                validate: validatePassword,
                              ),
                              SizedBox(height: 19),
                              CustomTextFormField(
                                controller: c.confirmPasswordController,
                                hintText: 'Confirm Password',
                                image: 'assets/images/lock.svg',
                                validate: validateConfirmPassword,
                              ),

                              SizedBox(height: 35),

                              state is Registerloading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                    title: 'Sign up',
                                    borderRadius: 15,
                                    onTap: () {
                                      c.vaildateRegister();
                                    },
                                  ),
                              const SizedBox(height: 20),
                              const LineWithText(),
                              const SizedBox(height: 25),
                              const CustomMedia(),
                              const SizedBox(height: 25),
                              CustomRow(
                                text1: 'Already have an account?',
                                text2: 'Sign In',
                                onTap: () {
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.kloginView);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
