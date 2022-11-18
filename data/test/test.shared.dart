import 'dart:io';

import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:model/data/medical_specialty.dart';

final correctMockJson = {
  "data" : [
    {
      "id": 1,
      "name": "Anestesiologia",
    },
    {
      "id": 2,
      "name": "Alergologia",
    },
    {
      "id": 3,
      "name": "Cardiologia",
    },
  ]
};
final errorMockJson = {
  "error": {
    "code":"500",
    "message":"Internal Server Error"
  }
};

const correctApiModel = MedicalSpecialtyApiModel(data:  [
  MedicalSpecialtyItemApiModel(id: 1, name: "Anestesiologia"),
  MedicalSpecialtyItemApiModel(id: 2, name: "Alergologia"),
  MedicalSpecialtyItemApiModel(id: 3, name: "Cardiologia")
]);

const correctModel =  [
  MedicalSpecialty(id: 1, name: "Anestesiologia"),
  MedicalSpecialty(id: 2, name: "Alergologia"),
  MedicalSpecialty(id: 3, name: "Cardiologia")
];

String fixture(String name) => File('test/json/$name').readAsStringSync();