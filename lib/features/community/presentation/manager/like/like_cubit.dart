import 'package:bloc/bloc.dart';

import 'package:evolvify/features/community/data/models/like_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());
  @override
  Map<String, bool> islikepost = {};
  Map<String, int> likeCount = {};
  Future<void> likeOnPost(postId, {required bool currentlyLiked}) async {
    var result = await RepoPostImpl().likePost(postId);
    result.fold(
      (failure) {
        emit(LikeFailure(failure.errMessge));
      },
      (like) {
        bool newLikeStatus = !currentlyLiked;
        int currentCount = likeCount[postId] ?? like.likesCount ?? 0;

        int newLikesCount = newLikeStatus ? currentCount + 1 : currentCount - 1;

        islikepost[postId] = newLikeStatus;
        likeCount[postId] = newLikesCount;
        emit(
          LikeSuccess(
            postId: postId,
            isLiked: newLikeStatus,
            likesCount: newLikesCount,
          ),
        );
      },
    );
  }

  bool isPostLiked(String postId) => islikepost[postId] ?? false;

  int getLikesCount(String postId, int originalCount) =>
      likeCount[postId] ?? originalCount;
}
