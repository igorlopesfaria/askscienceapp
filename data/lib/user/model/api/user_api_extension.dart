import 'package:data/medical_specialty/model/medical_specialty_extension.dart';
import 'package:data/terms/model/api/response/terms_response_api_model.dart';
import 'package:data/user/model/api/response/user_registration_response_api_model.dart';
import 'package:model/data/terms.dart';
import 'package:model/data/user.dart';

extension UserResponseApiModelExtension on UserResponseApiModel {
  UserModel get mapModel {
    return UserModel(
      id: id,
      name: name,
      email: email,
      displayName: displayName,
      crm: crm,
      specialty: specialty.mapModel,
      verified: verified
    );
  }
}