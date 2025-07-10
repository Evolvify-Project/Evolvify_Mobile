import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0xffE1E1E1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(image),
      ),
    );
  }
}
