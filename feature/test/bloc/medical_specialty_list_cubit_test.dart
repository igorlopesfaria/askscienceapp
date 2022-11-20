import 'package:bloc_test/bloc_test.dart';
import 'package:commons/report/reporter.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:feature/medical_specialty/list/bloc/medical_specialty_list_cubit.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_feedback_ui_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../medical_cubit.shared.dart';

class MockGetMedicalSpecialtyListUseCase extends Mock implements GetMedicalSpecialtyListUseCase {}
class MockReporter extends Mock implements IReporter {}

void main() {
  late MockGetMedicalSpecialtyListUseCase mockGetMedicalSpecialtyListUseCase;
  late MockReporter mockReporter;

  late MedicalSpecialtyListCubit cubit;

  setUp(() {
    mockGetMedicalSpecialtyListUseCase = MockGetMedicalSpecialtyListUseCase();
    mockReporter = MockReporter();
    cubit = MedicalSpecialtyListCubit(getMedicalListUseCase: mockGetMedicalSpecialtyListUseCase, reporter: mockReporter);
  });

  blocTest<MedicalSpecialtyListCubit, MedicalSpecialtyListState>(
      'GIVEN getMedical called WHEN useCase return empty list THEN emits loading and empty state',
      build: () {
        when(() => mockGetMedicalSpecialtyListUseCase.invoke()).thenAnswer((_) async => emptyList);
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyList(),
      expect: () => [
        MedicalSpecialtyListLoadingState(),
        MedicalSpecialtyListEmptyState(const MedicalSpecialtyFeedbackUIModel(
              title: 'Pesquisa não encontrada.',
              description: 'Não existe especialidade médica cadastrada no momento. Tente novamente mais tarde.',
            )
        )]
  );

  blocTest<MedicalSpecialtyListCubit, MedicalSpecialtyListState>(
      'GIVEN getMedicalSpecialty called WHEN useCase return NOT empty list THEN emits loading and loaded state with UIModel converted',
      build: () {
        when(() => mockGetMedicalSpecialtyListUseCase.invoke()).thenAnswer((_) async => loadedList);
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyList(),
      expect: () => [
        MedicalSpecialtyListLoadingState(),
        MedicalSpecialtyListLoadedState(listUIModel)
      ]
  );

  blocTest<MedicalSpecialtyListCubit, MedicalSpecialtyListState>(
      'GIVEN getMedicalSpecialty called WHEN useCase return exception != DataException THEN emits loading and error state AND sendReport error',
      build: () {
        when(() => mockGetMedicalSpecialtyListUseCase.invoke()).thenThrow(NullThrownError);
        when(() => mockReporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyList(),
      expect: () => [
        MedicalSpecialtyListLoadingState(),
        MedicalSpecialtyListErrorState(const MedicalSpecialtyFeedbackUIModel(
          title: 'Problemas para carregar a tela',
          description: 'Verifique sua conexão e clique no ícone acima para tentar novamente.',
        )
        )      ]
  );
}