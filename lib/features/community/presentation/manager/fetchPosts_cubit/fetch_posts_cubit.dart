import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  FetchPostsCubit() : super(FetchPostsInitial());

  Future<void> fetchAllposts() async {
    emit(FetchPostsloading());
    var postsList = await RepoPostImpl().fetchAllPosts();
    postsList.fold(
      (Failure) {
        emit(FetchPostsfailure(errMassage: Failure.errMessge));
      },
      (PostsList) {
        emit(FetchPostssuccess(posts: PostsList));
      },
    );
  }
}
