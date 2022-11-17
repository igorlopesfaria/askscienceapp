import '../../core/token/token.dart';
import 'package:flutter/material.dart';
import '../text/text.props.dart';

class DSTextStyle {

  final DSToken token = DSToken();

  TextStyle customTextStyle(DSTypographyStyleType styleType) {
    switch (styleType) {
      case DSTypographyStyleType.heading1:
        return TextStyle(
            fontFamily: token.text.heading1.fontFamily,
            fontSize: token.text.heading1.fontSize,
            fontWeight: token.text.heading1.fontWeight
        );
      case DSTypographyStyleType.heading2:
        return TextStyle(
            fontFamily: token.text.heading2.fontFamily,
            fontSize: token.text.heading2.fontSize,
            fontWeight: token.text.heading2.fontWeight
        );
      case DSTypographyStyleType.heading3:
        return TextStyle(
            fontFamily: token.text.heading3.fontFamily,
            fontSize: token.text.heading3.fontSize,
            fontWeight: token.text.heading3.fontWeight
        );
      case DSTypographyStyleType.heading4:
        return TextStyle(
            fontFamily: token.text.heading4.fontFamily,
            fontSize: token.text.heading4.fontSize,
            fontWeight: token.text.heading4.fontWeight
        );
      case DSTypographyStyleType.heading5:
        return TextStyle(
            fontFamily: token.text.heading5.fontFamily,
            fontSize: token.text.heading5.fontSize,
            fontWeight: token.text.heading5.fontWeight
        );
      case DSTypographyStyleType.heading6:
        return TextStyle(
            fontFamily: token.text.heading6.fontFamily,
            fontSize: token.text.heading6.fontSize,
            fontWeight: token.text.heading6.fontWeight
        );

      case DSTypographyStyleType.heading7:
        return TextStyle(
            fontFamily: token.text.heading7.fontFamily,
            fontSize: token.text.heading7.fontSize,
            fontWeight: token.text.heading7.fontWeight
        );
      case DSTypographyStyleType.paragraph1:
        return TextStyle(
            fontFamily: token.text.paragraph1.fontFamily,
            fontSize: token.text.paragraph1.fontSize,
            fontWeight: token.text.paragraph1.fontWeight
        );
      case DSTypographyStyleType.paragraph2:
        return TextStyle(
            fontFamily: token.text.paragraph2.fontFamily,
            fontSize: token.text.paragraph2.fontSize,
            fontWeight: token.text.paragraph2.fontWeight
        );
      case DSTypographyStyleType.label:
        return TextStyle(
            fontFamily: token.text.label.fontFamily,
            fontSize: token.text.label.fontSize,
            fontWeight: token.text.label.fontWeight
        );
    }
  }

  Color customTextColor(DSTypographyColorType colorType) {
    switch (colorType) {
      case DSTypographyColorType.primary:
        return token.color.dark.pure;
      case DSTypographyColorType.secondary:
        return token.color.dark.one;
      case DSTypographyColorType.muted:
        return token.color.primary.light;
      case DSTypographyColorType.accent:
        return token.color.primary.normal;
      case DSTypographyColorType.warning:
        return token.color.feedback.warning;
      case DSTypographyColorType.success:
        return token.color.feedback.success;
      case DSTypographyColorType.error:
        return token.color.feedback.error;
      case DSTypographyColorType.bright:
        return token.color.light.pure;
    }
  }
}
