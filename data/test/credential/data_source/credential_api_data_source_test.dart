import 'dart:async';
import 'dart:convert';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/credential/data_source/credential_api_data_source.dart';
import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared.dart';
import '../credential.shared.dart';

class MockDio extends Mock implements Dio {}

class MockReporter extends Mock implements IReporter {}

void main() {
  late IReporter reporter;
  late Dio mockDio;
  late ICredentialApiDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
    reporter = MockReporter();
    dataSource = CredentialApiDataSource(mockDio, reporter);
  });


  test('GIVEN any Exception on datasource WHEN call authenticate() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.authenticate(credentialRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call authenticate() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.authenticate(credentialRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    mockDio = Dio(BaseOptions(baseUrl: 'https://askscience.free.beeceptor.com'));
    DioAdapter dioAdapter = DioAdapter(dio: mockDio);

    dioAdapter.onPost(
      "https://askscience.free.beeceptor.com/tokens", (request) => request.reply(201, credentialCorrectMockJson ),
      data: credentialRequest.toJson(),
    );
    dataSource = CredentialApiDataSource(mockDio, reporter);


    final CredentialResponseApiModel response = await dataSource.authenticate(credentialRequest);
    assert(response.data.refreshToken.isNotEmpty);
    assert(response.data.accessToken.isNotEmpty);
    assert(response.data.scopes.isNotEmpty);
    assert(response.data.tokenType.isNotEmpty);
    assert(response.data.expiresIn.isNotEmpty);
  });
}