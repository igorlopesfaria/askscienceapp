import 'package:equatable/equatable.dart';

class TermsResponseApiModel extends Equatable {
  const TermsResponseApiModel({
    required this.data
  });

  final String data;

  factory TermsResponseApiModel.fromJson(Map<String, dynamic> json) => TermsResponseApiModel(
      data: json["data"]
  );

  @override
  List<Object> get props => [data];
}
