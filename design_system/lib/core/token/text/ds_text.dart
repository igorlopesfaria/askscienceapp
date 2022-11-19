import 'dart:ui';
import '../font/ds_font.dart';
import '../font/font_token.dart';
import '../text/text.dart';

class DSText implements TextBase{

  @override
  TextCharacteristicBase heading1 = DSTextHeading1();

  @override
  TextCharacteristicBase heading2 = DSTextHeading2();

  @override
  TextCharacteristicBase heading3 = DSTextHeading3();

  @override
  TextCharacteristicBase heading4 = DSTextHeading4();

  @override
  TextCharacteristicBase heading5 = DSTextHeading5();

  @override
  TextCharacteristicBase heading6 = DSTextHeading6();

  @override
  TextCharacteristicBase heading7 = DSTextHeading7();

  @override
  TextCharacteristicBase paragraph = DSTextParagraph();

  @override
  TextCharacteristicBase paragraph1 = DSTextParagraph1();

  @override
  TextCharacteristicBase paragraph2 = DSTextParagraph2();

  @override
  TextCharacteristicBase label = DSTextLabel();

}

class DSTextHeading1 implements TextCharacteristicBase {

  DSTextHeading1({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.ul;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;
}

class DSTextHeading2 implements TextCharacteristicBase {

  DSTextHeading2({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.xxxl;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;
}

class DSTextHeading3 implements TextCharacteristicBase {

  DSTextHeading3({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.xxl;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;

}

class DSTextHeading4 implements TextCharacteristicBase {

  DSTextHeading4({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.lg;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;

}
class DSTextHeading5 implements TextCharacteristicBase {

  DSTextHeading5({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.md;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;
}

class DSTextHeading6 implements TextCharacteristicBase {

  DSTextHeading6({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.xs;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;
}

class DSTextHeading7 implements TextCharacteristicBase {

  DSTextHeading7({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.highlight;

  @override
  late double fontSize = fontBase.size.xxs;

  @override
  late FontWeight fontWeight = fontBase.weight.medium;
}
class DSTextParagraph implements TextCharacteristicBase {

  DSTextParagraph({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.base;

  @override
  late double fontSize = fontBase.size.xs;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;
}

class DSTextParagraph1 implements TextCharacteristicBase {

  DSTextParagraph1({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.base;

  @override
  late double fontSize = fontBase.size.xxs;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;
}

class DSTextParagraph2 implements TextCharacteristicBase {

  DSTextParagraph2({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.base;

  @override
  late double fontSize = fontBase.size.xxxs;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;
}

class DSTextLabel implements TextCharacteristicBase {

  DSTextLabel({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight
  }) {
    this.fontSize = fontSize ?? this.fontSize;
    this.fontFamily = fontFamily ?? this.fontFamily;
    this.fontWeight = fontWeight ?? this.fontWeight;
  }

  FontTokenBase fontBase = DSFont();

  @override
  late String fontFamily = fontBase.family.base;

  @override
  late double fontSize = fontBase.size.us;

  @override
  late FontWeight fontWeight = fontBase.weight.regular;

}