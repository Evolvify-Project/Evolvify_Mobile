import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Courses/data/models/modules/all_modules/courses_module.dart';
import 'package:evolvify/features/Courses/data/models/modules/modules_of_course.dart';
import 'package:evolvify/features/Courses/data/repo/courses_repo.dart';

class CoursesRepoImpl implements CoursesRepo {
  @override
  Future<Either<Failure, ModulesOfCourse>> getModulesOfCourse({
    required int id,
  }) async {
    try {
      var data = await ApiServices().get(endPoint: 'Courses/$id');

      var response = ModulesOfCourse.fromJson(data['data']);

      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CoursesOfModuleModel>> getAllCoursesOfModule({
    required int courseId,
    required int moduleId,
  }) async {
    try {
      var data = await ApiServices().get(
        endPoint: 'Course/$courseId/Modules/$moduleId',
      );

      var response = CoursesOfModuleModel.fromJson(data['data']);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
