import '../model/api/medical_specialty_api_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Injectable()
class MedicalSpecialtyDataSource {

  final _baseUrl = "https://askscience.free.beeceptor.com/";

  final Dio _dio;

  MedicalSpecialtyDataSource(this._dio);

  Future<List<MedicalSpecialtyApiModel>> getMedicalSpecialities() async {

    try {
      final response = await _dio.get("${_baseUrl}list");

      return (response.data as List)
          .map((e) => MedicalSpecialtyApiModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
