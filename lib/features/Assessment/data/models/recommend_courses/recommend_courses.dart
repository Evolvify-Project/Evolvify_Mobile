import 'package:equatable/equatable.dart';

class RecommendCoursesModel extends Equatable {
  final String? skill;
  final String? level;
  final List<dynamic>? courses;

  const RecommendCoursesModel({this.skill, this.level, this.courses});

  factory RecommendCoursesModel.fromJson(Map<String, dynamic> json) {
    return RecommendCoursesModel(
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
