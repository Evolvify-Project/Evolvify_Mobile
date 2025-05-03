import 'package:evolvify/features/community/presentation/views/widgets/Custom_TextField_Comment.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comment_section.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatefulWidget {
  const CommentsList({super.key});

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  final bool isShowTextField = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CommentSection(
            onTapReply: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
