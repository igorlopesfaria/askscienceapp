import 'package:equatable/equatable.dart';

class UserRegistrationRequestApiModel extends Equatable {
  const UserRegistrationRequestApiModel({
    required this.name,
    required this.displayName,
    required this.specialty,
    required this.crm,
    required this.email,
    required this.password,
    required this.agreeToTermOfUse
  });

  final String name;
  final int specialty;
  final String displayName;
  final String crm;
  final String email;
  final String password;
  final bool agreeToTermOfUse;

  Map<String, dynamic> toJson() => {
    'email': email,
    'specialty': specialty,
    'display_name': displayName,
    'crm': crm,
    'name': name,
    'password': password,
    'agreeToTermOfUse': agreeToTermOfUse.toString()
  };

  @override
  List<Object> get props => [name, specialty, displayName, crm, email, password, agreeToTermOfUse];
}