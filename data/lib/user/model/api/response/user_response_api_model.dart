import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:equatable/equatable.dart';

class UserResponseApiModel extends Equatable {
  UserResponseApiModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.displayName,
    required this.crm,
    required this.email,
    required this.verified,
    this.authentication
  });

  final String id;
  final String name;
  final MedicalSpecialtyItemResponseApiModel specialty;
  final String displayName;
  final String crm;
  final String email;
  final bool verified;
  CredentialTokenResponseApiModel? authentication;

  factory UserResponseApiModel.fromJson(Map<String, dynamic> json) => UserResponseApiModel(
    id: json["id"],
    name: json["name"],
    specialty: MedicalSpecialtyItemResponseApiModel.fromJson(json["specialty"]),
    displayName: json["display_name"],
    crm: json["crm"],
    email: json["email"],
    verified: json["verified"],
    authentication: json["authentication"] != null ? CredentialTokenResponseApiModel.fromJson(json["authentication"]) : null,
  );

  @override
  List<Object?> get props => [id, name, specialty, displayName, crm, email, verified, authentication];
}