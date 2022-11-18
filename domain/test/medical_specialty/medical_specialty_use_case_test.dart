import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_filtered_use_case.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test.shared.dart';

class MockRepository extends Mock implements IMedicalSpecialtyRepository {}

void main() {

  late IGetMedicalSpecialtyListUseCase listUseCase;
  late IGetMedicalSpecialtyListFilteredUseCase listFilteredUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    listUseCase = GetMedicalSpecialtyListUseCase(mockRepository);
    listFilteredUseCase = GetMedicalSpecialtyListFilteredUseCase();
  });

  test('should return list of data when the call to remote data source is successful',() async {

    when(() => mockRepository.getMedicalSpecialities())
        .thenAnswer((_) async => correctModel);
    final result = await listUseCase.invoke();
    expect(result, correctModel);
  });

  test('should return list filtered of data when the call to usecase is successful',() async {

    final resultUnique = await listFilteredUseCase.invoke("Cardiologia", correctModel);
    expect(resultUnique.length, 1);

    final resultInitPartialWord = await listFilteredUseCase.invoke("Alerg", correctModel);
    expect(resultInitPartialWord.length, 1);

    final resultEndPartialWord = await listFilteredUseCase.invoke("logia", correctModel);
    expect(resultEndPartialWord.length, 3);

    final resultNotFoundWord = await listFilteredUseCase.invoke("xyz", correctModel);
    expect(resultNotFoundWord.length, 0);
  });

}