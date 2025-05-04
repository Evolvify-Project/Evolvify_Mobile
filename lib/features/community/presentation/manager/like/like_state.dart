part of 'like_cubit.dart';

@immutable
sealed class LikeState {}

final class LikeInitial extends LikeState {}

class LikeLoading extends LikeState {}

class LikeSuccess extends LikeState {
  final String postId;
  final bool isLiked;
  final int likesCount;

  LikeSuccess({
    required this.postId,
    required this.isLiked,
    required this.likesCount,
  });
}

class LikeFailure extends LikeState {
  final String error;
  LikeFailure(this.error);
}
