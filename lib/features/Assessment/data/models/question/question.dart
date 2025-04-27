import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class Question extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List<Datum>? data;
  final List<dynamic>? errors;

  const Question({
    this.success,
    this.statusCode,
    this.message,
    this.data,
    this.errors,
  });

  factory Question.fromMap(Map<String, dynamic> data) => Question(
    success: data['success'] as bool?,
    statusCode: data['statusCode'] as int?,
    message: data['message'] as String?,
    data:
        (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
    errors: data['errors'] as List<dynamic>?,
  );

  Map<String, dynamic> toMap() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data?.map((e) => e.toMap()).toList(),
    'errors': errors,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Question].
  factory Question.fromJson(String data) {
    return Question.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Question] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [success, statusCode, message, data, errors];
}
