import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';
import 'package:evolvify/features/community/data/repo/repo_create_post.dart';

class RepoCreatePostImpl implements RepoCreatePost {
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
}
