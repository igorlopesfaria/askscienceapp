import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IMedicalSpecialtyApiDataSource {
  Future<MedicalSpecialtyResponseApiModel> getMedicalSpecialtyList();
}

@Injectable(as: IMedicalSpecialtyApiDataSource)
class MedicalSpecialtyApiDataSource implements IMedicalSpecialtyApiDataSource{

  final _baseUrl = "https://askscience.free.beeceptor.com";

  final Dio _dio;
  final IReporter _reporter;

  MedicalSpecialtyApiDataSource(this._dio, this._reporter);

  @override
  Future<MedicalSpecialtyResponseApiModel> getMedicalSpecialtyList() async {
    try {
      return MedicalSpecialtyResponseApiModel.fromJson(
          (await _dio.get("$_baseUrl/specialties/list")).data
      );
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. MedicalSpecialtyDataSource getMedicalSpecialtyList ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataApiException(cause);
    }
  }
}
