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

  @override
  Widget build(BuildContext context) {
    var c = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is Registerloading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is Registersuccess) {
          showSnackBar(context, text: 'login success');
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
              Positioned(top: 48, left: 0, child: CustomArrowBack()),

              Positioned(
                child: SingleChildScrollView(
                  child: Form(
                    key: c.formKey,
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
                                style: AppStyle.styleBold52.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 35),

                              CustomTextFormField(
                                controller: c.userNameController,
                                hintText: 'Username',
                                image: 'assets/images/person.svg',
                              ),
                              SizedBox(height: 19),
                              CustomTextFormField(
                                controller: c.passwordController,
                                hintText: 'Password',
                                image: 'assets/images/lock.svg',
                              ),
                              SizedBox(height: 19),
                              CustomTextFormField(
                                controller: c.emailController,
                                hintText: 'Email',
                                image: 'assets/images/Email.svg',
                              ),
                              SizedBox(height: 19),

                              // CustomTextFormField(
                              //   hintText: 'phone',
                              //   image: 'assets/images/phone.svg',
                              // ),

                              // SizedBox(height: 35),
                              CustomButton(
                                title: 'Sign up',
                                borderRadius: 15,
                                onTap: () {
                                  c.vaildateRegister();
                                },
                              ),
                              SizedBox(height: 20),
                              LineWithText(),
                              SizedBox(height: 25),
                              CustomMedia(),
                              SizedBox(height: 25),
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
