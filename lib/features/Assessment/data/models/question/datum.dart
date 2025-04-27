// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// import 'choices.dart';

// class Datum extends Equatable {
//   final String? questionId;
//   final String? code;
//   final String? questionText;
//   final Choices? choices;

//   const Datum({this.questionId, this.code, this.questionText, this.choices});

//   factory Datum.fromMap(Map<String, dynamic> data) => Datum(
//     questionId: data['questionId'] as String?,
//     code: data['code'] as String?,
//     questionText: data['questionText'] as String?,
//     choices:
//         data['choices'] == null
//             ? null
//             : Choices.fromMap(data['choices'] as Map<String, dynamic>),
//   );

//   Map<String, dynamic> toMap() => {
//     'questionId': questionId,
//     'code': code,
//     'questionText': questionText,
//     'choices': choices?.toMap(),
//   };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [Datum].
//   factory Datum.fromJson(String data) {
//     return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [Datum] to a JSON string.
//   String toJson() => json.encode(toMap());

//   @override
//   List<Object?> get props => [questionId, code, questionText, choices];
// }
