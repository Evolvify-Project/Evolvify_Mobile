import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/community/data/models/comment.dart';
import 'package:evolvify/features/community/data/models/comment_model.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/data/models/reply.dart';

import 'package:evolvify/features/community/data/repo/repo_post.dart';

class RepoPostImpl implements RepoPost {
  @override
  Future<Either<Failure, PostModel>> createPost({required content}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post',
        data: {'content': content},
      );
      // print(PostModel.fromJson(data));
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
      print(postsList);
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
        endPoint: 'Community/Post/$postId/Like',
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
  Future<Either<Failure, CommentModel>> commentOnPost(
    String postId,
    String content,
  ) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post/$postId/Comment',
        data: {'content': content},
      );
      print(data);
      return right(CommentModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReplyModel>> replyToComment(
    String commentId,
    String postId,
    String content,
  ) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Community/Post/$postId/Comment/$commentId/Reply',
        data: {'content': content},
      );
      return right(ReplyModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<CommentModel2>>> fetchAllComments(String postId)async {
    try {
      var data = await ApiServices().get(endPoint: 'Community/Post/$postId/Comment');
      List<CommentModel2> commentsList = [];
      for (var item in data['data']) {
        commentsList.add(CommentModel2.fromJson(item));
      }
      print(commentsList);
      return right(commentsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
  
}
