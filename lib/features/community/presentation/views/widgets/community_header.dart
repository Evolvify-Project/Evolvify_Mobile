import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Community', style: AppStyle.styleSemiBold24(context)),

        GestureDetector(
          onTap: () async {
            GoRouter.of(context).push(AppRouter.kCreatePost);
          },
          child: Image.asset(Assets.imagesProfileImage, height: 45, width: 45),
        ),
      ],
    );
  }
}
