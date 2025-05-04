import 'package:equatable/equatable.dart';

class RecommendCourses extends Equatable {
  final String? skill;
  final String? level;
  final List<dynamic>? courses;

  const RecommendCourses({this.skill, this.level, this.courses});

  factory RecommendCourses.fromJson(Map<String, dynamic> json) {
    return RecommendCourses(
      skill: json['skill'] as String?,
      level: json['level'] as String?,
      courses: json['courses'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'skill': skill,
    'level': level,
    'courses': courses,
  };

  @override
  List<Object?> get props => [skill, level, courses];
}
