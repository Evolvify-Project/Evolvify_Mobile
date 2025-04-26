import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/community/presentation/views/widgets/Custom_TextField_Comment.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comment_section.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comments_list.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // SizedBox(height: 20),
            // Row(
            //   children: [
            //     CutsomArrowios(),
            //     Text(
            //       '16 Comments',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            //     ),
            //   ],
            // ),
            CommentsList(),
           
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Row(
            //     children: [
            //       CircleAvatar(backgroundImage: AssetImage(Assets.imagesUser)),
            //       SizedBox(width: 10),
            //       Expanded(child: CustomTextFieldComment()),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
