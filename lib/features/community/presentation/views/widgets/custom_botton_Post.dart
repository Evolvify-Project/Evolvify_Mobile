
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomBottonPost extends StatelessWidget {
  const CustomBottonPost({
    super.key,this.onTap
  });
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.kPrimaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 10,
            ),
            child: Text(
              'Post',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
