import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/community/data/models/comment.dart';
import 'package:evolvify/features/community/data/models/comment_model.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/data/models/reply.dart';

abstract class RepoPost {
  Future<Either<Failure, PostModel>> createPost({required content});
  Future<Either<Failure, List<PostModel>>> fetchAllPosts();
  Future<Either<Failure, PostModel>> likePost(String postId);
  Future<Either<Failure,List<CommentModel2>>> fetchAllComments(String postId);
  Future<Either<Failure, CommentModel>> commentOnPost(
    String postId,
    String content,
  );
  Future<Either<Failure, ReplyModel>> replyToComment(
    String commentId,
    String content,
    String postId,
  );
}
