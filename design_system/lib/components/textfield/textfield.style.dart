import 'dart:ui';
import 'package:design_system/components/text/text.props.dart';
import 'package:design_system/components/textfield/textfield.dart';
import 'package:design_system/core/token/token.dart';

class DSTextFieldStyle{

  final DSToken token = DSToken();

  DSTypographyColorType customFeedbackTypographyColor(feedbackType) {
    DSTypographyColorType defaultValue = DSTypographyColorType.secondary;

    if(feedbackType == DSTextFieldFeedbackType.success){
      defaultValue = DSTypographyColorType.success;
    } else if (feedbackType == DSTextFieldFeedbackType.error){
      defaultValue = DSTypographyColorType.error;
    }
    return defaultValue;
  }

  DSTextFieldBorderProps get customFocusedBorder => DSTextFieldBorderProps(
    size: token.border.size.thick,
    color: token.color.primary.normal
  );

  DSTextFieldBorderProps get customDefaultBorder => DSTextFieldBorderProps(
    size: token.border.size.thin,
    color: token.color.light.one
  );

  double get borderRadius => token.border.radius.sm;

  Color get hintColor => token.color.dark.one;
  double get hintSize =>  token.font.size.xxxs;

  double heightCustomSize(DSTextFieldSize size) {
    switch(size) {
      case DSTextFieldSize.sm:
        return token.textField.height.sm;
      case DSTextFieldSize.md:
        return token.textField.height.md;
      case DSTextFieldSize.lg:
        return token.textField.height.lg;
    }
  }
}