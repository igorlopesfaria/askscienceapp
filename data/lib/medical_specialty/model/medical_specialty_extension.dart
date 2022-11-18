import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:model/data/medical_specialty.dart';

extension MedicalSpecialtyApiModelExtension on MedicalSpecialtyItemApiModel {
  MedicalSpecialty get mapModel {
    return MedicalSpecialty(
        id: id,
        name: name
    );
  }
}