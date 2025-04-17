import 'package:flutter/material.dart';

class LineWithText extends StatelessWidget {
  const LineWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xffE1E1E1), height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'or continue with',

            style: TextStyle(
              fontSize: 12,
              color: Color(0xff797979),
              fontWeight: FontWeight.w500,
            ), // Text style
          ),
        ),
        Expanded(child: Divider(color: Color(0xffE1E1E1), height: 1)),
      ],
    );
  }
}
