import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/quiz/data/models/quiz_model/quiz_model.dart';

abstract class QuizRepo {
  Future<Either<Failure, String>> quizAttempts({quizId});
  Future<Either<Failure, List<QuizModel>>> getquizQues({quizId});
}
