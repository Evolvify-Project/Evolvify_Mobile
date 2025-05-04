import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:evolvify/features/community/presentation/manager/fetchPosts_cubit/fetch_posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(this.fetchCubit) : super(CreatePostInitial());

  final FetchPostsCubit fetchCubit;
  Future<void> createpost(content) async {
    emit(CreatePostloading());

    final result = await RepoPostImpl().createPost(content: content);

    result.fold(
      (failure) {
        emit(CreatePostfailure(errMassage: failure.errMessge));
      },
      (newPost) async {
        await fetchCubit.fetchAllposts();

        print(newPost);

        emit(CreatePostsuccess());
      },
    );
  }
}
