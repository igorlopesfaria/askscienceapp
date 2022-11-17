import 'package:flutter/widgets.dart';

import '../../core/token/token.dart';
import '../button/button.dart';
import '../dialog/dialog.props.dart';
import '../text/text.dart';

class DSDialogWidget extends StatelessWidget {
  DSDialogWidget({
    super.key,
    required String title,
    required String description,
    required String primaryButtonText,
    required String secondaryButtonText,
    required void Function()? onPrimaryPressed,
    required void Function()? onSecondaryPressed,
    bool showLoading = false,
  }) : props = DSDialogProps(
            title: title,
            description: description,
            primaryButtonText: primaryButtonText,
            secondaryButtonText: secondaryButtonText,
            onPrimaryPressed: onPrimaryPressed,
            onSecondaryPressed: onSecondaryPressed);

  final DSDialogProps props;
  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {
    // final dialogStyle = DSDialogStyle();

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
            Expanded(
                child: DSTextWidget(
                    text: props.title,
                    typographyStyle: DSTypographyStyleType.heading6)),
            Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
          ]),
          Padding(padding: EdgeInsets.only(top: token.spacing.xxs)),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
            Expanded(
                child: DSTextWidget(
                    text: props.description,
                    typographyStyle: DSTypographyStyleType.paragraph1,
                    typographyColor: DSTypographyColorType.secondary)),
            Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
          ]),

          // ),
          Padding(padding: EdgeInsets.only(top: token.spacing.sm)),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: token.spacing.sm)),
            Expanded(
                child: DSButtonWidget(
              onPressed: () {},
              label: props.secondaryButtonText,
              size: DSButtonSize.md,
              type: DSButtonType.secondary,
            )),
            Padding(padding: EdgeInsets.only(left: token.spacing.xs)),
            Expanded(
                child: DSButtonWidget(
                    onPressed: () {},
                    size: DSButtonSize.md,
                    label: props.primaryButtonText)),
            Padding(padding: EdgeInsets.only(right: token.spacing.sm)),
          ]),
          Padding(padding: EdgeInsets.only(top: token.spacing.sm)),
        ]);
  }
}
