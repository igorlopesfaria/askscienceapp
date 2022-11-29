
import 'package:commons/report/reporter.dart';
import 'package:data/credential/data_source/credential_local_data_source.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../credential.shared.dart';

class MockReporter extends Mock implements IReporter {}

void main() {
  late IReporter mockReporter;
  late ICredentialLocalDataSource mockDataSource;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      CredentialLocalDataSource.credentialAccessToken: "access_token",
      CredentialLocalDataSource.credentialRefreshToken: "refresh_token"
    });
    prefs = await SharedPreferences.getInstance();
    mockReporter = MockReporter();
    mockDataSource = CredentialLocalDataSource(prefs, mockReporter);
  });

  test('GIVEN credentialLocalModel WHEN call find() THEN return local model', () async {
    CredentialTokenLocalModel localModel = await mockDataSource.find();

    expect(localModel.accessToken, "access_token");
    expect(localModel.refreshToken, "refresh_token");
  });

  test('GIVEN credentialLocalModel WHEN call delete() THEN clear on Shared preference correctly', () async {
    await mockDataSource.delete();

    CredentialTokenLocalModel localModel = await mockDataSource.find();

    expect(localModel.accessToken, "");
    expect(localModel.refreshToken, "");
  });

  test('GIVEN credentialLocalModel WHEN call insert() THEN insert on shared preference correctly', () async {
    await mockDataSource.insert(credentialLocalModel);
    CredentialTokenLocalModel localModel = await mockDataSource.find();

    expect(localModel.accessToken, credentialLocalModel.accessToken);
    expect(localModel.refreshToken, credentialLocalModel.refreshToken);
  });
}