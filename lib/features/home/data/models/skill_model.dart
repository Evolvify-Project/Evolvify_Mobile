import 'package:equatable/equatable.dart';

class SkillModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  const SkillModel({this.id, this.name, this.description});

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };

  @override
  List<Object?> get props => [id, name, description];
}
