import 'package:design_system/core/token/textfield/textfield.dart';

class DSTextFieldToken implements TextFieldTokenBase {

  @override
  TextFieldHeightTokenBase height = DSTextFieldHeightToken();
}

class DSTextFieldHeightToken implements TextFieldHeightTokenBase{
  DSTextFieldHeightToken({
    double? sm,
    double? md,
    double? lg
  }) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 15;

  @override
  double md = 20;

  @override
  double lg = 40;
}