import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/auth/presentation/manager/forget_cubit/cubit/forget_pass_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  String? email;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEmail();
  }

  Future<void> loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      isLoading = false;
    });
  }

  String maskEmail(String email) {
    final atIndex = email.indexOf('@');
    if (atIndex > 5) {
      return email.replaceRange(5, atIndex, '****');
    } else {
      return email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 35, child: CustomArrowBack()),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 35),

                BlocConsumer<ForgetPassCubit, ForgetPassState>(
                  listener: (context, state) {
                    if (state is ForgetPasssuccess) {
                      showSnackBar(context, text: state.message);
                    } else if (state is ForgetPassfailure) {
                      showSnackBar(context, text: state.errMassage);
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password ?',
                            style: AppStyle.styleMedium28(context),
                          ),
                          const SizedBox(height: 17),
                          // const SizedBox(height: 87),
                          // SvgPicture.asset(Assets.imagesForgetPassword2),
                          Image.asset(Assets.imagesForget),
                          const SizedBox(height: 17),
                          Text(
                            'Where would you like to receive a \n                    Verification Code ?',
                            style: AppStyle.styleRegular15(context),
                          ),
                          // const SizedBox(height: 42),
                          // ContactCard(
                          //   selected: selectedOption == "sms",
                          //   value: 'SMS',
                          //   title: 'via SMS',
                          //   subTitle: '+1 123******99',
                          //   image: Assets.imagesMessageFill,
                          // ),
                          const SizedBox(height: 20),
                          ContactCard(
                            selected: true,
                            title: 'via Email',
                            subTitle: maskEmail(email ?? ''),
                            image: Assets.imagesMailFill,
                          ),
                          const SizedBox(height: 31),
                          (state is ForgetPassloading)
                              ? CircularProgressIndicator()
                              : CustomButton(
                                title: 'Next',
                                onTap: () {
                                  BlocProvider.of<ForgetPassCubit>(
                                    context,
                                  ).forgetPassword(email);
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.kVerifyPassWordView);
                                },
                              ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
