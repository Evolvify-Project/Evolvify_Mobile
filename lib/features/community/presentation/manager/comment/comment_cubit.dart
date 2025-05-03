import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/models/comment.dart';

import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());
    
  Future<void> comment(postId, content) async {
    emit(CommentLoading());
    var result = await RepoPostImpl().commentOnPost(postId, content);
    result.fold(
      (failure) {
        emit(CommentFailure(failure.errMessge));
      },
      (comment) {
        emit(CommentSuccess(comment));
      },
    );
  }
}
