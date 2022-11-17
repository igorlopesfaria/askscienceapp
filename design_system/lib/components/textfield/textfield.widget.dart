import 'package:design_system/core/token/token.dart';

import '../text/text.dart';
import '../textfield/textfield.dart';
import 'package:flutter/material.dart';

class DSTextFieldWidget extends StatelessWidget {

  DSTextFieldWidget({
    super.key,
    String? label,
    required String hint,
    DSTextFieldType type = DSTextFieldType.normal,
    DSTextFieldFeedbackType? feedbackType,
    String? feedbackText,
    Icon? icon
  }): props = DSTextFieldProps(
    label: label,
    hint: hint,
    type: type,
    feedbackType: feedbackType,
    feedbackText: feedbackText,
    icon: icon,
  );
  final DSTextFieldProps props;
  final DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {

    final textFieldStyle = DSTextFieldStyle();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(props.label != null) ...[
          // Label
          DSTextWidget(
            text: props.label!,
            typographyStyle: DSTypographyStyleType.paragraph2,
            typographyColor: DSTypographyColorType.secondary,
          ),
          Padding(padding: EdgeInsets.only(top: token.spacing.xxxs)),
        ],
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: textFieldStyle.customFocusedBorder.color,
                  width: textFieldStyle.customFocusedBorder.size
              ),
              borderRadius: BorderRadius.all(Radius.circular(textFieldStyle.borderRadius)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: textFieldStyle.customDefaultBorder.color,
                  width: textFieldStyle.customDefaultBorder.size
              ),
              borderRadius: BorderRadius.all(Radius.circular(textFieldStyle.borderRadius)),
            ),
            hintText: props.hint,
            hintStyle: TextStyle(
              color: textFieldStyle.hintColor,
              fontSize: textFieldStyle.hintSize

            ),
          ),
        ),
        if(props.feedbackText != null && props.feedbackType != null) ...[
          Padding(padding: EdgeInsets.only(top: token.spacing.xxxs)),
          DSTextWidget(
            text: props.feedbackText!,
            typographyStyle: DSTypographyStyleType.label,
            typographyColor: textFieldStyle.customFeedbackTypographyColor(props.feedbackType!),
          ),
        ]
      ],
    );
  }
}