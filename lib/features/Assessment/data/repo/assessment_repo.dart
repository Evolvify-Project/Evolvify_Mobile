import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/data/models/recommend_courses/recommend_courses.dart';

abstract class AssessmentRepo {
  Future<Either<Failure, List<QuestionModel>>> getQuestions();
  Future<Either<Failure, List<SkillResult>>> submitAnswers(
    Map<String, Map<String, String>> answers,
  );
  Future<Either<Failure, List<RecommendCoursesModel>>> getRecommendCourses();
}
