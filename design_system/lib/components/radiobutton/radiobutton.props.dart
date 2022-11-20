import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../variants.dart' as ds_variants;

class DSRadioButtonProps<T> {

  DSRadioButtonProps({
    required this.label,
    required this.groupValue,
    required this.value,
    required this.size,
    required this.onChanged,
    this.toggleable = false,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;
  final DSRadioButtonSize size;
  final bool toggleable;
  bool get selected => value == groupValue;
}

enum DSRadioButtonSize {
  sm,
  md,
  lg;

  Variant get variant {
    switch (this) {
      case sm:
        return ds_variants.small;
      case md:
        return ds_variants.medium;
      case lg:
        return ds_variants.large;
    }
  }

}