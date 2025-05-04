import 'package:bloc/bloc.dart';
import 'package:evolvify/features/community/data/models/post.dart';

import 'package:evolvify/features/community/data/repo/repo_post_impl.dart';
import 'package:meta/meta.dart';

part 'fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  FetchPostsCubit() : super(FetchPostsInitial());
  List<PostModel> posts = [];
  Future<void> fetchAllposts() async {
    emit(FetchPostsloading());
    var postsList = await RepoPostImpl().fetchAllPosts();
    postsList.fold(
      (failure) {
        emit(FetchPostsfailure(errMassage: failure.errMessge));
      },
      (postsList) {
        posts = postsList;
        emit(FetchPostssuccess(posts: postsList));
      },
    );
  }

  void addNewPost(PostModel newPost) {
    posts.insert(0, newPost);
    emit(FetchPostssuccess(posts: List.from(posts)));
  }
}
