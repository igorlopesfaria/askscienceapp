import 'package:equatable/equatable.dart';
import 'package:model/data/medical_specialty.dart';

class MedicalSpecialtyItemUIModel extends Equatable {
  const MedicalSpecialtyItemUIModel({
    required this.id,
    required this.name,
    required this.isSelected
  });

  final int id;
  final String name;
  final bool isSelected;

  @override
  List<Object?> get props => [
    id,
    name,
    isSelected];
}

extension MedicalSpecialtyExtensions on MedicalSpecialty {

  MedicalSpecialtyItemUIModel get mapUIModel {
    return MedicalSpecialtyItemUIModel(
        id: id,
        name: name,
        isSelected: false);
    }
}

extension MedicalSpecialtyItemUIModelExtensions on MedicalSpecialtyItemUIModel {

  MedicalSpecialty get mapModel {
    return MedicalSpecialty(
        id: id,
        name: name);
  }
}

