import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class FilterText extends StatelessWidget {
  const FilterText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize:getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
