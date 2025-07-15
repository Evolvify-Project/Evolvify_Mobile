import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/custom_text_field.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/Assessment/presentation/manager/assessment_status_cubit/assessment_status_cubit.dart';
import 'package:evolvify/features/auth/presentation/manager/login_cubit/cubit/login_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/CustomMedia.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/Remember_and_Forgot_Password.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/line_with_text.dart'
    show LineWithText;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void initState() {
    super.initState();

    // Timer(Duration(seconds: 30), () {
    //   GoRouter.of(context).push(AppRouter.kAssessmentView);
    // });
  }

  @override
  Widget build(BuildContext context) {
    var c = context.read<LoginCubit>();
    return BlocProvider(
      create: (context) => AssessmentStatusCubit(),
      child: BlocListener<AssessmentStatusCubit, AssessmentStatusState>(
        listener: (context, state) {
          if (state is AssessmentStatusSuccess) {
            print('🔐 Login: Assessment status check successful');
            print('🔐 Login: hasCompleted = ${state.hasCompleted}');
            if (state.hasCompleted) {
              // User has completed assessment, go to home screen
              print(
                '🔐 Login: Redirecting to home screen (assessment completed)',
              );
              GoRouter.of(
                context,
              ).pushReplacement(AppRouter.kCustomBottomNavigationBar);
            } else {
              // User hasn't completed assessment, go to assessment view
              print(
                '🔐 Login: Redirecting to assessment view (assessment not completed)',
              );
              GoRouter.of(context).pushReplacement(AppRouter.kAssessmentView);
            }
          } else if (state is AssessmentStatusFailure) {
            // If there's an error checking assessment status, default to assessment view
            print(
              '🔐 Login: Assessment status check failed, defaulting to assessment view',
            );
            GoRouter.of(context).pushReplacement(AppRouter.kAssessmentView);
          }
        },
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is Loginloading) {
              const Center(child: CircularProgressIndicator());
            } else if (state is Loginsuccess) {
              showSnackBar(context, text: 'login success');
              // Check assessment status and redirect accordingly
              context.read<AssessmentStatusCubit>().checkAssessmentStatus();
            } else if (state is Loginfailure) {
              showSnackBar(context, text: state.errMassage);
            }
          },
          builder: (context, state) {
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
                  const Positioned(top: 48, left: 0, child: CustomArrowBack()),

                  Positioned(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Sign in',
                            style: AppStyle.styleBold52(context).copyWith(
                              fontSize: getResponsiveFontSize(
                                context,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(height: 90),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: Form(
                              key: c.formKey,
                              child: Column(
                                children: [
                                  const SizedBox(height: 6),

                                  SvgPicture.asset(Assets.imagesSmallEvolvify),
                                  const SizedBox(height: 11),
                                  Text(
                                    'Evolvify',
                                    style: AppStyle.styleBold52(
                                      context,
                                    ).copyWith(
                                      fontSize: getResponsiveFontSize(
                                        context,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 41),

                                  CustomTextFormField(
                                    controller: c.emailController,
                                    hintText: 'Email',
                                    image: 'assets/images/Email.svg',
                                    validate: (value) {
                                      if (!value!.contains('@')) {
                                        return 'Email should contains @';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 19),
                                  CustomTextFormField(
                                    validate: (value) {
                                      if (value!.length < 8) {
                                        return 'password should more than 8 ';
                                      }
                                      return null;
                                    },
                                    controller: c.passwordController,
                                    hintText: 'Password',
                                    image: 'assets/images/lock.svg',
                                  ),
                                  const SizedBox(height: 25),
                                  const RememberandForgotPassword(),
                                  SizedBox(height: 39),
                                  state is Loginloading
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                        title: 'Sign in',
                                        borderRadius: 15,
                                        onTap: () {
                                          c.validateUser();
                                        },
                                      ),
                                  SizedBox(height: 20),
                                  LineWithText(),
                                  SizedBox(height: 25),
                                  CustomMedia(),
                                  SizedBox(height: 25),
                                  CustomRow(
                                    text1: 'Don\'t have an account?',
                                    text2: 'Sign Up',
                                    onTap: () async {
                                      GoRouter.of(
                                        context,
                                      ).push(AppRouter.kSignUpView);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
