import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/chatbot _ai/data/repo/chatbot_repo_impl.dart';
import 'package:evolvify/features/chatbot _ai/presentation/manager/chatbot_cubit/chatbot_cubit.dart';
import 'package:evolvify/features/chatbot _ai/presentation/views/widgets/chat_bot_appBar.dart';
import 'package:evolvify/features/chatbot _ai/presentation/views/widgets/chat_message_list.dart';
import 'package:evolvify/features/chatbot _ai/presentation/views/widgets/send_message_row_with_cubit.dart';

class ChatbotPageWithCubit extends StatelessWidget {
  const ChatbotPageWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotCubit(ChatbotRepoImpl()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const ChatBotAppBar(),
            const SizedBox(height: 20),
            Image.asset(Assets.imagesChat),
            const SizedBox(height: 15),
            Expanded(
              child: BlocListener<ChatbotCubit, ChatbotState>(
                listener: (context, state) {
                  if (state is ChatbotError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const ChatMessageList(),
              ),
            ),
            const SafeArea(child: SendMessageRowWithCubit()),
          ],
        ),
      ),
    );
  }
}
