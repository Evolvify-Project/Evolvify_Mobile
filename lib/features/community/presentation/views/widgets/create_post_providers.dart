import 'package:evolvify/features/community/presentation/manager/comment/comment_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/createPost_cubit/create_post_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/reply_cubit/reply_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';
import 'package:evolvify/features/community/presentation/manager/like/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostProviders {
  static Widget buildWithProviders(Widget child) {
    return BlocProvider<FetchPostsCubit>(
      create: (context) => FetchPostsCubit()..fetchAllposts(),
      child: Builder(
        builder: (context) {
          final fetchCubit = BlocProvider.of<FetchPostsCubit>(context);

          return MultiBlocProvider(
            providers: [
              BlocProvider<CreatePostCubit>(
                create: (_) => CreatePostCubit(fetchCubit),
              ),
              BlocProvider<LikeCubit>(create: (_) => LikeCubit()),
              BlocProvider<CommentCubit>(create: (_) => CommentCubit()),
              BlocProvider<ReplyCubit>(create: (_) => ReplyCubit()),
            ],
            child: child,
          );
        },
      ),
    );
  }

}
