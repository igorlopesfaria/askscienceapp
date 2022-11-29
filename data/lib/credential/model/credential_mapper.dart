import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:model/data/credential.dart';

extension CredentialTokenResponseApiModelMapper on CredentialTokenResponseApiModel {
  Credential get mapModel => Credential(
      accessToken: accessToken,
      refreshToken: refreshToken
  );

  CredentialTokenLocalModel get mapLocalModel => CredentialTokenLocalModel(
      accessToken: accessToken,
      refreshToken: refreshToken
  );

}

extension CredentialTokenLocalModelMapper on CredentialTokenLocalModel {
  Credential get mapModel => Credential(
      accessToken: accessToken,
      refreshToken: refreshToken
  );

}