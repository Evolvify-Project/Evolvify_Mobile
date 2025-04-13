part of 'like_cubit.dart';

@immutable
sealed class LikeState {}

final class LikeInitial extends LikeState {}
class LikeLoading extends LikeState {}
class LikeSuccess extends LikeState {
  final LikeModel like;
  LikeSuccess(this.like);
}
class LikeFailure extends LikeState {
  final String error;
  LikeFailure(this.error);
}