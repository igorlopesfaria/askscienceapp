import 'dart:ui';
import '../text/text.props.dart';
import '../textfield/textfield.props.dart';
import '../../core/token/token.dart';

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
    color: token.color.light.two
  );

  double get borderRadius => token.border.radius.sm;

  Color get hintColor => token.color.primary.light;
  double get hintSize =>  token.font.size.xxxs;
}