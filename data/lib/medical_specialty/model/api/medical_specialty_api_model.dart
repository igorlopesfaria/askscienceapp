import 'package:equatable/equatable.dart';

class MedicalSpecialtyApiModel extends Equatable {
  const MedicalSpecialtyApiModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory MedicalSpecialtyApiModel.fromJson(Map<String, dynamic> json) =>
      MedicalSpecialtyApiModel(
        id: json["id"],
        name: json["name"],
      );

  @override
  List<Object> get props => [id, name];
}

