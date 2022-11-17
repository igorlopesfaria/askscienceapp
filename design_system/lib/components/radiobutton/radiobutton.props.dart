import 'package:flutter/material.dart';

class DSRadioButtonProps<T> {

  DSRadioButtonProps({
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.toggleable = false,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;
  final bool toggleable;
  bool get selected => value == groupValue;
}