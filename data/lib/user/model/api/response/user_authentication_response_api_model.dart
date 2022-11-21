import 'package:equatable/equatable.dart';

class UserAuthenticationResponseApiModel extends Equatable {
  const UserAuthenticationResponseApiModel({
    required this.data
  });

  final UserTokenResponseApiModel data;

  factory UserAuthenticationResponseApiModel.fromJson(Map<String, dynamic> json) => UserAuthenticationResponseApiModel(
      data: json["data"]
  );

  @override
  List<Object> get props => [data];
}
class UserTokenResponseApiModel extends Equatable {
  const UserTokenResponseApiModel({
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

  factory UserTokenResponseApiModel.fromJson(Map<String, dynamic> json) => UserTokenResponseApiModel(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    scopes: json["scopes"],
  );

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType, expiresIn, scopes];
}