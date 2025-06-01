import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<CoursesModel>>> search(
    String query, {
    int pageNumber,
    int pageSize,
    int sortBy,
    int? skillId,
    int? level,
  });
}
