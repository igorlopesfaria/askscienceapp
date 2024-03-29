import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/terms/model/api/response/terms_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ITermsApiDataSource {
  Future<TermsResponseApiModel> getTermsOfUsage();
  Future<TermsResponseApiModel> getPrivacyPolicy();
}

@Injectable(as: ITermsApiDataSource)
class TermsApiDataSource implements ITermsApiDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com";

  final Dio _dio;
  final IReporter _reporter;

  TermsApiDataSource(this._dio, this._reporter);

  @override
  Future<TermsResponseApiModel> getTermsOfUsage() async {
    try {
      return TermsResponseApiModel.fromJson(
          (await _dio.get("$_baseUrl/terms/termsOfUsage")).data
      );
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. TermsApiDataSource getTermsOfUsage ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }

  @override
  Future<TermsResponseApiModel> getPrivacyPolicy() async {
    try {
      return TermsResponseApiModel.fromJson(
          (await _dio.get("$_baseUrl/terms/privacyPolicy")).data
      );
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. TermsApiDataSource getPrivacyPolicy ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }
}
