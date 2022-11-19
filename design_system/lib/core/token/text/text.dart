import 'dart:ui';

class TextBase{
  TextBase({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.heading6,
    required this.heading7,
    required this.paragraph,
    required this.paragraph1,
    required this.paragraph2,
    required this.label,
  });

  final TextCharacteristicBase heading1;
  final TextCharacteristicBase heading2;
  final TextCharacteristicBase heading3;
  final TextCharacteristicBase heading4;
  final TextCharacteristicBase heading5;
  final TextCharacteristicBase heading6;
  final TextCharacteristicBase heading7;
  final TextCharacteristicBase paragraph;
  final TextCharacteristicBase paragraph1;
  final TextCharacteristicBase paragraph2;
  final TextCharacteristicBase label;
}

class TextCharacteristicBase {
  TextCharacteristicBase({
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
  });

  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
}
