import 'package:domain/medical_specialty/get_medical_specialty_list_filtered_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_feedback_ui_model.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:commons/report/reporter.dart';

part 'medical_specialty_filter_list_state.dart';

@Injectable()
class MedicalSpecialtyListFilteredCubit extends Cubit<MedicalSpecialtyListFilteredState> {
  MedicalSpecialtyListFilteredCubit({
    required this.getMedicalListFilteredUseCase,
    required this.reporter
  }) : super(MedicalSpecialtyListFilteredInitialState());

  final IReporter reporter;

  final GetMedicalSpecialtyListFilteredUseCase getMedicalListFilteredUseCase;

  final MedicalSpecialtyFeedbackUIModel emptyState = const MedicalSpecialtyFeedbackUIModel(
    title: "Pesquisa não encontrada.",
    description: "Não existe especialidade médica com texto informado. Verifique o texto informado.",
    buttonText: "Limpar Campo"
  );
  
  void init(){
    print("teste");
  }

  final MedicalSpecialtyFeedbackUIModel errorState = const MedicalSpecialtyFeedbackUIModel(
    title: "Problemas ao aplicar filtro",
    description: "Infelizmente encontramos um problema e não conseguimos efetuar sua pesquisa. Tente novamente mais tarde.",
  );

  void getMedicalSpecialtyListFiltered(String textFilter, List<MedicalSpecialtyItemUIModel> list) async {
    try {
      emit(MedicalSpecialtyListFilteredLoadingState());

      final listMedicalSpecialtyFiltered = await getMedicalListFilteredUseCase
          .invoke(
          textFilter,
          list.map((itemUIModel) => itemUIModel.mapModel).toList()
      );

      if (listMedicalSpecialtyFiltered.isNotEmpty) {
        emit(MedicalSpecialtyListFilteredLoadedState(listMedicalSpecialtyFiltered
            .map((itemResponse) => itemResponse.mapUIModel)
            .toList()));
      } else {
        emit(MedicalSpecialtyListFilteredEmptyState(emptyState));
      }
    } catch (e) {
      emit(MedicalSpecialtyListFilteredErrorState(errorState));
    }
  }

  void cleanFilter() {
    emit(MedicalSpecialtyListFilteredLoadingState());
    emit(MedicalSpecialtyListFilteredCleanState());
  }
}
