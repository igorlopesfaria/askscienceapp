part of 'medical_specialty_list_cubit.dart';

abstract class MedicalSpecialtyListState extends Equatable {}

class MedicalSpecialtyListInitialState extends MedicalSpecialtyListState {
  @override
  List<Object?> get props => [];
}

class MedicalSpecialtyListLoadingState extends MedicalSpecialtyListState {
  @override
  List<Object?> get props => [];
}

class MedicalSpecialtyListErrorState extends MedicalSpecialtyListState {
  MedicalSpecialtyListErrorState(this.feedbackErrorUIModel);

  final MedicalSpecialtyFeedbackUIModel feedbackErrorUIModel;

  @override
  List<Object?> get props => [feedbackErrorUIModel];
}

class MedicalSpecialtyListEmptyState extends MedicalSpecialtyListState {
  MedicalSpecialtyListEmptyState(this.feedbackEmptyUIModel);

  final MedicalSpecialtyFeedbackUIModel feedbackEmptyUIModel;

  @override
  List<Object?> get props => [feedbackEmptyUIModel];
}


class MedicalSpecialtyListLoadedState extends MedicalSpecialtyListState {
  MedicalSpecialtyListLoadedState(this.listMedicalSpecialty);

  final List<MedicalSpecialtyItemUIModel> listMedicalSpecialty;

  @override
  List<Object?> get props => [listMedicalSpecialty];
}




