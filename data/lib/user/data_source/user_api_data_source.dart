import 'dart:convert';
import 'dart:io';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/user/model/api/request/user_authentication_request_api_model.dart';
import 'package:data/user/model/api/request/user_registration_request_api_model.dart';
import 'package:data/user/model/api/request/user_reset_password_request_api_model.dart';
import 'package:data/user/model/api/response/user_authentication_response_api_model.dart';
import 'package:data/user/model/api/response/user_registration_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IUserApiDataSource {
  Future<bool> resetPasswordByEmail(UserResetPasswordRequestApiModel param);
  Future<UserTokenResponseApiModel> authenticate(UserAuthenticationRequestApiModel param);
  Future<UserResponseApiModel> create(UserRegistrationRequestApiModel param);
  Future<UserResponseApiModel> getInfo();
}

@Injectable(as: IUserApiDataSource)
class UserApiDataSource implements IUserApiDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com";

  final Dio _dio;
  final IReporter _reporter;

  UserApiDataSource(this._dio, this._reporter);

  @override
  Future<bool> resetPasswordByEmail(UserResetPasswordRequestApiModel param) async {
    try {
      Response response = await _dio.post("$_baseUrl/accountRecoveries",  options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
        data: jsonEncode(param),
      );

      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else{
        return false;
      }
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. UserApiDataSource resetPasswordByEmail ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataException(cause);
    }
  }

  @override
  Future<UserTokenResponseApiModel> authenticate(UserAuthenticationRequestApiModel param) async {
    try {
      Response response = await _dio.post("$_baseUrl/tokens",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(param),
      );

      return UserTokenResponseApiModel.fromJson((response).data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. UserApiDataSource authenticate ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataException(cause);
    }
  }
  @override
  Future<UserResponseApiModel> getInfo() async {
    try {
      Response response = await _dio.get("$_baseUrl/me");

      return UserResponseApiModel.fromJson((response).data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. UserApiDataSource getInfo ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataException(cause);
    }
  }

  @override
  Future<UserResponseApiModel> create(UserRegistrationRequestApiModel param) async {
    try {
      Response response = await _dio.post("$_baseUrl/tokens",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(param),
      );

      return UserResponseApiModel.fromJson((response).data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. UserApiDataSource getInfo ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataException(cause);
    }
  }
}