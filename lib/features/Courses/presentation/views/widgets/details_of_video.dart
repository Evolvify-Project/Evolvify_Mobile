import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/video.dart';
import 'package:flutter/material.dart';

class DetailsOfVideo extends StatelessWidget {
  const DetailsOfVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Video(),
        SizedBox(height: 12),
        Text(
          '  bjhjhvghcfhxdng   ',
          style: TextStyle(
            color: Colors.black,
            fontSize: getResponsiveFontSize(context, fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 5),
        Text(
          ' bhjbhtkb3v',
          style: TextStyle(
            color: Color(0xff888C94),
            fontSize: getResponsiveFontSize(context, fontSize: 14),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 5),
        Text(
          '(${'hjfbhvg'})',
          style: const TextStyle(color: Color(0xffFF001E)),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
