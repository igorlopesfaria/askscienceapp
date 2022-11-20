import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:model/data/medical_specialty.dart';

List<MedicalSpecialty> emptyList = [];

List<MedicalSpecialty> loadedList = [
  const MedicalSpecialty(id: 1, name: "Anestesiologia"),
  const MedicalSpecialty(id: 2, name: "Alergologia"),
  const MedicalSpecialty(id: 3, name: "Cardiologia")
];

List<MedicalSpecialtyItemUIModel> listUIModel = [
  const MedicalSpecialtyItemUIModel(id: 1, name: "Anestesiologia", isSelected: false),
  const MedicalSpecialtyItemUIModel(id: 2, name: "Alergologia", isSelected: false),
  const MedicalSpecialtyItemUIModel(id: 3, name: "Cardiologia", isSelected: false)
];
