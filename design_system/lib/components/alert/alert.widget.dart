import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../core/token/token.dart';
import '../alert/alert.dart';
import '../icon/icon.dart';
import '../text/text.dart';

class DSAlertBuilder {
  DSAlertBuilder({
    required String message,
    DSAlertType type = DSAlertType.error,
    required void Function()? onPressed,
  }) : props = DSAlertProps(message: message, type: type, onPressed: onPressed);

  final DSAlertProps props;

  void show(BuildContext context) {
    DSAlertStyle alertStyle = DSAlertStyle(DSToken());

    SnackBar snackBar = SnackBar(
      content: DSAlertWidget(props),
      backgroundColor: alertStyle.getBgColorByType(props.type),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class DSAlertWidget extends StatelessWidget {

  const DSAlertWidget(
    this.props, {super.key}
  );
  final DSAlertProps props;

  @override
  Widget build(BuildContext context) {
    DSAlertStyle alertStyle = DSAlertStyle(DSToken());

    return  Row(children: <Widget>[
      Box(
          mix: alertStyle.containerIcon,
          child: DSIconWidget(icon: alertStyle.getIconByType(props.type))),
      DSTextWidget(
        text: props.message,
        typographyStyle: DSTypographyStyleType.paragraph2,
        typographyColor: DSTypographyColorType.bright,
      ),
      const Spacer(),
      Pressable(
        onPressed: props.onPressed,
        child: Box(
          child: DSIconWidget(
            icon: DSIcons.close,
            size: DSIconSize.sm,
          ),
        ),
      )
    ]);
  }

}
