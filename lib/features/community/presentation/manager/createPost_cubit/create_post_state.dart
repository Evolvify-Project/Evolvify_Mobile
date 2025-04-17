part of 'create_post_cubit.dart';

@immutable
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostloading extends CreatePostState {}

final class CreatePostsuccess extends CreatePostState {}

final class CreatePostfailure extends CreatePostState {
  final String errMassage;

  CreatePostfailure({required this.errMassage});
}
