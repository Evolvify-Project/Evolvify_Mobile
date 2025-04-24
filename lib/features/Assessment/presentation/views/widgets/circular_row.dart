import 'package:evolvify/features/Assessment/presentation/views/widgets/Circular_Progress_ques.dart';
import 'package:flutter/material.dart';

class CircularRow extends StatelessWidget {
  const CircularRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Question',
              style: TextStyle(color: Color(0xff8093A6), fontSize: 18),
            ),
            Text(
              '4/20',
              style: TextStyle(color: Color(0xff8093A6), fontSize: 18),
            ),
          ],
        ),
        Spacer(flex: 1),
        CircularProgressQues(),
        Spacer(flex: 2),
      ],
    );
  }
}
