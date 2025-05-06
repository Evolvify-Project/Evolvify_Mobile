import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

void showPasswordResetDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        iconPadding: EdgeInsets.only(top: 30, bottom: 20),
        backgroundColor: Colors.white,
        icon: SvgPicture.asset('assets/images/passwordDone.svg'),
        title: Text(
          'Congratulations!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: 22), fontWeight: FontWeight.w600),
        ),
        contentPadding: EdgeInsets.only(top: 6, bottom: 30),
        content: Text(
          'Password Reset successful\n  You\'ll be redirected to the  \n          login screen now.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: 14), fontWeight: FontWeight.w500),
        ),
      );
    },
  );
}
