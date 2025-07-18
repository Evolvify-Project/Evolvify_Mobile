import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  TestButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    required this.onPressed,
    required this.isSelected,
  });
  final Color? backgroundColor, textColor;
  final String text;
  final VoidCallback onPressed;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xffC4C4C4), width: 1),
          ),
          elevation: 0,
          backgroundColor: isSelected ? Color(0xff64B5F6) : Colors.white,
        ),
        onPressed: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,

              style: TextStyle(
                color: Colors.black,
                fontSize: getResponsiveFontSize(context, fontSize: 20),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
