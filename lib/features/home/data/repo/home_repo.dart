import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/home/data/models/skill_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CoursesModel>>> getMostWatchingSkill();
  Future<Either<Failure, List<CoursesModel>>> getAllCoursesOfSkill({
    required skillId,
  });
  
  Future<Either<Failure, List<SkillModel>>> getSkill();
}
