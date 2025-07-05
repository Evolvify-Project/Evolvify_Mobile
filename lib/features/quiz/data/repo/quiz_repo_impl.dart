import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/quiz/data/repo/quiz_repo.dart';

class QuizRepoImpl implements QuizRepo {
  @override
  Future<Either<Failure, String>> quizAttempts({quizId}) async{
 
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/login',
        data: {"quizId" : quizId},
      );

      print('📩 MESSAGE: ${data['message']}');
      

      return right(data["message"]);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
 
  }

