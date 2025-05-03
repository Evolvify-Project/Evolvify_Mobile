import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
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
    var c = context.read<CommentCubit>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CutsomArrowios(),
                Text(
                  '16 Comments',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            CommentsList(),
            BlocConsumer<CommentCubit, CommentState>(
              listener: (context, state) {
                if (state is CommentSuccess) {
                  
                } else if (state is CommentFailure) {
                  showSnackBar(context, text: 'Error: ${state.error}');
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.imagesUser),
                      ),
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
