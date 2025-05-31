import 'package:equatable/equatable.dart';

class Module extends Equatable {
  final int? id;
  final String? title;
  final String? contentType;

  const Module({this.id, this.title,this.contentType});

  factory Module.fromJson(Map<String, dynamic> json) =>
      Module(id: json['id'] as int?, title: json['title'] as String?, contentType: json["contentType"] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'title': title,"contentType":contentType};

  @override
  List<Object?> get props => [id, title,contentType];
}
