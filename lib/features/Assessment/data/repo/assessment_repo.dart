import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';



abstract class AssessmentRepo {
  Future<Either<Failure, List< QuestionModel>>> getQuestions();
}
