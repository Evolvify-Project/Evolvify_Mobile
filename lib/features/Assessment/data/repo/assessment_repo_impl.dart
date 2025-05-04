import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';

import 'package:evolvify/features/Assessment/data/repo/assessment_repo.dart';

class AssessmentRepoImpl implements AssessmentRepo {
  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
    try {
      var data = await ApiServices().get(endPoint: 'Assessments/questions');

      List<QuestionModel> questionList =
          (data["data"] as List)
              .map((question) => QuestionModel.fromJson(question))
              .toList();

      // print(questionList);
      return right(questionList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SkillResult>>> submitAnswers(
    Map<String, Map<String, String>> answers,
  ) async {
    try {
      print('🔍 Answers being sent: $answers');
      var data = await ApiServices().post(
        endPoint: 'Assessments/submit-answers',
        data: answers,
      );

      final resultsJson = (data['data']?['results'] ?? []) as List;
      final results =
          resultsJson
              .map((e) => SkillResult.fromJson(e as Map<String, dynamic>))
              .toList();

      print(results);
      return right(results);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendCoursesModel>>>
  getRecommendCourses() async {
    try {
      var data = await ApiServices().get(endPoint: 'Courses/recommended');

      List<RecommendCoursesModel> recommendCoursesList =
          (data["data"] as List)
              .map((course) => RecommendCoursesModel.fromJson(course))
              .toList();

      print(recommendCoursesList);
      return right(recommendCoursesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
