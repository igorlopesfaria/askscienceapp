import 'package:data/user/data_source/user_api_data_source.dart';
import 'package:data/user/data_source/user_local_data_source.dart';
import 'package:data/user/model/api/request/user_registration_request_api_model.dart';
import 'package:data/user/model/api/request/user_reset_password_request_api_model.dart';
import 'package:data/user/model/api/response/user_response_api_model.dart';
import 'package:data/user/model/api/user_api_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/user.dart';

abstract class IUserRepository {
  Future<bool> resetPasswordByEmail(String email);
  Future<User> register(String name, String displayName, String email, String password, String crm, int specialty, bool agreeToTermOfUse);
  Future<User> getInfo();
  Future<void> clear();
}

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {

  final IUserApiDataSource _apiDataSource;
  final IUserLocalDataSource _localDataSource;

  UserRepository(this._apiDataSource, this._localDataSource);


  @override
  Future<User> register(String name, String displayName, String email, String password, String crm, int specialty, bool agreeToTermOfUse) async {
    UserResponseApiModel responseApiModel =  (await _apiDataSource.register(
      UserRegistrationRequestApiModel(
          name: name,
          displayName: displayName,
          specialty: specialty,
          crm: crm,
          email: email,
          password: password,
          agreeToTermOfUse: agreeToTermOfUse)
    )).data;

    _localDataSource.insert(responseApiModel.mapLocalModel);
    return responseApiModel.mapModel;
  }

  @override
  Future<User> getInfo() async {
    UserResponseApiModel responseApiModel = (await _apiDataSource.getInfo()).data;
    _localDataSource.insert(responseApiModel.mapLocalModel);
    return responseApiModel.mapModel;
  }

  @override
  Future<bool> resetPasswordByEmail(String email) async =>
    await _apiDataSource.resetPasswordByEmail(UserResetPasswordRequestApiModel(email: email));

  @override
  Future<void> clear() async {
    await _localDataSource.delete();
  }
}
