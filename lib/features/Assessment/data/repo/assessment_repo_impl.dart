
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';

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

      print(questionList);
      return right(questionList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
