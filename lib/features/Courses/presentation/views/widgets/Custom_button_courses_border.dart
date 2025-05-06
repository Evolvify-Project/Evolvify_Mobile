import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButtonCoursesBorder extends StatelessWidget {
  const CustomButtonCoursesBorder({
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
      height: 59,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: AppColors.kPrimaryColor, width: 1),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
