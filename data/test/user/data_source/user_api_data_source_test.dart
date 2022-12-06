import 'dart:async';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/user/data_source/user_api_data_source.dart';
import 'package:data/user/model/api/response/user_register_response_api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared.dart';
import '../user.shared.dart';

class MockDio extends Mock implements Dio {}

class MockReporter extends Mock implements IReporter {}

void main() {
  late IReporter reporter;
  late Dio mockDio;
  late IUserApiDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
    reporter = MockReporter();
    dataSource = UserApiDataSource(mockDio, reporter);
  });


  test('GIVEN any Exception on datasource WHEN call getInfo() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getInfo()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call authenticate() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.getInfo()), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response  WHEN server respond http status 200 on getInfo() THEN return correct API Model', () async {
    when(() => mockDio.get(any())).thenAnswer((invocation) => Future(() => userCorrectMockResponse));
    final response = await dataSource.getInfo();

    expect(response, userInfoResponse);
  });

  test('GIVEN any Exception on datasource WHEN call resetPasswordByEmail() THEN throw custom DataException', () async {
    when(() => mockDio.post(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.resetPasswordByEmail(userResetEmailRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call resetPasswordByEmail() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.resetPasswordByEmail(userResetEmailRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response WHEN server respond http status 200 THEN return correct JSON', () async {
    mockDio = Dio(BaseOptions(baseUrl: 'https://askscience.free.beeceptor.com'));
    DioAdapter dioAdapter = DioAdapter(dio: mockDio);

    dioAdapter.onPost(
      "https://askscience.free.beeceptor.com/accountRecoveries", (request) => request.reply(200,
        {}),
      data: userResetEmailRequest.toJson(),
    );
    dataSource = UserApiDataSource(mockDio, reporter);


    final response = await dataSource.resetPasswordByEmail(userResetEmailRequest);
    expect(response, true);
  });

  test('GIVEN any Exception on datasource WHEN call register() THEN throw custom DataException', () async {
    when(() => mockDio.post(any())).thenThrow(TimeoutException);
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.register(userRegisterRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Server error response WHEN call register() THEN throw custom DataException', () async {
    when(() => mockDio.get(any())).thenAnswer((invocation) => Future(() => mockErrorResponse));
    when(() => reporter.recordCustomError(any(), any(), any())).thenAnswer((_) => Future.value());
    expect(() => (dataSource.register(userRegisterRequest)), throwsA(const TypeMatcher<DataApiException>()));
  });

  test('GIVEN Correct server response WHEN call register() AND server respond http status 201 THEN return correct JSON', () async {
    mockDio = Dio(BaseOptions(baseUrl: 'https://askscience.free.beeceptor.com'));
    DioAdapter dioAdapter = DioAdapter(dio: mockDio);

    dioAdapter.onPost(
      "https://askscience.free.beeceptor.com/registrations", (request) => request.reply(201, userRegisterCorrectMockJson),
      data: userRegisterRequest.toJson(),
    );
    dataSource = UserApiDataSource(mockDio, reporter);


    UserRegisterResponseApiModel response = await dataSource.register(userRegisterRequest);
    expect(response, userRegisterResponse);
  });


}
