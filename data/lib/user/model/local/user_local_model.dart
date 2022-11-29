import 'package:equatable/equatable.dart';

class UserLocalModel extends Equatable {
  const UserLocalModel({
    required this.id,
    required this.name,
    required this.specialtyId,
    required this.specialtyName,
    required this.displayName,
    required this.crm,
    required this.email,
    required this.verified,
  });

  final String id;
  final String name;
  final int specialtyId;
  final String specialtyName;
  final String displayName;
  final String crm;
  final String email;
  final bool verified;


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'specialtyId': specialtyId,
      'specialtyName': specialtyName,
      'displayName': displayName,
      'crm': crm,
      'email': email,
      'verified': verified,
    };
  }

  fromJson(Map<String, dynamic> json) => UserLocalModel(
      id : json['id'],
      name : json['name'],
      specialtyId : json['specialtyId'],
      specialtyName : json['name'],
      displayName : json['displayName'],
      crm : json['crm'],
      email : json['name'],
      verified : json['verified']);


  @override
  List<Object?> get props => [id, name, specialtyId, specialtyName, displayName, crm, email, verified];
}
