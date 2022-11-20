import 'package:injectable/injectable.dart';
import 'package:model/data/medical_specialty.dart';

@Injectable()
class GetMedicalSpecialtyListFilteredUseCase {

  GetMedicalSpecialtyListFilteredUseCase();

  Future<List<MedicalSpecialty>> invoke(String filter, List<MedicalSpecialty> list) async {
    return list.where((specialty) => specialty.name.toUpperCase().contains(filter.toUpperCase())).toList();
  }
}
