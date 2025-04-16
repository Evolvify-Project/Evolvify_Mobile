import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/chatbot%20_ai/presentation/views/widgets/custom_text_field_chat.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SendMessageRow extends StatelessWidget {
  const SendMessageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: CustomTextFieldChat()),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(Assets.imagesSendMessage),
          ),
        ],
      ),
    );
  }
}
