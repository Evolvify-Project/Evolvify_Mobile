import 'dart:convert';

import 'package:equatable/equatable.dart';

class Choices extends Equatable {
  final String? a;
  final String? b;
  final String? c;
  final String? d;

  const Choices({this.a, this.b, this.c, this.d});

  factory Choices.fromMap(Map<String, dynamic> data) => Choices(
    a: data['a'] as String?,
    b: data['b'] as String?,
    c: data['c'] as String?,
    d: data['d'] as String?,
  );

  Map<String, dynamic> toMap() => {'a': a, 'b': b, 'c': c, 'd': d};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Choices].
  factory Choices.fromJson(String data) {
    return Choices.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Choices] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [a, b, c, d];
}
