import 'package:equatable/equatable.dart';

import 'content.dart';

class AllModulesModel extends Equatable {
  final int? id;
  final String? title;
  final int? courseId;
  final List<Content>? contents;

  const AllModulesModel({this.id, this.title, this.courseId, this.contents});

  factory AllModulesModel.fromJson(Map<String, dynamic> json) => AllModulesModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    courseId: json['courseId'] as int?,
    contents:
        (json['contents'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'courseId': courseId,
    'contents': contents?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [id, title, courseId, contents];
}
