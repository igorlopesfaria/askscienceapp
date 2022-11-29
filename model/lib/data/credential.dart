import 'package:equatable/equatable.dart';

class Credential extends Equatable {
  const Credential({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [accessToken, refreshToken];
}