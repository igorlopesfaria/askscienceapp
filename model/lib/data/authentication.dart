import 'package:equatable/equatable.dart';
import 'package:model/data/medical_specialty.dart';

class AuthenticationModel extends Equatable {
  const AuthenticationModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scopes
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final String expiresIn;
  final String scopes;

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType, expiresIn, scopes];
}