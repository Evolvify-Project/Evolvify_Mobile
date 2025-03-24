import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RememberandForgotPassword extends StatelessWidget {
  const RememberandForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CustomCheckBox(),
            SizedBox(width: 6),
            Text(
              'Remember me',
              style: TextStyle(
                color: Color(0xffA1A1A1),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: 'Robto',
              ),
            ),
          ],
        ),
        Spacer(),

        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kForgetPassWordView);
          },
          child: Text(
            ' Forgot Your Password?',
            style: TextStyle(
              color: Color(0xffA1A1A1),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: 'Robto',
            ),
          ),
        ),
      ],
    );
  }
}
