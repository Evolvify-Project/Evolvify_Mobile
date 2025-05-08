import 'package:equatable/equatable.dart';

import 'module.dart';

class Data extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? category;
  final String? level;
  final String? duration;
  final int? numberOfModules;
  final List<Module>? modules;

  const Data({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.category,
    this.level,
    this.duration,
    this.numberOfModules,
    this.modules,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    category: json['category'] as String?,
    level: json['level'] as String?,
    duration: json['duration'] as String?,
    numberOfModules: json['numberOfModules'] as int?,
    modules:
        (json['modules'] as List<dynamic>?)
            ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'category': category,
    'level': level,
    'duration': duration,
    'numberOfModules': numberOfModules,
    'modules': modules?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      imageUrl,
      category,
      level,
      duration,
      numberOfModules,
      modules,
    ];
  }
}
