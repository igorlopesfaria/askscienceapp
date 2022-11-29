import 'package:equatable/equatable.dart';

class CredentialRequestApiModel extends Equatable {
  const CredentialRequestApiModel({
    required this.email,
    required this.password});

  final String password;
  final String email;

  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };


}
