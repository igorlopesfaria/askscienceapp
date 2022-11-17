import 'package:flutter/widgets.dart';

import '../text/text.props.dart';
import '../text/text.style.dart';

class DSTextWidget extends StatelessWidget {

  DSTextWidget({
    super.key,
    required String text,
    required DSTypographyStyleType typographyStyle,
    DSTypographyColorType typographyColor = DSTypographyColorType.primary,
    TextAlign textAlign = TextAlign.left
  }): props = DSTextProps(
    text: text,
    typographyStyle: typographyStyle,
    typographyColor: typographyColor,
    textAlign: textAlign
  );

  final DSTextProps props;

  @override
  Widget build(BuildContext context) {

    final textStyle = DSTextStyle();

    return Text(
      props.text,
      textAlign: props.textAlign,
      style: textStyle.customTextStyle(props.typographyStyle).copyWith(
        color:textStyle.customTextColor(props.typographyColor)),
    );
  }
}
