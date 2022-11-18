
import 'dart:convert';

import 'package:data/medical_specialty/data_source/medical_specialty_data_source.dart';
import 'package:data/medical_specialty/medical_specialty_repository.dart';
import 'package:data/medical_specialty/model/api/medical_specialty_api_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test.shared.dart';

class MockRemoteDataSource extends Mock implements IMedicalSpecialtyRemoteDataSource {}

void main() {

  late IMedicalSpecialtyRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MedicalSpecialtyRepository(mockRemoteDataSource);
  });

  final medicalSpecialtyAPIModelFromJson = MedicalSpecialtyApiModel.fromJson(
    json.decode(fixture('medical_specialty_200.json')),
  );

  test('should return remote data when the call to remote data source is successful',() async {

    when(() => mockRemoteDataSource.getMedicalSpecialty())
        .thenAnswer((_) async => medicalSpecialtyAPIModelFromJson);
    final result = await repository.getMedicalSpecialities();
    expect(result, correctModel);
  });
}