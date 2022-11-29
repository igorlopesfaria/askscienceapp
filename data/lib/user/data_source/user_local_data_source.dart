import 'dart:convert';

import 'package:commons/exception/exception.dart';
import 'package:commons/report/reporter.dart';
import 'package:data/user/model/local/user_local_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserLocalDataSource {
  Future<void> insert(UserLocalModel localModel);
  Future<UserLocalModel?> find();
  Future<void> delete();
}

@Injectable(as: IUserLocalDataSource)
class UserLocalDataSource implements IUserLocalDataSource {

  final IReporter _reporter;

  static const _userLocalModel = "UserLocalModel";


  UserLocalDataSource(this._reporter);

  @override
  Future<void> insert(UserLocalModel localModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(_userLocalModel, json.encode(localModel));
    } catch (e, stacktrace) {
      String cause = "There is an exception on api datasource layer. Class CredentialLocalDataSource method insert ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }

  @override
  Future<UserLocalModel?> find() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? result = prefs.getString(_userLocalModel);
      if(result != null) {
        return json.decode(result);
      } else {
        return null;
      }
    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class UserApiDataSource method rowCount ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }

  }


  @override
  Future<void> delete() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(_userLocalModel);
    } catch (e, stacktrace) {
      String cause = "There is an exception on local datasource layer. Class UserApiDataSource method authenticate ${e.toString()}";
      _reporter.recordCustomError(e, stacktrace, cause);
      throw DataLocalException(cause);
    }
  }
}
