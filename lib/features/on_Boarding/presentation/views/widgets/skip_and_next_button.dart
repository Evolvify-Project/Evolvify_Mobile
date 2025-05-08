import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class SkipAndNextButton extends StatelessWidget {
  const SkipAndNextButton({super.key, this.onPressedSkip, this.onTapNext});
  final void Function()? onPressedSkip;
  final void Function()? onTapNext;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onPressedSkip,
          child: Text(
            'Skip',
            style: AppStyle.styleMedium20(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: onTapNext,
          child: Container(
            height: 48,
            width: 52,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: const BorderSide(
                  width: 1,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              color: AppColors.kPrimaryColor,
            ),
            child: Container(
              height: 42,
              width: 46,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: const BorderSide(width: 2, color: Colors.white),
                ),
                color: AppColors.kPrimaryColor,
              ),
              child: Transform.rotate(
                angle: -1.57079633 * 2,
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
