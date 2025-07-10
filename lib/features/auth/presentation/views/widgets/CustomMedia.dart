import 'package:evolvify/core/utils/app_images.dart';
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
          SocialMediaItem(image: Assets.imagesLogosFacebook),

          SocialMediaItem(image: Assets.imagesGoogle),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xffE1E1E1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(child: Icon(Icons.apple_outlined, size: 40)),
            ),
          ),
        ],
      ),
    );
  }
}
