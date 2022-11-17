

import '../../token/loading/loading_token.dart';

class DSLoadingToken implements LoadingTokenBase{

  @override
  LoadingSizeTokenBase size = DSLoadingSizeToken();

  @override
  LoadingStrokeTokenBase stroke = DSLoadingStrokeToken();

}
class DSLoadingStrokeToken implements LoadingStrokeTokenBase {

  DSLoadingStrokeToken({
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
  }

  @override
  double sm = 1;

  @override
  double md = 2;

  @override
  double lg = 3;

  @override
  double xl = 4;
}

class DSLoadingSizeToken implements LoadingSizeTokenBase {

  DSLoadingSizeToken({
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
  }

  @override
  double sm = 4;

  @override
  double md = 8;

  @override
  double lg = 16;

  @override
  double xl = 32;

}