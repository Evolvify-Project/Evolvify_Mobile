import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommentOnPost extends StatelessWidget {
  const CommentOnPost({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCommentsViewg,extra: postModel);
          },
          child: Image.asset(Assets.imagesComment),
        ),

        SizedBox(width: 3),
        Text(
          postModel.commentsCount.toString(),
          style: TextStyle(
            fontSize: 8,
            color: Color(0xffA8A8A8),
            fontWeight: FontWeight.w300,
          ),
        ),
        Image.asset(Assets.imagesShare),
      ],
    );
  }
}
