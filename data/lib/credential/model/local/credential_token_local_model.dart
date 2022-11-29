import 'package:equatable/equatable.dart';

class CredentialTokenLocalModel extends Equatable {

  const CredentialTokenLocalModel({
    required this.accessToken,
    required this.refreshToken
  });

  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [accessToken, refreshToken];
}