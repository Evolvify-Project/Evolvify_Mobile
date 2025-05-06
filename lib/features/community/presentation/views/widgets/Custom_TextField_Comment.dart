import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFieldComment extends StatelessWidget {
  CustomTextFieldComment({
    super.key,
    this.hintText,
    this.onChanged,
    this.borderRaduis,
    this.onPressedComment,

    required this.commentController,
    this.obscureText = false,
  });
  String? hintText;

  bool? obscureText;
  void Function()? onPressedComment;
  Function(String)? onChanged;

  double? borderRaduis;
  TextEditingController commentController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      controller: commentController,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: border(),
        enabledBorder: border(),
        border: border(),
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        hintStyle: TextStyle(
          color: Color(0xff72777A),
          fontSize: getResponsiveFontSize(context, fontSize: 16),
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(
          onPressed: onPressedComment,
          icon: Icon(Icons.send),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xff979C9E)),
    );
  }
}
