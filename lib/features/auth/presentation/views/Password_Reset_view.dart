import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

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
                  'Password reset',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 24),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 23),
                Text(
                  'Your password has been successfully reset.\n'
                  'click  confirm to set a new password',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 17),
                    fontWeight: FontWeight.w400,
                    color: Color(0xff989898),
                  ),
                ),
                SizedBox(height: 80),
                CustomButton(
                  title: 'Confirm',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSetNewPassword);
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
