import 'package:equatable/equatable.dart';

class Module extends Equatable {
  final int? id;
  final String? title;

  const Module({this.id, this.title});

  factory Module.fromJson(Map<String, dynamic> json) =>
      Module(id: json['id'] as int?, title: json['title'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'title': title};

  @override
  List<Object?> get props => [id, title];
}
