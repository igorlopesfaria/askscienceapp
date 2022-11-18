import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_feedback_ui_model.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'medical_specialty_list_state.dart';

@Injectable()
class MedicalSpecialtyListCubit extends Cubit<MedicalSpecialtyListState> {
  MedicalSpecialtyListCubit({required this.getMedicalListUseCase})
      : super(MedicalSpecialtyListInitialState()) {
    getMedicalSpecialtyList();
  }

  final GetMedicalSpecialtyListUseCase getMedicalListUseCase;

  final MedicalSpecialtyFeedbackUIModel emptyState = const MedicalSpecialtyFeedbackUIModel(
    title: "Pesquisa não encontrada.",
    description: "Não existe especialidade médica cadastrada no momento. Tente novamente mais tarde.",
  );

  final MedicalSpecialtyFeedbackUIModel errorState = const MedicalSpecialtyFeedbackUIModel(
      title: "Problemas para carregar a tela",
      description: "Verifique sua conexão e clique no ícone acima para tentar novamente.",
  );

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
