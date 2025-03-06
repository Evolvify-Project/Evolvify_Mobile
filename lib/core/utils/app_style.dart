import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleBold52 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 52,
    fontFamily: 'PlusJakartaSans',
  );
  static TextStyle styleMedium20 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    fontFamily: 'PlusJakartaSans',
  );
  static TextStyle styleRegular14 = TextStyle(
    color: Color(0xff070707),
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: 'Roboto',
  );
}
