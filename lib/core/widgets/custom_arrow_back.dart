import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Align(
        child: ArrowBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
