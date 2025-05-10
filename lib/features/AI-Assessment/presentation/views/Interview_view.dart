import 'package:evolvify/core/utils/app_images.dart';

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

            // صورة الشخص و أزرار التحكم
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assets.imagesSimulation,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.mic, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.pause, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.stop, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // موجة الصوت
                const Positioned(
                  bottom: 12,
                  left: 16,
                  right: 16,
                  child: AudioWaveformPlaceholder(),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // الأسئلة كنص
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


// ويدجيت فقاعة السؤال
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
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text),
    );
  }
}

// ويدجيت موجة الصوت (كمثال وهمي)
class AudioWaveformPlaceholder extends StatelessWidget {
  const AudioWaveformPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Text("Audio Waveform")),
    );
  }
}
