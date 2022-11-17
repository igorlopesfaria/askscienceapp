import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/medical_specialty.dart';

@Injectable()
class GetListMedicalSpecialtyUseCase {
  final MedicalSpecialtyRepository _repository;

  GetListMedicalSpecialtyUseCase(this._repository);

  Future<List<MedicalSpecialty>> call() async {
    return _repository.getMedicalSpecialities();
  }
}