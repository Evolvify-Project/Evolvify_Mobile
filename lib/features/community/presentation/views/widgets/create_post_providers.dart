import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/createPost_cubit/create_post_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/cubit/reply_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/like/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostProviders {
  static List<BlocProvider> providers(BuildContext context) => [
    BlocProvider(create: (context) => FetchPostsCubit()..fetchAllposts()),
    BlocProvider(
      create:
          (context) => CreatePostCubit(() {
            BlocProvider.of<FetchPostsCubit>(context).fetchAllposts();
          }),
    ),
    BlocProvider(create: (context) => LikeCubit()),
    BlocProvider(create: (context) => CommentCubit()),
    BlocProvider(create: (context) => ReplyCubit()),
  ];
}
