import 'package:commons/report/reporter.dart';

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
}