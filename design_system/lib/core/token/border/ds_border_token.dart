import '../border/border_token.dart';

class DSBorderToken implements BorderTokenBase {
  DSBorderToken({
    BorderSizeTokenBase? size,
    BorderRadiusTokenBase? radius,
  }) {
    this.size = size ?? this.size;
    this.radius = radius ?? this.radius;
  }

  @override
  BorderSizeTokenBase size = DSBorderSizeToken();

  @override
  BorderRadiusTokenBase radius = DSBorderRadiusToken();
}


class DSBorderSizeToken implements BorderSizeTokenBase {
  DSBorderSizeToken({
    double? heightDefault,
    double? thin,
    double? thick,
    double? thicker
  }) {
    this.heightDefault = heightDefault ?? this.heightDefault;
    this.thin = thin ?? this.thin;
    this.thick = thick ?? this.thick;
    this.thicker = thicker ?? this.thicker;
  }

  @override
  double heightDefault = 0;

  @override
  double thin = 1;

  @override
  double thick = 2;

  @override
  double thicker = 4;
}

class DSBorderRadiusToken implements BorderRadiusTokenBase {
  DSBorderRadiusToken({
    double? radiusDefault,
    double? sm,
    double? md,
    double? lg,
    double? pill,
  }) {
    this.radiusDefault = radiusDefault ?? this.radiusDefault;
    this.sm = sm ?? this.sm;
    this.md = md ?? this.md;
    this.lg = lg ?? this.lg;
    this.pill = pill ?? this.pill;
  }

  @override
  double radiusDefault = 0;

  @override
  double sm = 4;

  @override
  double md = 8;

  @override
  double lg = 16;

  @override
  double pill = 500;
}