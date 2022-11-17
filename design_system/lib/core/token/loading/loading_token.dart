
class LoadingTokenBase {
  LoadingTokenBase({
    required this.size,
    required this.stroke,
  });

  LoadingSizeTokenBase size;
  LoadingStrokeTokenBase stroke;
}

class LoadingSizeTokenBase {

  LoadingSizeTokenBase({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  double sm;
  double md;
  double lg;
  double xl;
}

class LoadingStrokeTokenBase {

  LoadingStrokeTokenBase({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl
  });

  double sm;
  double md;
  double lg;
  double xl;
}