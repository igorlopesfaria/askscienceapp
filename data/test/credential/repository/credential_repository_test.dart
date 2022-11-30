import 'dart:convert';

import 'package:data/credential/credentials_repository.dart';
import 'package:data/credential/data_source/credential_api_data_source.dart';
import 'package:data/credential/data_source/credential_local_data_source.dart';
import 'package:data/credential/model/api/credential_request_api_model.dart';
import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared.dart';
import '../credential.shared.dart';

class MockApiDataSource extends Mock implements ICredentialApiDataSource {}
class MockLocalDataSource extends Mock implements ICredentialLocalDataSource {}
class FakeCredentialTokenLocalModel extends Fake implements CredentialTokenLocalModel {}
class FakeCredentialRequestApiModel extends Fake implements CredentialRequestApiModel {}

void main() {
  late ICredentialRepository repository;
  late ICredentialApiDataSource mockApiDataSource;
  late ICredentialLocalDataSource mockLocalDataSource;

  setUp(() {
    mockApiDataSource = MockApiDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = CredentialRepository(mockApiDataSource, mockLocalDataSource);

    registerFallbackValue(FakeCredentialTokenLocalModel());
    registerFallbackValue(FakeCredentialRequestApiModel());

  });

  final credentialFromAPIDataSource = CredentialResponseApiModel.fromJson(
    json.decode(fixture('credential_200.json')),
  );

  test('GIVEN findLocalToken() method called WHEN localData source returns LocalModel object THEN return domain Model converted',() async {

    when(() => mockLocalDataSource.find()).thenAnswer((_) async => credentialLocalModel);
    final result = await repository.findLocalToken();
    expect(result, credential);
  });

  test('GIVEN insertToken() method called WHEN localData source returns LocalModel object THEN return domain Model converted',() async {

    when(() => mockLocalDataSource.insert(any())).thenAnswer((_) => Future.value());
    final result = await repository.insertToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ", "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c");
    expect(result, credential);
  });

  test('GIVEN authenticate() method called WHEN apiDataSource source returns APIModel object THEN return domain Model converted',() async {

    when(() => mockApiDataSource.authenticate(any())).thenAnswer((_) async => credentialFromAPIDataSource);
    when(() => mockLocalDataSource.insert(any())).thenAnswer((_) => Future.value());
    final result = await repository.authenticate("email@dominio.com.br", "senha");
    expect(result, credential);
  });


}
