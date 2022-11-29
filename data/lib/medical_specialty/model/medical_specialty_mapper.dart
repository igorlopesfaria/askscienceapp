import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:model/data/medical_specialty.dart';

extension MedicalSpecialtyApiModelExtension on MedicalSpecialtyItemResponseApiModel {
  MedicalSpecialty get mapModel {
    return MedicalSpecialty(
        id: id,
        name: name
    );
  }
}