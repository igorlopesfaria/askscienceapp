import 'package:flutter/cupertino.dart';

class DSCheckboxProps {
  DSCheckboxProps({
    required this.value,
    required this.onChanged,
    required this.label
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
}
