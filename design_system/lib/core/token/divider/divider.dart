class DividerTokenBase {

  DividerTokenBase({
    required this.height
  });

  final DividerHeightTokenBase height;
}

class DividerHeightTokenBase {
  DividerHeightTokenBase({
    required this.sm,
    required this.md,
    required this.lg,
  });

  final double sm;
  final double md;
  final double lg;
}