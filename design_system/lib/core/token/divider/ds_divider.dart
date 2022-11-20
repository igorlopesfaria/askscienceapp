import 'package:design_system/core/token/divider/divider.dart';

class DSDividerToken implements DividerTokenBase {

  @override
  DividerHeightTokenBase height = DSDividerHeightToken();
}

class DSDividerHeightToken implements DividerHeightTokenBase{
  DSDividerHeightToken({
    double? sm,
    double? md,
    double? lg
  }) {
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
  }

  @override
  double sm = 1;

  @override
  double md = 2;

  @override
  double lg = 4;
}