import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:model/data/medical_specialty.dart';
import 'package:injectable/injectable.dart';

abstract class IGetMedicalSpecialtyListUseCase {
  Future<List<MedicalSpecialty>> invoke();
}

@Injectable(as: IGetMedicalSpecialtyListUseCase)
class GetMedicalSpecialtyListUseCase implements IGetMedicalSpecialtyListUseCase {
  final IMedicalSpecialtyRepository _repository;

  GetMedicalSpecialtyListUseCase(this._repository);

  @override
  Future<List<MedicalSpecialty>> invoke() async {
    return _repository.getMedicalSpecialities();
  }
}
