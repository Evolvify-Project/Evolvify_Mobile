import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  const TestButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
  });
  final Color? backgroundColor, textColor;
  final String text;
  final void Function()? onPressed;
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
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,

              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
