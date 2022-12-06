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
          data: request.toJson(),
          options: Options()..headers ={'Content-Type': 'application/json'},
      );
      return (response.statusCode ==200 || response.statusCode ==201);

    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method resetPasswordByEmail ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

  @override
  Future<UserInfoResponseApiModel> getInfo() async {
    try {
      return UserInfoResponseApiModel.fromJson(
          (await _dio.get("$_baseUrl/me")).data
      );
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method getInfo ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

  @override
  Future<UserRegisterResponseApiModel> register(UserRegistrationRequestApiModel request) async {
    try {
      Response response = await _dio.post("$_baseUrl/registrations",
        data: request.toJson(),
        options: Options()..headers ={'Content-Type': 'application/json'},
      );

      return UserRegisterResponseApiModel.fromJson(response.data);
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class UserApiDataSource method register ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }
}