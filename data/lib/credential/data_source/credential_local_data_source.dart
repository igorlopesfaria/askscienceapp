
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
  static const _credentialAccessToken = "accessToken";
  static const _credentialRefreshToken = "'refreshToken'";


  CredentialLocalDataSource(this._reporter);

  @override
  Future<void> insert(CredentialTokenLocalModel tokenLocalModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(_credentialAccessToken, tokenLocalModel.accessToken);
      await prefs.setString(_credentialRefreshToken, tokenLocalModel.refreshToken);

    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class CredentialLocalDataSource method insert ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

  @override
  Future<CredentialTokenLocalModel> find() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      return CredentialTokenLocalModel(
          accessToken: prefs.getString(_credentialAccessToken) ?? "",
          refreshToken: prefs.getString(_credentialRefreshToken) ?? "");

    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class CredentialApiDataSource method rowCount ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

  @override
  Future<void> delete() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(_credentialAccessToken);
      await prefs.remove(_credentialRefreshToken);

    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class CredentialApiDataSource method authenticate ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

}