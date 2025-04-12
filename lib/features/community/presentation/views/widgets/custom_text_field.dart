import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.mixLine = 1,
    this.onSaved,
    this.onChanged,this.controller
  });
  final String hint;
  final int mixLine;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
      },
      maxLines: mixLine,
      cursorColor: AppColors.kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.styleRegular14.copyWith(color: Color(0xffA8A8A8)),
        border: buildBorde(),

        focusedBorder: buildBorde(),
        enabledBorder: buildBorde(),
      ),
    );
  }

  OutlineInputBorder buildBorde() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffA8A8A8)),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
