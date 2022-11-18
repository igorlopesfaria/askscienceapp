import 'dart:async';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/medical_specialty/data_source/medical_specialty_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test.shared.dart';

class MockDio extends Mock implements Dio {}

class MockReporter extends Mock implements IReporter {}

void main() {

  late MockReporter reporter;
  late MockDio dio;
  late IMedicalSpecialtyRemoteDataSource dataSource;

  setUp(() {
    dio = MockDio();
    reporter = MockReporter();
    dataSource = MedicalSpecialtyRemoteDataSource(dio, reporter);
  });

  test('GIVEN any Exception on datasource WHEN call getMedicalSpecialty() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getMedicalSpecialty()), throwsA(const TypeMatcher<DataException>()));
  });

  test('GIVEN Server error response WHEN call getMedicalSpecialty() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getMedicalSpecialty()), throwsA(const TypeMatcher<DataException>()));
  });


  test('GIVEN Correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => mockCorrectResponse));
    final response = await dataSource.getMedicalSpecialty();
    expect(response.data.length, 3);
    expect(response.data[0].id, 1);
    expect(response.data[1].name, "Alergologia");
  });


  test('GIVEN correct server response WHEN server respond http status 200 THEN  convert correctly Json list to Dart List', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => mockCorrectResponse));
    final response = await dataSource.getMedicalSpecialty();
    expect(response, correctApiModel);
  });
}
