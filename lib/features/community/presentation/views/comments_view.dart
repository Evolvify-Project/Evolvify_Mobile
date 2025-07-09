import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchAllcomments/fetch_allcomments_cubit.dart';
import 'package:evolvify/features/community/presentation/views/widgets/Custom_TextField_Comment.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comments_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key, required this.postModel});
  final PostModel postModel;
  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              CutsomArrowios(),
              Text(
                ' Comments',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 14),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          Expanded(child: CommentsList()),
        ],
      ),

      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 15,
            right: 15,
            top: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(Assets.imagesUser)),
              SizedBox(width: 10),
              Expanded(
                child: CustomTextFieldComment(
                  hintText: '    Add a comment...',
                  commentController: commentController,
                  onPressedComment: () async {
                    final comment = commentController.text.trim();
                    if (comment.isNotEmpty) {
                      await BlocProvider.of<CommentCubit>(
                        context,
                      ).comment(widget.postModel.id, comment);
                      await context
                          .read<FetchAllcommentsCubit>()
                          .fetchAllComments(widget.postModel.id);
                      print(comment);
                      commentController.clear();
                    } else {
                      showSnackBar(
                        context,
                        text: 'comment content cannot be empty.',
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
