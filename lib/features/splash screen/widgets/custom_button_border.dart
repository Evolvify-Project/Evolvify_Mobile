import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomButtonBorder extends StatelessWidget {
  const CustomButtonBorder({super.key, required this.title, this.onTap,this.verticalPadding});
  final String title;
  final void Function()? onTap;
 final double ?verticalPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: verticalPadding ??8  ),
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: getResponsiveFontSize(context, fontSize: 20),
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
