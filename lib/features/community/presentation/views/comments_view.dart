import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comment_section.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommentSection(),
        ],
      ),
    );
  }
}
