import 'package:equatable/equatable.dart';

class MedicalSpecialtyResponseApiModel extends Equatable {
  const MedicalSpecialtyResponseApiModel({
    required this.data
  });

  final List<MedicalSpecialtyItemResponseApiModel> data;

  factory MedicalSpecialtyResponseApiModel.fromJson(Map<String, dynamic> json) =>
      MedicalSpecialtyResponseApiModel(
          data: (json["data"] as List).map((data) =>
              MedicalSpecialtyItemResponseApiModel.fromJson(data)).toList()
      );

  @override
  List<Object> get props => [data];
}

class MedicalSpecialtyItemResponseApiModel extends Equatable {
  const MedicalSpecialtyItemResponseApiModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory MedicalSpecialtyItemResponseApiModel.fromJson(Map<String, dynamic> json) =>
      MedicalSpecialtyItemResponseApiModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  List<Object> get props => [id, name];
}


