import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/presentation/manager/like/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLikeOnPost extends StatefulWidget {
  CustomLikeOnPost({super.key, required this.postModel});

  PostModel postModel;

  @override
  State<CustomLikeOnPost> createState() => _CustomLikeOnPostState();
}

class _CustomLikeOnPostState extends State<CustomLikeOnPost> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LikeCubit, LikeState>(
      listener: (context, state) {
        if (state is LikeSuccess) {}
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<LikeCubit>(context);
        final isLiked = cubit.isPostLiked(widget.postModel.id ?? ' ');
        final count = cubit.getLikesCount(
          widget.postModel.id ?? ' ',
          (widget.postModel.likesCount ?? 0),
        );

        return Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<LikeCubit>(
                  context,
                ).likeOnPost(widget.postModel.id, currentlyLiked: isLiked);
                print(widget.postModel.id);
              },

              child: Icon(
                Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
              ),
            ),

            SizedBox(width: 3),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 10,
                color: Color(0xffA8A8A8),
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
