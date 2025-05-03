
import 'package:evolvify/features/community/presentation/manager/createPost_cubit/create_post_cubit.dart';

import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreatePostProviders {
  static Widget buildWithProviders(Widget child) {
    return Builder(
      builder: (context) {
        final fetchCubit = BlocProvider.of<FetchPostsCubit>(context);

        return BlocProvider<CreatePostCubit>(
          create: (_) => CreatePostCubit(fetchCubit),
          child: child,
        );
      },
    );
  }
}