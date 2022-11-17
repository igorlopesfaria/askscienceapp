
import 'dart:ui';

import '../../token/color/color_token.dart';

class DSColorToken implements ColorTokenBase {
  @override
  ColorFeedbackTokenBase feedback = DSColorFeedbackToken();

  @override
  ColorNeutralTokenBase light = DSColorNeutralLightToken();

  @override
  ColorNeutralTokenBase dark = DSColorNeutralDarkToken();

  @override
  ColorPrincipalTokenBase primary = DSColorPrimaryToken();

  @override
  ColorPrincipalTokenBase secondary = DSColorSecondaryToken();

  @override
  Color transparent = const Color(0x00000000);
}

class DSColorFeedbackToken implements ColorFeedbackTokenBase {

  DSColorFeedbackToken({
    Color? error,
    Color? info,
    Color? success,
    Color? warning,
  }) {
    this.error = error ?? this.error;
    this.info = info ?? this.info;
    this.success = success ?? this.success;
    this.warning = warning ?? this.warning;
  }

  @override
  Color error = const Color(0xFFE04F5F);

  @override
  Color info = const Color(0xFF3896F3);

  @override
  Color success = const Color(0xFF4BAD50);

  @override
  Color warning = const Color(0xFFFAB401);

}

class DSColorNeutralLightToken implements ColorNeutralTokenBase {

  DSColorNeutralLightToken({
    Color? one,
    Color? two,
    Color? three,
    Color? pure
  }) {
    this.one = one ?? this.one;
    this.two = two ?? this.two;
    this.three = three ?? this.three;
    this.pure = pure ?? this.pure;
  }

  @override
  Color pure = const Color(0xFFFFFFFF);

  @override
  Color one = const Color(0xFFF0F0F0);

  @override
  Color two = const Color(0xFFCCCCCC);

  @override
  Color three = const Color(0xFFB8B8B8);
}

class DSColorNeutralDarkToken implements ColorNeutralTokenBase {

  DSColorNeutralDarkToken({
    Color? one,
    Color? two,
    Color? three,
    Color? pure
  }) {
    this.one = one ?? this.one;
    this.two = two ?? this.two;
    this.three = three ?? this.three;
    this.pure = pure ?? this.pure;
  }

  @override
  Color pure = const Color(0xFF121212);

  @override
  Color one = const Color(0xFF666666);

  @override
  Color two = const Color(0xFF3D3D3D);

  @override
  Color three = const Color(0xFF1F1F1F);

}

class DSColorPrimaryToken implements ColorPrincipalTokenBase {

  DSColorPrimaryToken({
    Color? light,
    Color? dark,
    Color? normal
  }) {
    this.light = light ?? this.light;
    this.dark = dark ?? this.dark;
    this.normal = normal ?? this.normal;
  }
    @override
    Color light = const Color(0xFF7C9CBF);

    @override
    Color dark = const Color(0xFF076a8e);

    @override
    Color normal = const Color(0xFF0880AE);
}

class DSColorSecondaryToken implements ColorPrincipalTokenBase {

  DSColorSecondaryToken({
    Color? light,
    Color? dark,
    Color? normal
  }) {
    this.light = light ?? this.light;
    this.dark = dark ?? this.dark;
    this.normal = normal ?? this.normal;
  }
  @override
  Color light = const Color(0xFF73cebd);


  @override
  Color dark = const Color(0xFF127a67);

  @override
  Color normal = const Color(0xFF14A38B);

}
