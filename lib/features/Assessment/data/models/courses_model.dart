import 'package:equatable/equatable.dart';

class CoursesModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? skill;
  final String? level;
  final String? duration;


  const CoursesModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.skill,
    this.level,
    this.duration,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    skill: json['skill'] as String?,
    level: json['level'] as String?,
    duration: json['duration'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'skill': skill,
    'level': level,
    'duration': duration,
  };

  @override
  List<Object?> get props {
    return [id, title, description, imageUrl, skill, level, duration];
  }
}
