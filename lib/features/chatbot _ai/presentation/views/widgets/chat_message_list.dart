import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolvify/features/chatbot _ai/data/models/chat_message_model.dart';
import 'package:evolvify/features/chatbot _ai/presentation/manager/chatbot_cubit/chatbot_cubit.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        if (state is ChatbotMessagesUpdated) {
          return ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return _buildMessageBubble(message);
            },
          );
        } else if (state is ChatbotLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatbotError) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMessageBubble(ChatMessageModel message) {
    return Align(
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),
            bottomRight:
                message.isUserMessage
                    ? const Radius.circular(30)
                    : const Radius.circular(30),
            bottomLeft:
                message.isUserMessage
                    ? const Radius.circular(30)
                    : const Radius.circular(30),
          ),
          color:
              message.isUserMessage
                  ? const Color(0xff64B5F6)
                  : const Color(0xffEEEEEE),
        ),
        child: Text(
          message.isUserMessage
              ? message.message ?? ''
              : message.response ?? '',
          style: TextStyle(
            color:
                message.isUserMessage ? Colors.white : const Color(0xff505050),
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
