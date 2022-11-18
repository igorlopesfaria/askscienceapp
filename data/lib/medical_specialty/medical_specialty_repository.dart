import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/medical_specialty.dart';

import '../medical_specialty/data_source/medical_specialty_data_source.dart';
import '../medical_specialty/model/medical_specialty_extension.dart';


@Injectable()
class MedicalSpecialtyRepository {
  final MedicalSpecialtyDataSource _dataSource;

  MedicalSpecialtyRepository(this._dataSource);

  Future<List<MedicalSpecialty>> getMedicalSpecialities() async =>
      (await _dataSource.getMedicalSpecialities())
         .data.map((itemResponse) => itemResponse.mapModel).toList();
}
