import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/medical_specialty.dart';

import '../medical_specialty/data_source/medical_specialty_data_source.dart';
import '../medical_specialty/model/medical_specialty_extension.dart';

abstract class IMedicalSpecialtyRepository {
  Future<List<MedicalSpecialty>> getMedicalSpecialities();
}

@Injectable(as: IMedicalSpecialtyRepository)
class MedicalSpecialtyRepository implements IMedicalSpecialtyRepository{
  final IMedicalSpecialtyRemoteDataSource _dataSource;

  MedicalSpecialtyRepository(this._dataSource);

  @override
  Future<List<MedicalSpecialty>> getMedicalSpecialities() async =>
      (await _dataSource.getMedicalSpecialty())
         .data.map((itemResponse) => itemResponse.mapModel).toList();
}


