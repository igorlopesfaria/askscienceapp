
import 'package:mix/mix.dart';

import '../../components/button/button.dart';
import '../../components/icon/icon.widget.dart';
import '../../components/text/text.dart';
import '../../core/token/token.dart';
import '../feedback/feedback.props.dart';
import '../feedback/feedback.style.dart';
import 'package:flutter/widgets.dart';

class DSFeedbackWidget extends StatelessWidget {

  DSFeedbackWidget({
    super.key,
    Icon? image,
    required String title,
    required String description,
    DSFeedbackSize size = DSFeedbackSize.md,
    DSFeedbackType type = DSFeedbackType.error,
    String? buttonText,
    void Function()? onIconPressed,
    void Function()? onButtonPressed,
  }) : props = DSFeedbackProps(
      image: image,
      title: title,
      description: description,
      type: type,
      size: size,
      buttonText: buttonText,
      onIconPressed: onIconPressed,
      onButtonPressed: onButtonPressed
  );

  final DSFeedbackProps props;
  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {
    final feedbackStyle = DSFeedbackStyle();

    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
        Expanded(
          child: Column(
            children: [
              Pressable(
                onPressed: ()  {
                  props.onIconPressed?.call();
                },
                child: Box( child:DSIconWidget(
                  icon: feedbackStyle.getIconByType(props.type),
                  size: feedbackStyle.getIconBySize(props.size)
                )),
              ),
              Padding(padding: EdgeInsets.only(top: feedbackStyle.spacingVerticalIconSize(props.size))),
              DSTextWidget(
                  text: props.title,
                  textAlign: TextAlign.center,
                  typographyStyle: feedbackStyle.titleFont(props.size)),
              Padding(padding: EdgeInsets.only(top: feedbackStyle.spacingVerticalSize(props.size))),
              DSTextWidget(
                text: props.description,
                textAlign: TextAlign.center,
                typographyStyle: feedbackStyle.descriptionFont(props.size),
                typographyColor: DSTypographyColorType.secondary),
                if (props.buttonText != null) ...[
                  Padding(padding: EdgeInsets.only(top: feedbackStyle.spacingVerticalSize(props.size))),
                  DSButtonWidget(
                    onPressed: () => {
                      props.onButtonPressed?.call()
                    },
                    label: props.buttonText!,
                    size: feedbackStyle.geButtonBySize(props.size),
                    type: DSButtonType.secondary,
                  ),
                  Padding(padding: EdgeInsets.only(top: token.spacing.md)),
                ] else ... [
                  Padding(padding: EdgeInsets.only(top: token.spacing.md)),
                ]
            ],
          )
        ),
        Padding(padding: EdgeInsets.only(right: token.spacing.sm)),
      ],
    );
  }
}