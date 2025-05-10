
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/recordind.dart';
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/simulation_header.dart';
import 'package:flutter/material.dart';

class InterviewView extends StatelessWidget {
  const InterviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SimulationHeader(),
            Recording(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ChatBubble(text: "Tell me about yourself.", isPrimary: true),
                  ChatBubble(text: "How do you handle constructive criticism?"),
                  ChatBubble(text: "How do you manage stress at work?"),
                  ChatBubble(text: "Where do you see yourself in five years?"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: Text(text),
    );
  }
}
