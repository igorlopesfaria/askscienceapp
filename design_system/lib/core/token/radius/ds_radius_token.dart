import 'radius_token.dart';

class DSRadiusToken implements RadiusTokenBase {

  DSRadiusToken({
    double? none,
    double? sm,
    double? md,
    double? lg,
    double? xlg

  }) {
    none = none ?? this.none;
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xlg = xlg ?? this.xlg;
  }

  @override
  double none = 0;

  @override
  double sm = 4;

  @override
  double md = 8;

  @override
  double lg = 16;

  @override
  double xlg = 20;

}