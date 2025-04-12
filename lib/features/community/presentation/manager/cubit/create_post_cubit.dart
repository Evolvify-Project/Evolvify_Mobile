import 'package:bloc/bloc.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';
import 'package:evolvify/features/community/data/repo/repo_create_post_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  emit(CreatePostloading);
  Future<void> createpost(content) async {
    var result = RepoCreatePostImpl().createPost(content: content);
    emit(CreatePostsuccess());
  }
}
