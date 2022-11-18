import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../model/medical_specialty_feedback_ui_model.dart';
import '../model/medical_specialty_ui_model.dart';

part 'medical_specialty_list_state.dart';

@Injectable()
class MedicalSpecialtyListCubit extends Cubit<MedicalSpecialtyListState> {
  MedicalSpecialtyListCubit({required this.getMedicalListUseCase})
      : super(MedicalSpecialtyListInitialState()) {
    getMedicalSpecialtyList();
  }

  final IGetMedicalSpecialtyListUseCase getMedicalListUseCase;

  final MedicalSpecialtyFeedbackUIModel emptyState =
      const MedicalSpecialtyFeedbackUIModel(
    title: "Sem especialidades cadastradas",
    description:
        "Não temos ainda nenhuma especialidade médica cadastrada. Tente novamente mais tarde.",
  );

  final MedicalSpecialtyFeedbackUIModel errorState =
      const MedicalSpecialtyFeedbackUIModel(
          title: "Não foi possível carregar a página",
          description:
              "Verifique sua conexão e toque no ícone para tentar novamente carregar a lista de especialidades médicas.");

  void getMedicalSpecialtyList() async {
    try {
      emit(MedicalSpecialtyListLoadingState());
      final listMedicalSpecialty = await getMedicalListUseCase.invoke();

      if (listMedicalSpecialty.isNotEmpty) {
        emit(MedicalSpecialtyListLoadedState(listMedicalSpecialty
            .map((itemResponse) => itemResponse.mapUIModel)
            .toList()));
      } else {
        emit(MedicalSpecialtyListEmptyState(emptyState));
      }
    } catch (e) {
      emit(MedicalSpecialtyListErrorState(errorState));
    }
  }
}
