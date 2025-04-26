import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/pass_word_text_filed.dart';
import 'package:evolvify/features/community/presentation/views/widgets/Custom_TextField_Comment.dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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
                PassWordTextFiled(hintText: 'Enter your new password'),
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
                PassWordTextFiled(hintText: 'Re-enter password'),
                SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.only(left: 11, right: 11),
                  child: CustomButton(
                    title: 'Update Password',
                    onTap: () {
                      // GoRouter.of(context).push(AppRouter.kSetNewPassword);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
