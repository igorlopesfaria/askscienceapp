
import 'dart:ui';

class ColorTokenBase {

  ColorTokenBase({
    required this.transparent,
    required this.light,
    required this.dark,
    required this.feedback,
    required this.primary,
    required this.secondary
  });
  Color transparent;
  ColorFeedbackTokenBase feedback;
  ColorNeutralTokenBase dark;
  ColorNeutralTokenBase light;
  ColorPrincipalTokenBase primary;
  ColorPrincipalTokenBase secondary;
}

class ColorFeedbackTokenBase {
  ColorFeedbackTokenBase({
    required this.error,
    required this.info,
    required this.success,
    required this.warning,
  });

  Color error;
  Color info;
  Color success;
  Color warning;
}

class ColorNeutralTokenBase {
  ColorNeutralTokenBase({
    required this.pure,
    required this.one,
    required this.two,
    required this.three
  });

  Color pure;
  Color one;
  Color two;
  Color three;
}

class ColorPrincipalTokenBase {
  ColorPrincipalTokenBase({
    required this.light,
    required this.normal,
    required this.dark
  });

  Color light;
  Color normal;
  Color dark;
}


