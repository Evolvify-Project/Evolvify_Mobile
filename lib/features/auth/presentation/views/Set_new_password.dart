import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/auth/presentation/manager/reset_cubit/cubit/reset_cubit.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/pass_word_text_filed.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/show_Password_Reset_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});
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
    var c = context.read<ResetCubit>();
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

    return Scaffold(
      body: BlocConsumer<ResetCubit, ResetState>(
        listener: (context, state) {
          if (state is ResetLoading) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ResetSuccess) {
            showSnackBar(context, text: 'Password updated successfully');
            // showPasswordResetDialog(context);
          } else if (state is ResetFailure) {
            showSnackBar(context, text: state.errMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: c.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                CutsomArrowios(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'Set a new password',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 23),
                      Text(
                        'Create a new password. Ensure it differs \n'
                        'from previous ones for security',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff989898),
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      SizedBox(height: 7),
                      PassWordTextFiled(
                        controller: c.passwordConfirmController,
                        hintText: 'Enter your new password',
                        validator: validatePassword,
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2A2A2A),
                        ),
                      ),
                      SizedBox(height: 7),
                      PassWordTextFiled(
                        controller: c.passwordController,
                        hintText: 'Re-enter password',
                        validator: validateConfirmPassword,
                      ),
                      SizedBox(height: 37),
                      Padding(
                        padding: const EdgeInsets.only(left: 11, right: 11),
                        child:
                            state is ResetLoading
                                ? Center(child: CircularProgressIndicator())
                                : CustomButton(
                                  title: 'Update Password',
                                  onTap: () {
                                    c.validateUser();
                                    // showPasswordResetDialog(context);
                                  },
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
