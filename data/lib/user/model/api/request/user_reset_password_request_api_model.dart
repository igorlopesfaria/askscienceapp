import 'package:equatable/equatable.dart';

class UserResetPasswordRequestApiModel extends Equatable {
  const UserResetPasswordRequestApiModel({
    required this.email});

  final String email;

  @override
  List<Object?> get props => [email];

}
