part of 'medical_specialty_filter_list_cubit.dart';

abstract class MedicalSpecialtyListFilteredState extends Equatable {}

class MedicalSpecialtyListFilteredInitialState extends MedicalSpecialtyListFilteredState {
  @override
  List<Object?> get props => [];
}

class MedicalSpecialtyListFilteredCleanState extends MedicalSpecialtyListFilteredState {
  @override
  List<Object?> get props => [];
}


class MedicalSpecialtyListFilteredLoadingState extends MedicalSpecialtyListFilteredState {
  @override
  List<Object?> get props => [];
}

class MedicalSpecialtyListFilteredEmptyState extends MedicalSpecialtyListFilteredState {
  MedicalSpecialtyListFilteredEmptyState(this.feedbackEmptyUIModel);

  final MedicalSpecialtyFeedbackUIModel feedbackEmptyUIModel;

  @override
  List<Object?> get props => [feedbackEmptyUIModel];
}

class MedicalSpecialtyListFilteredErrorState extends MedicalSpecialtyListFilteredState {
  MedicalSpecialtyListFilteredErrorState(this.feedbackErrorUIModel);

  final MedicalSpecialtyFeedbackUIModel feedbackErrorUIModel;

  @override
  List<Object?> get props => [feedbackErrorUIModel];
}

class MedicalSpecialtyListFilteredLoadedState extends MedicalSpecialtyListFilteredState {
  MedicalSpecialtyListFilteredLoadedState(this.listFilteredMedicalSpecialty);

  final List<MedicalSpecialtyItemUIModel> listFilteredMedicalSpecialty;

  @override
  List<Object?> get props => [listFilteredMedicalSpecialty];
}
