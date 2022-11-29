import 'dart:convert';
import 'dart:io';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/user/model/api/request/user_registration_request_api_model.dart';
import 'package:data/user/model/api/request/user_reset_password_request_api_model.dart';
import 'package:data/user/model/api/response/user_info_response_api_model.dart';
import 'package:data/user/model/api/response/user_register_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IUserApiDataSource {
  Future<bool> resetPasswordByEmail(UserResetPasswordRequestApiModel request);
  Future<UserRegisterResponseApiModel> register(UserRegistrationRequestApiModel request);
  Future<UserInfoResponseApiModel> getInfo();
}

@Injectable(as: IUserApiDataSource)
class UserApiDataSource implements IUserApiDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com";

  final Dio _dio;
  final IReporter _reporter;

  UserApiDataSource(this._dio, this._reporter);

  @override
  Future<bool> resetPasswordByEmail(UserResetPasswordRequestApiModel request) async {
    try {
      Response response = await _dio.post("$_baseUrl/accountRecoveries",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
      }),
        data: jsonEncode(request),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method getInfo ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

  @override
  Future<UserInfoResponseApiModel> getInfo() async {
    try {
      Response response = await _dio.get("$_baseUrl/me");

      return UserInfoResponseApiModel.fromJson(response.data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method getInfo ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

  @override
  Future<UserRegisterResponseApiModel> register(UserRegistrationRequestApiModel request) async {
    try {
      Response response = await _dio.post("$_baseUrl/tokens",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(request)
      );

      return UserRegisterResponseApiModel.fromJson(response.data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method create ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }
}