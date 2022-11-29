import 'package:equatable/equatable.dart';
import 'package:model/data/medical_specialty.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.specialty,
    required this.displayName,
    required this.crm,
    required this.email,
    required this.verified,
  });

  final String id;
  final String name;
  final MedicalSpecialty specialty;
  final String displayName;
  final String crm;
  final String email;
  final bool verified;

  @override
  List<Object> get props => [id, name, specialty, displayName, crm, email, verified];
}