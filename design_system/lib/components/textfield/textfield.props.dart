import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class DSTextFieldProps {

  DSTextFieldProps({
    this.label,
    required this.hint,
    required this.type,
    this.feedbackType,
    this.feedbackText,
    this.border,
    this.icon
  });

  final String? label;
  final String hint;
  final DSTextFieldType type;
  final DSTextFieldFeedbackType? feedbackType;
  final String? feedbackText;
  final DSTextFieldBorderProps? border;
  final Icon? icon;
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
  select;

  Variant get variant {
    switch (this) {
      case normal:
        return Variant('normal');
      case search:
        return Variant('search');
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