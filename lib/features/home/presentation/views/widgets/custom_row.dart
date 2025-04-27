import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: AppStyle.styleBold22),
        Text('see more', style: AppStyle.styleRegularGrey14),
      ],
    );
  }
}
