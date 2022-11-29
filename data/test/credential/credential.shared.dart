
import 'dart:io';

import 'package:data/credential/model/api/credential_request_api_model.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:dio/dio.dart';

import '../shared.dart';

const credentialLocalModel = CredentialTokenLocalModel(
  accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ",
  refreshToken: "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
);

const credentialRequest = CredentialRequestApiModel(
  email: "email@dominio.com.br",
  password: "\$2b\$12\$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW"
);

final credentialCorrectMockJson = {
  "data": {
    "access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ" ,
    "refresh_token" : "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" ,
    "token_type" : "Type",
    "expires_in" : "01/01/2001" ,
    "scopes" : "SCOPE" ,
  }
};


final credentialCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.created,
    data: credentialCorrectMockJson);
