import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButtonCourses extends StatelessWidget {
  const CustomButtonCourses({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
  });
  final Color? backgroundColor, textColor;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
          backgroundColor: AppColors.kPrimaryColor,
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
