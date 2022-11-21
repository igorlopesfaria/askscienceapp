import 'package:data/medical_specialty/data_source/medical_specialty_api_data_source.dart';
import 'package:data/medical_specialty/model/medical_specialty_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/medical_specialty.dart';

abstract class IMedicalSpecialtyRepository {
  Future<List<MedicalSpecialty>> getMedicalSpecialities();
}

@Injectable(as: IMedicalSpecialtyRepository)
class MedicalSpecialtyRepository implements IMedicalSpecialtyRepository{
  final IMedicalSpecialtyApiDataSource _apiDataSource;

  MedicalSpecialtyRepository(this._apiDataSource);

  @override
  Future<List<MedicalSpecialty>> getMedicalSpecialities() async =>
      (await _apiDataSource.getMedicalSpecialtyList()).data.map(
              (itemResponse) => itemResponse.mapModel
      ).toList();
}


