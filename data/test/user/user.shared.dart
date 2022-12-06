import 'dart:io';

import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:data/user/model/api/request/user_registration_request_api_model.dart';
import 'package:data/user/model/api/request/user_reset_password_request_api_model.dart';
import 'package:data/user/model/api/response/user_info_response_api_model.dart';
import 'package:data/user/model/api/response/user_register_response_api_model.dart';
import 'package:data/user/model/api/response/user_response_api_model.dart';
import 'package:dio/dio.dart';

import '../shared.dart';

const userResetEmailRequest = UserResetPasswordRequestApiModel(email: "email@dominio.com.br");
const userRegisterRequest = UserRegistrationRequestApiModel(
    email: "email@domain.com.br",
    password: "senha",
    crm: "01234567/89",
    specialty: 1,
    displayName: "Dr. Nome Comercial",
    name: "Nome Completo do Usuário",
    agreeToTermOfUse: true
);

final userCorrectMockJson = {
  "data": {
    "id" : "eyJhbGciOiJIUzI1" ,
    "specialty" : {
      "id" : 1,
      "name" : "Radiologia"
    },
    "name" : "Nome Completo do Usuário" ,
    "display_name" : "Dr. Nome Comercial",
    "crm" : "01234567/89" ,
    "email" : "email@domain.com.br" ,
    "verified" : true
  }
};

final userRegisterCorrectMockJson = {
  "data": {
    "id" : "eyJhbGciOiJIUzI1" ,
    "specialty" : {
      "id" : 1,
      "name" : "Radiologia"
    },
    "name" : "Nome Completo do Usuário" ,
    "display_name" : "Dr. Nome Comercial",
    "crm" : "01234567/89" ,
    "email" : "email@domain.com.br" ,
    "verified" : true,
    "authentication": {
      "access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ" ,
      "refresh_token" : "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" ,
      "token_type" : "Type",
      "expires_in" : "01/01/2001" ,
      "scopes" : "SCOPE" ,
    }
  }
};

final userCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: userCorrectMockJson);

final userRegisterCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: userRegisterCorrectMockJson);

final userRegisterResponse = UserRegisterResponseApiModel(data: userRegisterResponseCorrect);

final userInfoResponse = UserInfoResponseApiModel(data: userResponse);

final userResponse = UserResponseApiModel(
  id: "eyJhbGciOiJIUzI1",
  email: "email@domain.com.br",
  name : "Nome Completo do Usuário",
  displayName : "Dr. Nome Comercial",
  specialty: const MedicalSpecialtyItemResponseApiModel(
    id: 1,
    name: "Radiologia"
  ),
  crm : "01234567/89",
  verified : true,
);

final userRegisterResponseCorrect = UserResponseApiModel(
  id: "eyJhbGciOiJIUzI1",
  email: "email@domain.com.br",
  name : "Nome Completo do Usuário",
  displayName : "Dr. Nome Comercial",
  specialty: const MedicalSpecialtyItemResponseApiModel(
      id: 1,
      name: "Radiologia"
  ),
  crm : "01234567/89",
  verified : true,
  authentication: const CredentialTokenResponseApiModel(
      accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ",
      refreshToken: "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
      tokenType: "Type",
      expiresIn: "01/01/2001",
      scopes: "SCOPE"
  )
);

final userResetPasswordCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: {});
