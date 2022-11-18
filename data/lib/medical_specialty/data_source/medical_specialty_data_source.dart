import 'package:commons/exception/exception.dart';
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

  MedicalSpecialtyRemoteDataSource(this._dio);

  @override
  Future<MedicalSpecialtyApiModel> getMedicalSpecialty() async {
    try {
      return MedicalSpecialtyApiModel.fromJson(
          (await _dio.get("${_baseUrl}list")).data
      );
    } catch (e) {
      throw ServerException("There is an exception on datasource layer. MedicalSpecialtyDataSource ${e.toString()}");
    }
  }
}
