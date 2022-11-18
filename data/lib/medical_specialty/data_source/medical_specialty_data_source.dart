import '../model/api/medical_specialty_api_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Injectable()
class MedicalSpecialtyDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com/";

  final Dio _dio;

  MedicalSpecialtyDataSource(this._dio);

  Future<MedicalSpecialtyApiModel> getMedicalSpecialities() async {
    try {
      return MedicalSpecialtyApiModel.fromJson(
          (await _dio.get("${_baseUrl}list")).data
      );
    } catch (e) {
      rethrow;
    }
  }
}
