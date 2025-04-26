import 'package:flutter/material.dart';

class CustomTextFieldComment extends StatelessWidget {
  CustomTextFieldComment({
    super.key,
    this.hintText,
    this.onChanged,
    this.borderRaduis,

    this.obscureText = false,
  });
  String? hintText;

  bool? obscureText;

  Function(String)? onChanged;

  double? borderRaduis;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,

      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: border(),
        enabledBorder: border(),
        border: border(),
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        hintStyle: TextStyle(
          color: Color(0xff72777A),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Icon(Icons.send),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular( 25),
      borderSide: BorderSide(color: Color(0xff979C9E)),
    );
  }
}
