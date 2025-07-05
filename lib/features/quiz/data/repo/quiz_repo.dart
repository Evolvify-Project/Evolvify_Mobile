import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';


abstract class QuizRepo {
  Future<Either<Failure, String>> quizAttempts({quizId});
}