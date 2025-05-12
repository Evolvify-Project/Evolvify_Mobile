import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  
  
  Future<Either<Failure, List<CoursesModel>>> search(
    String query, {
    int pageNumber = 1,
    int pageSize = 10,
    int sortBy = 1,
    int? skillId,
    int? level,
  }) async {
    try {
      var data = await ApiServices().get(
        endPoint:
           'Courses?Search=$query&PageNumber=$pageNumber'
      '&PageSize=$pageSize&SortBy=$sortBy'
      '${skillId != null ? '&SkillId=$skillId' : ''}'
      '${level != null ? '&Level=$level' : ''}'
      );
      List<CoursesModel> searchCoursesList =
          (data["data"] as List)
              .map((course) => CoursesModel.fromJson(course))
              .toList();
      return right(searchCoursesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
