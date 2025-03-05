
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomEvolvifyText extends StatelessWidget {
  const CustomEvolvifyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Evolvify',
      style: TextStyle(
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 52,
      ),
      
    );
  }
}
