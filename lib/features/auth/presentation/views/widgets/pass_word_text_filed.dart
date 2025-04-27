import 'package:flutter/material.dart';

class PassWordTextFiled extends StatelessWidget {
  PassWordTextFiled({
    super.key,
    this.hintText,
    this.onChanged,
    this.borderRaduis,
    this.validator,
    this.controller,
    this.obscureText = false,
  });
  String? hintText;

  bool? obscureText;

  Function(String)? onChanged;
  TextEditingController? controller;
  String? Function(String?)? validator;
  double? borderRaduis;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText!,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusedBorder: border(),
          enabledBorder: border(),
          border: border(),
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          hintStyle: TextStyle(
            color: Color(0xffB3B3B3),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: Icon(Icons.password_sharp),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xffE1E1E1)),
    );
  }
}
