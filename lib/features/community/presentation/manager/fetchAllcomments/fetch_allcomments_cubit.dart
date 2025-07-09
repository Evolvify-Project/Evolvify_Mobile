import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/community/data/models/comment_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';

part 'fetch_allcomments_state.dart';

class FetchAllcommentsCubit extends Cubit<FetchAllcommentsState> {
  FetchAllcommentsCubit() : super(FetchAllcommentsInitial());
  List<CommentModel2> comments = [];
  Future<void> fetchAllComments(postId) async {
    emit(FetchAllcommentsLoading());
    var commentsList = await RepoPostImpl().fetchAllComments(postId);
    commentsList.fold(
      (failure) {
        emit(FetchAllcommentsFailure(errMessage: failure.errMessge));
      },
      (commentsList) {
        comments = commentsList;
        emit(FetchAllcommentsSuccess(allComments: comments));
      },
    );
  }

  void addNewPost(CommentModel2 newComment) {
    comments.insert(0, newComment);
    emit(FetchAllcommentsSuccess(allComments: List.from(comments)));
  }
}
