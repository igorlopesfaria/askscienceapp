class TextFieldTokenBase {

  TextFieldTokenBase({
    required this.height
  });

  final TextFieldHeightTokenBase height;
}

class TextFieldHeightTokenBase {
  TextFieldHeightTokenBase({
    required this.sm,
    required this.md,
    required this.lg,
  });

  final double sm;
  final double md;
  final double lg;
}