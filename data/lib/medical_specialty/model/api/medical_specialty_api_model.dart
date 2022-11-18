import 'package:equatable/equatable.dart';

class MedicalSpecialtyApiModel extends Equatable {
  const MedicalSpecialtyApiModel({
    required this.data
  });

  final List<MedicalSpecialtyItemApiModel> data;

  factory MedicalSpecialtyApiModel.fromJson(Map<String, dynamic> json) =>
      MedicalSpecialtyApiModel(
          data: (json["data"] as List).map((data) =>
              MedicalSpecialtyItemApiModel.fromJson(data)).toList()
      );

  @override
  List<Object> get props => [data];
}

class MedicalSpecialtyItemApiModel extends Equatable {
  const MedicalSpecialtyItemApiModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory MedicalSpecialtyItemApiModel.fromJson(Map<String, dynamic> json) =>
      MedicalSpecialtyItemApiModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  List<Object> get props => [id, name];
}


