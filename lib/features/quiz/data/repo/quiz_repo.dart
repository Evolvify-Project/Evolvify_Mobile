import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/quiz/data/models/quiz_model/quiz_model.dart';
import 'package:evolvify/features/quiz/data/models/quiz_score_model/score.dart';

abstract class QuizRepo {
  Future<Either<Failure, int>> quizAttempts({quizId});
  Future<Either<Failure, List<QuizModel>>> getquizQues({quizId});
  Future<Either<Failure, Map<String, dynamic>>> submitquizAnswers(
    quizAttemptId,
    answerId,
  );
  Future<Either<Failure, Score>> getScore({quizAttemptId});
}
