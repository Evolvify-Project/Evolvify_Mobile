import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isPrimary;

  const ChatBubble({super.key, required this.text, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isPrimary ? Colors.blue[100] : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff505050),
          fontWeight: FontWeight.w400,
          fontSize: getResponsiveFontSize(context, fontSize: 16),
        ),
      ),
    );
  }
}
