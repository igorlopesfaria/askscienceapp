import 'package:flutter/material.dart';

class DSFeedbackProps {

  DSFeedbackProps({
    this.image,
    required this.title,
    required this.description,
    required this.size,
    required this.type,
    this.buttonText,
    this.onIconPressed,
    this.onButtonPressed,
  });

  final Icon? image;
  final String title;
  final String description;
  final String? buttonText;
  final void Function()? onButtonPressed;
  final void Function()? onIconPressed;
  final DSFeedbackSize size;
  final DSFeedbackType type;
}

enum DSFeedbackType {
  success,
  empty,
  email,
  error,
  info,
  await,
  reload,
  warning;
}

enum DSFeedbackSize {
  sm,
  md;
}