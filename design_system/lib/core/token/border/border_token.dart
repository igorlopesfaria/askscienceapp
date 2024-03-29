import 'dart:ui';

class BorderTokenBase {

  BorderTokenBase({
    required this.size,
    required this.radius
  });

  final BorderRadiusTokenBase radius;
  final BorderSizeTokenBase size;
}

class BorderSizeTokenBase {
  BorderSizeTokenBase({
    required this.heightDefault,
    required this.thin,
    required this.thick,
    required this.thicker,
  });

  final double heightDefault;
  final double thin;
  final double thick;
  final double thicker;
}

class BorderRadiusTokenBase {

  BorderRadiusTokenBase({
    required this.radiusDefault,
    required this.sm,
    required this.md,
    required this.lg,
    required this.pill,
  });

  final double radiusDefault;
  final double sm;
  final double md;
  final double lg;
  final double pill;
}