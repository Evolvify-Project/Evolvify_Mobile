import 'package:equatable/equatable.dart';

import 'modules_of_course.dart';

class Modules extends Equatable {
  final Data? data;

  const Modules({this.data});

  factory Modules.fromJson(Map<String, dynamic> json) => Modules(
    data:
        json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'data': data?.toJson()};

  @override
  List<Object?> get props => [data];
}
