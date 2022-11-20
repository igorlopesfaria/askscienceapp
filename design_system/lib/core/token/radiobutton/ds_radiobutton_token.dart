
import 'package:design_system/core/token/radiobutton/radiobutton_token.dart';

class DSRadioButtonToken implements RadioButtonTokenBase {

  @override
  RadioButtonSizeTokenBase size = DSRadioButtonSizeToken();
  @override
  RadioButtonBorderTokenBase border = DSRadioButtonBorderSizeToken();

}

class DSRadioButtonSizeToken implements RadioButtonSizeTokenBase {
  DSRadioButtonSizeToken({
    double? sm,
    double? md,
    double? lg
  }) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 20;

  @override
  double md = 24;

  @override
  double lg = 28;

}

class DSRadioButtonBorderSizeToken implements RadioButtonBorderTokenBase {
  DSRadioButtonBorderSizeToken({
    double? sm,
    double? md,
    double? lg
  }) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 6;

  @override
  double md = 8;

  @override
  double lg = 10;

}
