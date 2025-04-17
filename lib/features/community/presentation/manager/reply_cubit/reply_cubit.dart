import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/models/reply_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'reply_state.dart';

class ReplyCubit extends Cubit<ReplyState> {
  ReplyCubit() : super(ReplyInitial());
  emit(ReplyLoading);

  Future<void> reply(postId, content, commentId) async {
    var result = await RepoPostImpl().replyToComment(
      commentId,
      postId,
      content,
    );
    result.fold(
      (failure) {
        emit(ReplyFailure(failure.errMessge));
      },
      (reply) {
        emit(ReplySuccess(reply));
      },
    );
  }
}
