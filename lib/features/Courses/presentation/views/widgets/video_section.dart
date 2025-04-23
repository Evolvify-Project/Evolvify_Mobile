import 'package:evolvify/features/Courses/presentation/views/widgets/video.dart';
import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Video(),
        SizedBox(height: 15),
        Text(
          'Public Speaking: Speak \n'
          'with Confidence',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        SizedBox(height: 5),
        Text('(Beginner)', style: TextStyle(color: Color(0xffFF001E))),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              '6h 30min',
              style: TextStyle(color: Color(0xff888C94), fontSize: 11),
            ),
            SizedBox(width: 6),

            SizedBox(width: 30),
            Text(
              '7 lessons',
              style: TextStyle(color: Color(0xff888C94), fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}
