import 'package:equatable/equatable.dart';

class MedicalSpecialtyFeedbackUIModel extends Equatable {
  const MedicalSpecialtyFeedbackUIModel({
    required this.title,
    required this.description,
    this.buttonText
  });

  final String title;
  final String description;
  final String? buttonText;

  @override
  List<Object?> get props => [
    title,
    description,
    buttonText];
}
