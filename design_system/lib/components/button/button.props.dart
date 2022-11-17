import 'package:mix/mix.dart';
import '../variants.dart' as ds_variants;

class DSButtonProps {

  DSButtonProps({
    required this.label,
    required this.type,
    required this.size,
    this.onPressed,
    this.showLoading = false
  });

  final String label;
  final DSButtonType type;
  final DSButtonSize size;
  final bool showLoading;
  final void Function()? onPressed;
}


enum DSButtonType {
  primary,
  secondary,
  link;

  Variant get variant {
    switch (this) {
      case primary:
        return Variant('primary');
      case secondary:
        return Variant('secondary');
      case link:
        return Variant('link');
    }
  }
}

enum DSButtonSize {
  sm,
  md,
  lg;

  Variant get variant {
    switch (this) {
      case sm:
        return ds_variants.small;
      case md:
        return ds_variants.medium;
      case lg:
        return ds_variants.large;
    }
  }
}
