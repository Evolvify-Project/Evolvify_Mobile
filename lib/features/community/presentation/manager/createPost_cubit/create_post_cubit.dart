import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  Future<void> createpost(content) async {
    emit(CreatePostloading());
    try {
      var result = RepoPostImpl().createPost(content: content);
      emit(CreatePostsuccess());
    } on Exception catch (e) {
      emit(CreatePostfailure(errMassage: e.toString()));
      
    }
  }
}
