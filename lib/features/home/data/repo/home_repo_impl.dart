import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/data/models/skill_model.dart';
import 'package:evolvify/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<CoursesModel>>> getMostWatchingSkill() async {
    try {
      var data = await ApiServices().get(endPoint: 'Courses');

      List<CoursesModel> mostWatchingSkillsList =
          (data["data"] as List)
              .map((course) => CoursesModel.fromJson(course))
              .toList();

      // print(mostWatchingSkillsList);
      return right(mostWatchingSkillsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoursesModel>>> getAllCoursesOfSkill({
    required skillId,
  }) async {
    try {
      var data = await ApiServices().get(endPoint: 'Courses?SkillId=$skillId');

      List<CoursesModel> allCoursesOfSkillList =
          (data["data"] as List)
              .map((course) => CoursesModel.fromJson(course))
              .toList();

      print(allCoursesOfSkillList);
      return right(allCoursesOfSkillList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SkillModel>>> getSkill() async{
  try {
      var data = await ApiServices().get(endPoint: 'Skills');

      List<SkillModel> skillsList =
          (data["data"] as List)
              .map((skill) => SkillModel.fromJson(skill))
              .toList();
      return right(skillsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
