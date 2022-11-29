import 'package:equatable/equatable.dart';

class CredentialResponseApiModel extends Equatable {
  const CredentialResponseApiModel({
    required this.data
  });

  final CredentialTokenResponseApiModel data;

  factory CredentialResponseApiModel.fromJson(Map<String, dynamic> json) => CredentialResponseApiModel(
      data: CredentialTokenResponseApiModel.fromJson(json["data"])
  );

  @override
  List<Object> get props => [data];
}

class CredentialTokenResponseApiModel extends Equatable {
  const CredentialTokenResponseApiModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.scopes,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final String expiresIn;
  final String scopes;

  factory CredentialTokenResponseApiModel.fromJson(Map<String, dynamic> json) => CredentialTokenResponseApiModel(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    scopes: json["scopes"],
  );

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType, expiresIn, scopes];
}