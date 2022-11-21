import 'package:data/user/data_source/user_api_data_source.dart';
import 'package:data/user/model/api/request/user_authentication_request_api_model.dart';
import 'package:data/user/model/api/request/user_reset_password_request_api_model.dart';
import 'package:data/user/model/api/response/user_registration_response_api_model.dart';
import 'package:data/user/model/api/user_api_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/authentication.dart';
import 'package:model/data/user.dart';

import 'model/api/response/user_authentication_response_api_model.dart';

// abstract class IUserRepository {
//   Future<bool> resetPasswordByEmail(String email);
//   Future<UserModel> authenticate(String email, String password);
//   Future<UserModel> create(String name, String displayName, String email, String password, int specialty, bool agreeToTermOfUse);
//   Future<UserModel> getInfo();
// }
//
// @Injectable(as: IUserRepository)
// class UserRepository implements IUserRepository {
//
//   final IUserApiDataSource _apiDataSource;
//   final IUserLocalDataSource _localDataSource;
//
//   UserRepository(this._apiDataSource, this._localDataSource);
//
//   @override
//   Future<UserModel> authenticate(String email, String password) async {
//     UserTokenResponseApiModel responseTokenApiModel =  (await _apiDataSource.authenticate(
//       UserAuthenticationRequestApiModel(
//         email: email,
//         password: password
//       )
//     ));
//     UserResponseApiModel responseApiModel =  (await _apiDataSource.getInfo());
//     responseApiModel.authentication = responseTokenApiModel;
//
//     _localDataSource.create(responseApiModel);
//
//     return responseApiModel.mapModel;
//
//   }
//
//   @override
//   Future<UserModel> create(String name, String displayName, String email, String password, int specialty, bool agreeToTermOfUse) {
//     // TODO: implement create
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<UserModel> getInfo() async {
//     UserResponseApiModel responseApiModel =  (await _apiDataSource.getInfo());
//     _localDataSource.update(responseApiModel.mapLocalModel)
//     return responseApiModel.mapModel;
//   }
//
//   @override
//   Future<bool> resetPasswordByEmail(String email) async => await _apiDataSource.resetPasswordByEmail(
//       UserResetPasswordRequestApiModel(email: email)
//   );
// }
