import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:model/data/medical_specialty.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetMedicalSpecialtyListUseCase {
  final IMedicalSpecialtyRepository _repository;

  GetMedicalSpecialtyListUseCase(this._repository);

  Future<List<MedicalSpecialty>> invoke() async {
    return _repository.getMedicalSpecialities();
  }
}
