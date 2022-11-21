import 'package:equatable/equatable.dart';

class Terms extends Equatable {

  const Terms({
    required this.text
  });

  final String text;

  @override
  List<Object> get props => [text];
}
