part of 'fetch_posts_cubit.dart';

@immutable
sealed class FetchPostsState {}

final class FetchPostsInitial extends FetchPostsState {}

final class FetchPostsloading extends FetchPostsState {}

final class FetchPostssuccess extends FetchPostsState {
  final List<PostModel> posts;

  FetchPostssuccess({required this.posts});
}

final class FetchPostsfailure extends FetchPostsState {
  final String errMassage;

  FetchPostsfailure({required this.errMassage});
}
