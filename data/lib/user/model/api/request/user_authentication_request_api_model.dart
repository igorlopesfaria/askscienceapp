import 'package:equatable/equatable.dart';

class UserAuthenticationRequestApiModel extends Equatable {
  const UserAuthenticationRequestApiModel({
    required this.email,
    required this.password});

  final String password;
  final String email;

  @override
  List<Object?> get props => [email, password];

}
