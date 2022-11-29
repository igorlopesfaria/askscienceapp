import 'dart:async';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/terms/data_source/terms_api_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared.dart';
import '../terms.shared.dart';

class MockDio extends Mock implements Dio {}

class MockReporter extends Mock implements IReporter {}

void main() {
  late MockReporter reporter;
  late MockDio dio;
  late ITermsApiDataSource dataSource;

  setUp(() {
    dio = MockDio();
    reporter = MockReporter();
    dataSource = TermsApiDataSource(dio, reporter);
  });


  test('GIVEN any Exception on datasource WHEN call getTermsOfUsage() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getTermsOfUsage()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call getTermsOfUsage() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getTermsOfUsage()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => termsOfUsageCorrectMockResponse));
    final response = await dataSource.getTermsOfUsage();

    assert(response.data.isNotEmpty);
    expect(response.data, "test termos de uso");
  });


  test('GIVEN any Exception on datasource WHEN call getPrivacyPolicy() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getPrivacyPolicy()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call getPrivacyPolicy() THEN throw custom DataException', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getPrivacyPolicy()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    when(() => dio.get(any())).thenAnswer((invocation) => Future(() => privacyPolicyCorrectMockResponse));
    final response = await dataSource.getPrivacyPolicy();

    assert(response.data.isNotEmpty);
    expect(response.data, "test política de privacidade");
  });
}

