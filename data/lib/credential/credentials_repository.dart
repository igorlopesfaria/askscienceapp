import 'package:data/credential/data_source/credential_api_data_source.dart';
import 'package:data/credential/data_source/credential_local_data_source.dart';
import 'package:data/credential/model/api/credential_request_api_model.dart';
import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/credential/model/credential_mapper.dart';
import 'package:data/credential/model/local/credential_token_local_model.dart';
import 'package:model/data/credential.dart';
import 'package:injectable/injectable.dart';

abstract class ICredentialRepository {
  Future<Credential> authenticate(String email, String password);
  Future<Credential> findLocalToken();
  Future<void> clearToken();
  Future<Credential> insertToken(String accessToken, String refreshToken);
}

@Injectable(as: ICredentialRepository)
class CredentialRepository implements ICredentialRepository {

  final ICredentialApiDataSource _apiDataSource;
  final ICredentialLocalDataSource _localDataSource;

  CredentialRepository(this._apiDataSource, this._localDataSource);

  @override
  Future<Credential> authenticate(String email, String password) async {
    CredentialRequestApiModel requestModel = CredentialRequestApiModel(email: email, password: password);

    CredentialTokenResponseApiModel tokenResponseApiModel = (await _apiDataSource.authenticate(requestModel)).data;

    CredentialTokenLocalModel localModel= tokenResponseApiModel.mapLocalModel;

    await _localDataSource.insert(localModel);

    return localModel.mapModel;
  }


  @override
  Future<Credential> insertToken(String accessToken, String refreshToken) async {
    CredentialTokenLocalModel localModel = CredentialTokenLocalModel(accessToken: accessToken, refreshToken: refreshToken);

    await _localDataSource.insert(localModel);

    return localModel.mapModel;
  }

  @override
  Future<Credential> findLocalToken() async => (await _localDataSource.find()).mapModel;


  @override
  Future<void> clearToken() async {
    await _localDataSource.delete();
  }
}
