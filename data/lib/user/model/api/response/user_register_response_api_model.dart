import 'package:data/credential/model/api/credential_response_api_model.dart';
import 'package:data/medical_specialty/model/api/response/medical_specialty_response_api_model.dart';
import 'package:data/user/model/api/response/user_response_api_model.dart';
import 'package:equatable/equatable.dart';

class UserRegisterResponseApiModel extends Equatable {
  const UserRegisterResponseApiModel({
    required this.data
  });

  final UserResponseApiModel data;

  factory UserRegisterResponseApiModel.fromJson(Map<String, dynamic> json) => UserRegisterResponseApiModel(
      data: json["data"]
  );

  @override
  List<Object> get props => [data];
}
