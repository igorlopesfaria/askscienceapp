
import 'dart:convert';

import 'package:data/medical_specialty/data_source/medical_specialty_api_data_source.dart';
import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared.dart';
import '../test.shared.dart';

class MockRemoteDataSource extends Mock implements IMedicalSpecialtyApiDataSource {}

void main() {

  late IMedicalSpecialtyRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MedicalSpecialtyRepository(mockRemoteDataSource);
  });

  final medicalSpecialtyAPIModelFromJson = MedicalSpecialtyResponseApiModel.fromJson(
    json.decode(fixture('medical_specialty_200.json')),
  );

  test('should return remote data when the call to remote data source is successful',() async {

    when(() => mockRemoteDataSource.getMedicalSpecialtyList())
        .thenAnswer((_) async => medicalSpecialtyAPIModelFromJson);
    final result = await repository.getMedicalSpecialities();
    expect(result, correctModel);
  });
}