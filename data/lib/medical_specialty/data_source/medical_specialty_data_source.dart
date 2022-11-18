import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IMedicalSpecialtyRemoteDataSource {
  Future<MedicalSpecialtyApiModel> getMedicalSpecialty();
}

@Injectable(as: IMedicalSpecialtyRemoteDataSource)
class MedicalSpecialtyRemoteDataSource implements IMedicalSpecialtyRemoteDataSource{

  final _baseUrl = "https://askscience.free.beeceptor.com/";

  final Dio _dio;
  final IReporter _reporter;

  MedicalSpecialtyRemoteDataSource(this._dio, this._reporter);

  @override
  Future<MedicalSpecialtyApiModel> getMedicalSpecialty() async {
    try {
      return MedicalSpecialtyApiModel.fromJson(
          (await _dio.get("${_baseUrl}list")).data
      );
    } catch (e, stacktrace) {
      String cause = "There is an exception on datasource layer. MedicalSpecialtyDataSource ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataException(cause);
    }
  }
}
