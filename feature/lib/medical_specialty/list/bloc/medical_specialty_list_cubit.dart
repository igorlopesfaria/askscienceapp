import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_feedback_ui_model.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'medical_specialty_list_state.dart';

@Injectable()
class MedicalSpecialtyListCubit extends Cubit<MedicalSpecialtyListState> {
  MedicalSpecialtyListCubit({required this.getMedicalListUseCase, required this.reporter})
      : super(MedicalSpecialtyListInitialState());

  final GetMedicalSpecialtyListUseCase getMedicalListUseCase;
  final IReporter reporter;

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
    } catch (exception, stacktrace) {

      if(exception != DataApiException) {
        String cause = "There is an exception on feature layer. MedicalSpecialtyListCubit ${exception.toString()}";
        reporter.recordCustomError(exception, stacktrace, cause);
      }

      emit(MedicalSpecialtyListErrorState(errorState));
    }
  }

  List<MedicalSpecialtyItemUIModel> get listMock =>[
    const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 3, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 4, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 5, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 6, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 7, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 8, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 9, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 10, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 11, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 12, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 13, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 14, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 15, name: "Anestesiologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 16, name: "Alergologia", isSelected: false),
    const MedicalSpecialtyItemUIModel(id: 17, name: "Anestesiologia", isSelected: false),
  ];
}
