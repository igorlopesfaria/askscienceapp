import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:data/user/model/api/response/user_authentication_response_api_model.dart';
import 'package:equatable/equatable.dart';

class UserRegistrationResponseApiModel extends Equatable {
  const UserRegistrationResponseApiModel({
    required this.data
  });

  final UserResponseApiModel data;

  factory UserRegistrationResponseApiModel.fromJson(Map<String, dynamic> json) => UserRegistrationResponseApiModel(
      data: json["data"]
  );

  @override
  List<Object> get props => [data];
}

class UserResponseApiModel extends Equatable {
  UserResponseApiModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.displayName,
    required this.crm,
    required this.email,
    required this.verified,
    required this.authentication
  });

  final String id;
  final String name;
  final MedicalSpecialtyItemResponseApiModel specialty;
  final String displayName;
  final String crm;
  final String email;
  final bool verified;
  UserTokenResponseApiModel? authentication;

  factory UserResponseApiModel.fromJson(Map<String, dynamic> json) => UserResponseApiModel(
    id: json["id"],
    name: json["name"],
    specialty: MedicalSpecialtyItemResponseApiModel.fromJson(json["specialty"]),
    displayName: json["display_name"],
    crm: json["crm"],
    email: json["email"],
    verified: json["verified"],
    authentication: json["authentication"] != null ? UserTokenResponseApiModel.fromJson(json["authentication"]) : null,
  );

  @override
  List<Object?> get props => [id, name, specialty, displayName, crm, email, verified, authentication];
}