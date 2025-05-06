import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

// ignore: must_be_immutable
class CustomTextFieldChat extends StatelessWidget {
  CustomTextFieldChat({
    super.key,
    this.hintText,
    this.onChanged,

    this.obscureText = false,
  });
  String? hintText;

  bool? obscureText;

  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,

      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: border(),
        enabledBorder: border(),
        border: border(),
        hintText: '    Type a message...',
        contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        hintStyle: TextStyle(
          color: Color(0xff72777A),
          fontSize: getResponsiveFontSize(context, fontSize: 16),
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(Assets.imagesMicrophone),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Color(0xff979C9E)),
    );
  }
}
