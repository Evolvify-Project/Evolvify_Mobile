import 'package:bloc/bloc.dart';

import 'package:evolvify/features/community/data/models/like_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());
  @override
  void emit(LikeLoading);
  Future<void> like(postId) async {
    var result = await RepoPostImpl().likePost(postId);
    result.fold(
      (failure) {
        emit(LikeFailure(failure.errMessge));
      },
      (like) {
        emit(LikeSuccess(like));
      },
    );
  }
}
