import 'package:evolvify/features/Courses/presentation/views/widgets/audio_item.dart';
import 'package:flutter/material.dart';

class AudioList extends StatelessWidget {
  const AudioList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return AudioItem(text: 'Interview basics', timeLessons: '04:28 min');
      },
    );
  }
}
