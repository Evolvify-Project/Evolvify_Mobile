part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentSuccess extends CommentState {
  final CommentModel comment;
  CommentSuccess(this.comment);
}

class CommentFailure extends CommentState {
  final String error;
  CommentFailure(this.error);
}
