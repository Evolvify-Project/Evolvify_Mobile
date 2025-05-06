import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CircularProgressQues extends StatefulWidget {
  CircularProgressQues({super.key, required this.progress, required this.num});
  final double progress;
  final double num;
  @override
  State<CircularProgressQues> createState() => _CircularProgressQuesState();
}

class _CircularProgressQuesState extends State<CircularProgressQues> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 108,
          height: 102,
          child: CircularProgressIndicator(
            value: widget.progress.toDouble(),
            strokeWidth: 10,
            backgroundColor: Color(0xffD0D0D0),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff59B5FF)),
          ),
        ),
        Text(
          '${((widget.num).toInt())}',
          style: TextStyle(fontSize: getResponsiveFontSize(context, fontSize: 32), fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
