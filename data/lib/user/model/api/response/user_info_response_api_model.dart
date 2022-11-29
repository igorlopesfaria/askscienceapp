import 'package:data/user/model/api/response/user_register_response_api_model.dart';
import 'package:data/user/model/api/response/user_response_api_model.dart';
import 'package:equatable/equatable.dart';

class UserInfoResponseApiModel extends Equatable {
  const UserInfoResponseApiModel({
    required this.data
  });

  final UserResponseApiModel data;

  factory UserInfoResponseApiModel.fromJson(Map<String, dynamic> json) => UserInfoResponseApiModel(
      data: json["data"]
  );

  @override
  List<Object> get props => [data];
}