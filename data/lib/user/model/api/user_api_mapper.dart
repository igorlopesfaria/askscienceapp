import 'package:data/medical_specialty/model/medical_specialty_mapper.dart';
import 'package:data/user/model/api/response/user_register_response_api_model.dart';
import 'package:data/user/model/api/response/user_response_api_model.dart';
import 'package:data/user/model/local/user_local_model.dart';
import 'package:model/data/user.dart';

extension UserResponseApiModelMapper on UserResponseApiModel {
  User get mapModel {
    return User(
      id: id,
      name: name,
      email: email,
      displayName: displayName,
      crm: crm,
      specialty: specialty.mapModel,
      verified: verified
    );
  }

  UserLocalModel get mapLocalModel {
    return UserLocalModel(
        id: id,
        name: name,
        email: email,
        displayName: displayName,
        crm: crm,
        specialtyName: specialty.name,
        specialtyId: specialty.id,
        verified: verified
    );
  }

}

