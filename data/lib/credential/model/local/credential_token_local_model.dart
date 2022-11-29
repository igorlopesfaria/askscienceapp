import 'package:equatable/equatable.dart';

class CredentialTokenLocalModel extends Equatable {

  CredentialTokenLocalModel({
    required this.accessToken,
    required this.refreshToken
  });

  String accessToken = "";
  String refreshToken = "";

  @override
  List<Object> get props => [accessToken, refreshToken];
}