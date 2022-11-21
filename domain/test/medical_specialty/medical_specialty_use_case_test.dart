import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_filtered_use_case.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../medical_specialty.shared.dart';

class MockRepository extends Mock implements IMedicalSpecialtyRepository {}

void main() {

  late GetMedicalSpecialtyListUseCase listUseCase;
  late GetMedicalSpecialtyListFilteredUseCase listFilteredUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    listUseCase = GetMedicalSpecialtyListUseCase(mockRepository);
    listFilteredUseCase = GetMedicalSpecialtyListFilteredUseCase();
  });

  test('GIVEN getMedicalSpecialtyList usecase called WHEN repository returns success THEN return the same list received',() async {

    when(() => mockRepository.getMedicalSpecialities())
        .thenAnswer((_) async => correctModel);
    final result = await listUseCase.invoke();
    expect(result, correctModel);
  });

  test('GIVEN GetMedicalSpecialtyListFilteredUseCase usecase called WHEN coorrect params is passed THEN return the list filtered by text',() async {

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