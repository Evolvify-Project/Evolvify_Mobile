part of 'reply_cubit.dart';

@immutable
sealed class ReplyState {}

final class ReplyInitial extends ReplyState {}
class ReplyLoading extends ReplyState {}
class ReplySuccess extends ReplyState {
  final ReplyModel reply;
  ReplySuccess(this.reply);
}
class ReplyFailure extends ReplyState {
  final String error;
  ReplyFailure(this.error);
}
