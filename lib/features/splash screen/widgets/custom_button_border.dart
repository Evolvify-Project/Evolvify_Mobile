import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButtonBorder extends StatelessWidget {
  const CustomButtonBorder({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kPrimaryColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
    ;
  }
}
