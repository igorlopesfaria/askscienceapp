import 'package:equatable/equatable.dart';

class MedicalSpecialty extends Equatable {

  const MedicalSpecialty({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}


