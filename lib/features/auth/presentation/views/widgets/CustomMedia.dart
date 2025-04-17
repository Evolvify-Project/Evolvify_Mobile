import 'package:evolvify/features/auth/presentation/views/widgets/social_media_Item.dart';
import 'package:flutter/material.dart';

class CustomMedia extends StatelessWidget {
  const CustomMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialMediaItem(image: 'assets/images/google.svg'),
          SocialMediaItem(image: 'assets/images/facebook.svg'),
          SocialMediaItem(image: 'assets/images/apple2.svg'),
        ],
      ),
    );
  }
}
