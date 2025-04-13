import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';

abstract class RepoPost {
  Future<Either<Failure, PostModel>> createPost({required content});
  Future<Either<Failure, List<PostModel>>> fetchAllPosts();
  Future<void> likePost(String postId);
  Future<void> commentOnPost(String postId, String content);
  Future<void> replyToComment(String commentId, String content);
}
