import 'dart:async';
import 'dart:io';

import 'package:commons/exception/exception.dart';
import 'package:data/medical_specialty/data_source/medical_specialty_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test.shared.dart';




class MockDio extends Mock implements Dio {}

void main() {
  const path = "https://jsonplaceholder.typicode.com/todos/1";

  final requestOptions = RequestOptions(path: path);

  test('GIVEN timeout server response WHEN server does not respond THEN throw custom TimeoutException', () async {
    MockDio dio = MockDio();
    IMedicalSpecialtyRemoteDataSource dataSource = MedicalSpecialtyRemoteDataSource(dio);
    when(() => dio.get(path)).thenAnswer((invocation) => throw TimeoutException);
    expect(() => (dataSource.getMedicalSpecialty()), throwsA(const TypeMatcher<ServerException>()));
  });

  test('GIVEN correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    MockDio dio = MockDio();
    IMedicalSpecialtyRemoteDataSource dataSource = MedicalSpecialtyRemoteDataSource(dio);
    final mockCorrectResponse = Response(
        requestOptions: requestOptions,
        statusCode: HttpStatus.internalServerError,
        data: errorMockJson);
    final answer = Future(() => mockCorrectResponse);
    when(() => dio.get(any())).thenAnswer((invocation) => answer);
    expect(() => (dataSource.getMedicalSpecialty()), throwsA(const TypeMatcher<ServerException>()));
  });


  test('GIVEN correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    MockDio dio = MockDio();
    IMedicalSpecialtyRemoteDataSource dataSource = MedicalSpecialtyRemoteDataSource(dio);
    final mockCorrectResponse = Response(
        requestOptions: requestOptions,
        statusCode: HttpStatus.ok,
        data: correctMockJson);
    final answer = Future(() => mockCorrectResponse);
    when(() => dio.get(any())).thenAnswer((invocation) => answer);
    final response = await dataSource.getMedicalSpecialty();

    expect(response.data.length, 3);
    expect(response.data[0].id, 1);
    expect(response.data[1].name, "Alergologia");
  });


  test('GIVEN correct server response WHEN server respond http status 200 THEN  convert correctly Json list to Dart List', () async {
    MockDio dio = MockDio();
    IMedicalSpecialtyRemoteDataSource dataSource = MedicalSpecialtyRemoteDataSource(dio);
    final mockCorrectResponse = Response(
        requestOptions: requestOptions,
        statusCode: HttpStatus.ok,
        data: correctMockJson);

    when(() => dio.get(any()))
        .thenAnswer((invocation) => Future(() => mockCorrectResponse));
    final response = await dataSource.getMedicalSpecialty();
    expect(response, correctApiModel);
  });

}
