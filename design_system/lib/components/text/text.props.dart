import 'dart:ui';
import 'package:mix/mix.dart';

class DSTextProps {

  DSTextProps({
    required this.text,
    required this.typographyStyle,
    required this.typographyColor,
    required this.textAlign
  });

  final String text;
  final DSTypographyStyleType typographyStyle;
  final DSTypographyColorType typographyColor;
  final TextAlign textAlign;

}

enum DSTypographyStyleType {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  heading7,
  paragraph1,
  paragraph2,
  label;

  Variant get variant {
    switch (this) {
      case heading1:
        return Variant('heading1');
      case heading2:
        return Variant('heading2');
      case heading3:
        return Variant('heading3');
      case heading4:
        return Variant('heading4');
      case heading5:
        return Variant('heading5');
      case heading6:
        return Variant('heading6');
      case heading7:
        return Variant('heading7');
      case paragraph1:
        return Variant('paragraph1');
      case paragraph2:
        return Variant('paragraph2');
      case label:
        return Variant('label');
    }
  }

}

enum DSTypographyColorType {
  primary,
  secondary,
  muted,
  accent,
  warning,
  success,
  error,
  bright;

  Variant get variant {
    switch (this) {
      case primary:
        return Variant('primary');
      case secondary:
        return Variant('secondary');
      case muted:
        return Variant('muted');
      case accent:
        return Variant('accent');
      case warning:
        return Variant('warning');
      case success:
        return Variant('success');
      case error:
        return Variant('error');
      case bright:
        return Variant('bright');
    }
  }
}