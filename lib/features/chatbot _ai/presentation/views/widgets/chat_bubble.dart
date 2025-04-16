import 'package:flutter/material.dart';

class ChatAiBubble extends StatelessWidget {
  const ChatAiBubble({super.key});
  //  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Color(0xffEEEEEE),
        ),
        child: Text(
          'Hello,i’m fine,how can i help you?',
          style: TextStyle(
            color: Color(0xff505050),
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForUser extends StatelessWidget {
  const ChatBubbleForUser({super.key});
  //  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          color: Color(0xff64B5F6),
        ),
        child: Text(
          'Hello Evolva,how are you today?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
