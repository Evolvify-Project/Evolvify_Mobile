import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Courses/data/models/modules/modules_of_course.dart';


abstract class CoursesRepo {
  Future<Either<Failure, ModulesOfCourse>> getModulesOfCourse({required int id});
}
