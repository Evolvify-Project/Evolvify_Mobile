import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/community/data/models/comment_model.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';
import 'package:evolvify/features/community/data/repo/repo_post.dart';

class RepoPostImpl implements RepoPost {
  @override
  Future<Either<Failure, PostModel>> createPost({required content}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post',
        data: {'content': content},
      );
      return right(PostModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> fetchAllPosts() async {
    try {
      var data = await ApiServices().get(endPoint: 'Community/Post');
      List<PostModel> postsList = [];
      for (var item in data['data']) {
        postsList.add(PostModel.fromJson(item));
      }

      return right(postsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostModel>> likePost(String postId) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post/$postId/like',
      );
      return right(PostModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostModel>> commentOnPost(
    String postId,
    String content,
  ) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post/$postId/comment',
        data: {'content': content},
      );
      return right(PostModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CommentModel>> replyToComment(
    String commentId,
    String content,
  ) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Comment/$commentId/reply',
        data: {'content': content},
      );
      return right(CommentModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
