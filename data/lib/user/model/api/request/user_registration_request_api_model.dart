import 'package:equatable/equatable.dart';

class UserRegistrationRequestApiModel extends Equatable {
  const UserRegistrationRequestApiModel({
    required this.name,
    required this.displayName,
    required this.specialty,
    required this.crm,
    required this.email,
    required this.agreeToTermOfUse
  });

  final String name;
  final int specialty;
  final String displayName;
  final String crm;
  final String email;
  final bool agreeToTermOfUse;

  @override
  List<Object> get props => [name, specialty, displayName, crm, email, agreeToTermOfUse];
}