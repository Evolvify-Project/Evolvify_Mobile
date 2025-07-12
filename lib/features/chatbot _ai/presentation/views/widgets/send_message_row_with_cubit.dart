import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/chatbot _ai/presentation/manager/chatbot_cubit/chatbot_cubit.dart';
import 'package:svg_flutter/svg.dart';

class SendMessageRowWithCubit extends StatefulWidget {
  const SendMessageRowWithCubit({super.key});

  @override
  State<SendMessageRowWithCubit> createState() =>
      _SendMessageRowWithCubitState();
}

class _SendMessageRowWithCubitState extends State<SendMessageRowWithCubit> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      context.read<ChatbotCubit>().sendTextMessage(message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 16),
          BlocBuilder<ChatbotCubit, ChatbotState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: state is ChatbotLoading ? null : _sendMessage,
                child: Opacity(
                  opacity: state is ChatbotLoading ? 0.5 : 1.0,
                  child: SvgPicture.asset(Assets.imagesSendMessage),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
