import 'dart:ui';

class RadioButtonTokenBase {

  RadioButtonTokenBase({
    required this.size,
    required this.border,
  });

  final RadioButtonSizeTokenBase size;
  final RadioButtonBorderTokenBase border;
}

class RadioButtonSizeTokenBase {
  RadioButtonSizeTokenBase({
    required this.sm,
    required this.md,
    required this.lg
  });

  final double sm;
  final double md;
  final double lg;
}

class RadioButtonBorderTokenBase {
  RadioButtonBorderTokenBase({
    required this.sm,
    required this.md,
    required this.lg
  });

  final double sm;
  final double md;
  final double lg;
}