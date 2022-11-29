import 'dart:convert';
import 'dart:io';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/credential/model/api/credential_request_api_model.dart';
import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ICredentialApiDataSource {
  Future<CredentialResponseApiModel> authenticate(CredentialRequestApiModel request);
}

@Injectable(as: ICredentialApiDataSource)
class CredentialApiDataSource implements ICredentialApiDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com";

  final Dio _dio;
  final IReporter _reporter;

  CredentialApiDataSource(this._dio, this._reporter);

  @override
  Future<CredentialResponseApiModel> authenticate(CredentialRequestApiModel request) async {
    try {
      Response response = (await _dio.post("$_baseUrl/tokens",
          data: request.toJson(),
          options: Options()..headers = {'Content-Type': 'application/json'}
      ));

      CredentialResponseApiModel apiModel =  CredentialResponseApiModel.fromJson(response.data);

      return apiModel;

    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class CredentialApiDataSource method authenticate ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

}
