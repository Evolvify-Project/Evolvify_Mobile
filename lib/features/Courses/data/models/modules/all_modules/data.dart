import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Courses/data/models/modules/all_modules/all_modules.dart';



class Data extends Equatable {
  final AllModulesModel? data;

  const Data({this.data});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data:
        json['data'] == null
            ? null
            : AllModulesModel.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'data': data?.toJson()};

  @override
  List<Object?> get props => [data];
}
