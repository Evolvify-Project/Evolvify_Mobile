import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Courses/data/models/modules/modules_of_course.dart';
import 'package:evolvify/features/Courses/data/repo/courses_repo.dart';
class CoursesRepoImpl implements CoursesRepo {
  @override
  Future<Either<Failure, List<ModulesOfCourse>>> getModulesOfCourse({
    required id,
  }) async {
    try {
      var data = await ApiServices().get(endPoint: 'Courses/${id}');

      List<ModulesOfCourse> modulesOfCourseList =
          (data["data"] as List)
              .map((module) => ModulesOfCourse.fromJson(module))
              .toList();
      print(modulesOfCourseList);
      return right(modulesOfCourseList);
    } on Exception catch (e) {
      if (e is DioException) {
        
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
