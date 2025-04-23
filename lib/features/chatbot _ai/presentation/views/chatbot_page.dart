import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/widgets/chat_bot_appBar.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/widgets/chat_bubble.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/widgets/send_message_row.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChatBotAppBar(),
          SizedBox(height: 20),
          Image.asset(Assets.imagesChat),
          // SvgPicture.asset(Assets.imagesChatbotImage),
          SizedBox(height: 15),
          ChatBubbleForUser(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatAiBubble(),

              // SvgPicture.asset(Assets.imagesChatSend)
            ],
          ),
          Expanded(child: SizedBox()),
          SendMessageRow(),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
