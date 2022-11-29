
import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICredentialLocalDataSource {
  Future<void> insert(CredentialTokenLocalModel tokenLocalModel);
  Future<CredentialTokenLocalModel> find();
  Future<void> delete();
}

@Injectable(as: ICredentialLocalDataSource)
class CredentialLocalDataSource implements ICredentialLocalDataSource {

  final IReporter _reporter;
  final SharedPreferences _prefs;
  static const credentialAccessToken = "accessToken";
  static const credentialRefreshToken = "refreshToken";


  CredentialLocalDataSource(this._prefs, this._reporter);

  @override
  Future<void> insert(CredentialTokenLocalModel tokenLocalModel) async {
    try {

      await _prefs.setString(credentialAccessToken, tokenLocalModel.accessToken);
      await _prefs.setString(credentialRefreshToken, tokenLocalModel.refreshToken);

    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class CredentialLocalDataSource method insert ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

  @override
  Future<CredentialTokenLocalModel> find() async {
    try {

      return CredentialTokenLocalModel(
          accessToken: _prefs.getString(credentialAccessToken) ?? "",
          refreshToken: _prefs.getString(credentialRefreshToken) ?? "");

    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class CredentialApiDataSource method rowCount ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

  @override
  Future<void> delete() async {
    try {

      await _prefs.remove(credentialAccessToken);
      await _prefs.remove(credentialRefreshToken);

    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class CredentialApiDataSource method authenticate ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

}