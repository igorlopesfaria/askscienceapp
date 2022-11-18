import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:model/data/medical_specialty.dart';
import 'package:injectable/injectable.dart';

abstract class IGetMedicalSpecialtyListFilteredUseCase {
  Future<List<MedicalSpecialty>> invoke(String filter, List<MedicalSpecialty> list);
}

@Injectable(as: IGetMedicalSpecialtyListFilteredUseCase)
class GetMedicalSpecialtyListFilteredUseCase implements IGetMedicalSpecialtyListFilteredUseCase {

  GetMedicalSpecialtyListFilteredUseCase();

  @override
  Future<List<MedicalSpecialty>> invoke(String filter, List<MedicalSpecialty> list) async {
    return list.where((specialty) => specialty.name.contains(filter)).toList();
  }
}
