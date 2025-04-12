import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/community/data/models/post_model.dart';

abstract class RepoCreatePost {
  Future<Either<Failure, PostModel>> createPost({required content});
}
