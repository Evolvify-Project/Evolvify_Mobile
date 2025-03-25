import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Community', style: AppStyle.styleSemiBold24),

        SvgPicture.asset(Assets.imagesPlus),
      ],
    );
  }
}
