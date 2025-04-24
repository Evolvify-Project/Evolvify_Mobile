import 'package:flutter/material.dart';

class CircularProgressQues extends StatefulWidget {
  CircularProgressQues({super.key});

  @override
  State<CircularProgressQues> createState() => _CircularProgressQuesState();
}

class _CircularProgressQuesState extends State<CircularProgressQues> {
  final int totalQuestions = 10;

  final int answeredQuestions = 4;

  final double progress = 0.4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 108,
          height: 102,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 10,
            backgroundColor: Color(0xffD0D0D0),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff59B5FF)),
          ),
        ),
        Text(
          '0${(progress * 10).toInt()}',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
