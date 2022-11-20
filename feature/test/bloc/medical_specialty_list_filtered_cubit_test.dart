import 'package:bloc_test/bloc_test.dart';
import 'package:commons/report/reporter.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_filtered_use_case.dart';
import 'package:feature/medical_specialty/list/bloc/medical_specialty_filter_list_cubit.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_feedback_ui_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../medical_cubit.shared.dart';

class MockGetMedicalSpecialtyListFilteredUseCase extends Mock implements GetMedicalSpecialtyListFilteredUseCase {}
class MockReporter extends Mock implements IReporter {}

void main() {
  late MockGetMedicalSpecialtyListFilteredUseCase mockMockGetMedicalSpecialtyListFilteredUseCase;
  late MockReporter mockReporter;

  late MedicalSpecialtyListFilteredCubit cubit;

  setUp(() {
    mockMockGetMedicalSpecialtyListFilteredUseCase = MockGetMedicalSpecialtyListFilteredUseCase();
    mockReporter = MockReporter();
    cubit = MedicalSpecialtyListFilteredCubit(
        getMedicalListFilteredUseCase: mockMockGetMedicalSpecialtyListFilteredUseCase,
        reporter: mockReporter);
  });

  blocTest<MedicalSpecialtyListFilteredCubit, MedicalSpecialtyListFilteredState>(
      'GIVEN getMedicalSpecialtyListFiltered called WHEN useCase return filtered list empty THEN emits loading and empty state',
      build: () {
        when(() => mockMockGetMedicalSpecialtyListFilteredUseCase.invoke(any(), any())).thenAnswer((_) async => emptyList);
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyListFiltered("", listUIModel),
      expect: () => [
        MedicalSpecialtyListFilteredLoadingState(),
        MedicalSpecialtyListFilteredEmptyState(const MedicalSpecialtyFeedbackUIModel(
              title: 'Pesquisa não encontrada.',
              description: 'Não existe especialidade médica com texto informado. Verifique o texto informado.',
              buttonText: 'Limpar Campo'
            )
        )]
  );

  blocTest<MedicalSpecialtyListFilteredCubit, MedicalSpecialtyListFilteredState>(
      'GIVEN getMedicalSpecialtyListFiltered called WHEN useCase return filteredList NOT empty THEN emits loading and loaded state with UIModel converted',
      build: () {
        when(() => mockMockGetMedicalSpecialtyListFilteredUseCase.invoke(any(), any())).thenAnswer((_) async => loadedList);
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyListFiltered("", listUIModel),
      expect: () => [
        MedicalSpecialtyListFilteredLoadingState(),
        MedicalSpecialtyListFilteredLoadedState(listUIModel)
      ]
  );

  blocTest<MedicalSpecialtyListFilteredCubit, MedicalSpecialtyListFilteredState>(
      'GIVEN getMedicalSpecialty called WHEN useCase return exception THEN emits loading and error state',
      build: () {
        when(() => mockMockGetMedicalSpecialtyListFilteredUseCase.invoke(any(), any())).thenThrow(NullThrownError);
        when(() => mockReporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
        return cubit;
      },
      act: (cubit) => cubit.getMedicalSpecialtyListFiltered("", listUIModel),
      expect: () => [
        MedicalSpecialtyListFilteredLoadingState(),
        MedicalSpecialtyListFilteredErrorState(const MedicalSpecialtyFeedbackUIModel(
          title: 'Problemas ao aplicar filtro',
          description: 'Infelizmente encontramos um problema e não conseguimos efetuar sua pesquisa. Tente novamente mais tarde.',
        )
        )
      ]
  );
}