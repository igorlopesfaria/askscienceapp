import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import '../variants.dart' as ds_variants;

class DSTextFieldProps {

  DSTextFieldProps({
    this.label,
    required this.hint,
    required this.type,
    this.feedbackType,
    this.feedbackText,
    this.border,
    required this.size,
    this.icon,
    this. onTextChanged
  });

  final String? label;
  final String hint;
  final DSTextFieldType type;
  final DSTextFieldFeedbackType? feedbackType;
  final String? feedbackText;
  final DSTextFieldBorderProps? border;
  final DSTextFieldSize size;
  final Icon? icon;
  final Function? onTextChanged;
}

class DSTextFieldBorderProps {
  DSTextFieldBorderProps({
    required this.size,
    required this.color,
  });
  final double size;
  final Color color;
}

enum DSTextFieldType {
  normal,
  search,
  password,
  select;

  Variant get variant {
    switch (this) {
      case normal:
        return Variant('normal');
      case search:
        return Variant('search');
      case password:
        return Variant('pasword');
      case select:
        return Variant('select');
    }
  }
}
enum DSTextFieldFeedbackType {
  error,
  success;

  Variant get variant {
    switch (this) {
      case error:
        return Variant('error');
      case success:
        return Variant('success');
    }
  }

}

enum DSTextFieldSize {
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