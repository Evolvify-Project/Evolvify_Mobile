import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/ChatBubble.dart';
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
