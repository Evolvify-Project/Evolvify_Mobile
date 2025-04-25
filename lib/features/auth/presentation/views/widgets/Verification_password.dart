import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/auth/presentation/manager/Verify_cubit/cubit/verify_pass_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/show_Password_Reset_Dialog.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/text_field_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class VerityPassword extends StatefulWidget {
  const VerityPassword({super.key});

  @override
  State<VerityPassword> createState() => _VerityPasswordState();
}

class _VerityPasswordState extends State<VerityPassword> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  int fillBox = 0;
  String? email;
  bool isLoading = true;

  void onChange(String value, int index) {
    if (value.length == 1) {
      setState(() {
        fillBox++;
      });
      if (index < controllers.length - 1) {
        FocusScope.of(context).nextFocus();
      }
    } else if (value.isEmpty) {
      setState(() {
        fillBox--;
      });
      if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
  }

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

  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPassCubit, VerifyPassState>(
      listener: (context, state) {
        if (state is VerifyPassSucess) {
          print('✅ OTP Confirm Message: ${state.message}');
          
          showSnackBar(context, text: state.message);
          print(state.message);
          showPasswordResetDialog(context);
        } else if (state is VerifyPassFailure) {
          showSnackBar(context, text: state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFieldCode(
                    controllers: controllers[index],
                    onChanged: (value) {
                      onChange(value, index);
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 52),

            SizedBox(height: 25),
            LinearProgressIndicator(
              value: fillBox / 4,
              backgroundColor: Color(0xffCBCBCB),
              color: AppColors.kPrimaryColor,
            ),
            SizedBox(height: 21),
            state is VerifyPassLoading
                ? CircularProgressIndicator()
                : CustomButton(
                  borderRadius: 25,
                  title: 'Verify',
                  onTap: () {
                    if (fillBox == 6) {
                      verifyCode();
                    } else {
                      showSnackBar(context, text: "Please fill all 6 digits");
                    }
                  },
                ),
            SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t Receive the Code ?',
                  style: AppStyle.styleMedium14,
                ),
                Text(
                  '   Resend Code',
                  style: AppStyle.styleMedium28.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void verifyCode() {
    final code = controllers.map((e) => e.text).join();
    if (code.length < 6) {
      showSnackBar(context, text: 'Please complete the code ');
    } else if (email == null) {
      showSnackBar(context, text: ' email not found');
      return;
    }

    BlocProvider.of<VerifyPassCubit>(
      context,
    ).verifyPassWord(code: code, email: email!);
  }
}
