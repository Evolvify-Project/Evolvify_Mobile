import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/Circular_Progress_ques.dart';
import 'package:flutter/material.dart';

class CircularRow extends StatelessWidget {
  const CircularRow({
    super.key,
    required this.progrss,
    required this.value,
    required this.num,
  });
  final double progrss;
  final String value;
  final double num;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Question',
              style: TextStyle(color: Color(0xff8093A6), fontSize: getResponsiveFontSize(context, fontSize: 18),),
            ),
            Text(
              '${value}',
              // '${value}/20',
              style: TextStyle(color: Color(0xff8093A6), fontSize: getResponsiveFontSize(context, fontSize: 18),),
            ),
          ],
        ),
        Spacer(flex: 1),
        CircularProgressQues(progress: progrss, num: num),
        Spacer(flex: 2),
      ],
    );
  }
}
