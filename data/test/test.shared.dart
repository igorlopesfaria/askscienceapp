import 'dart:io';

import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:dio/dio.dart';
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

const correctApiModel = MedicalSpecialtyResponseApiModel(data:  [
  MedicalSpecialtyItemResponseApiModel(id: 1, name: "Anestesiologia"),
  MedicalSpecialtyItemResponseApiModel(id: 2, name: "Alergologia"),
  MedicalSpecialtyItemResponseApiModel(id: 3, name: "Cardiologia")
]);

const correctModel =  [
  MedicalSpecialty(id: 1, name: "Anestesiologia"),
  MedicalSpecialty(id: 2, name: "Alergologia"),
  MedicalSpecialty(id: 3, name: "Cardiologia")
];

const path = "https://jsonplaceholder.typicode.com/todos/1";
final requestOptions = RequestOptions(path: path);

final mockErrorResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.internalServerError,
    data: errorMockJson);

final mockCorrectResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: correctMockJson);


String fixture(String name) => File('test/json/$name').readAsStringSync();