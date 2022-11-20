import 'package:design_system/components/text/text.dart';
import 'package:design_system/components/textfield/textfield.dart';
import 'package:design_system/core/token/token.dart';
import 'package:flutter/material.dart';

class DSTextFieldWidget extends StatelessWidget {
  DSTextFieldWidget(
      {super.key,
      String? label,
      required String hint,
      DSTextFieldType type = DSTextFieldType.normal,
      DSTextFieldFeedbackType? feedbackType,
      String? feedbackText,
      DSTextFieldSize size = DSTextFieldSize.md,
      Function? onTextChanged,
      Icon? icon})
      : props = DSTextFieldProps(
          label: label,
          hint: hint,
          type: type,
          feedbackType: feedbackType,
          feedbackText: feedbackText,
          size: size,
          icon: icon,
          onTextChanged: onTextChanged
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
        if (props.label != null) ...[
          // Label
          DSTextWidget(
            text: props.label!,
            typographyStyle: DSTypographyStyleType.paragraph2,
            typographyColor: DSTypographyColorType.secondary,
          ),
          Padding(padding: EdgeInsets.only(top: token.spacing.xxxs)),
        ],
        // SizedBox(

        // child:
        TextField(
          onChanged: (text) {
            props.onTextChanged?.call(text);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: token.color.light.one,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () => props.onTextChanged?.call(""),
              icon: const Icon(Icons.clear),
            ),
            hintText: props.hint,
            hintStyle: TextStyle(
                color: textFieldStyle.hintColor,
                fontSize: textFieldStyle.hintSize),  contentPadding: EdgeInsets.only(
                left: 12,
                top: textFieldStyle.heightCustomSize(props.size),
                bottom: textFieldStyle.heightCustomSize(props.size)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: textFieldStyle.customFocusedBorder.color,
                  width: textFieldStyle.customFocusedBorder.size),
              borderRadius: BorderRadius.all(
                  Radius.circular(textFieldStyle.borderRadius)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: textFieldStyle.customDefaultBorder.color,
                  width: textFieldStyle.customDefaultBorder.size),
              borderRadius: BorderRadius.all(
                  Radius.circular(textFieldStyle.borderRadius)),
            ),

          ),
          cursorColor: token.color.primary.normal,
        ),
        if (props.feedbackText != null && props.feedbackType != null) ...[
          Padding(padding: EdgeInsets.only(top: token.spacing.xxxs)),
          DSTextWidget(
            text: props.feedbackText!,
            typographyStyle: DSTypographyStyleType.label,
            typographyColor: textFieldStyle
                .customFeedbackTypographyColor(props.feedbackType!),
          ),
        ]
      ],
    );
  }
}
