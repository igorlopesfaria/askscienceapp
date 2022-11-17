
import 'dart:ui';

import '../alert/alert.props.dart';
import '../icon/icon.props.dart';
import '../../core/token/token.dart';
import 'package:mix/mix.dart';

class DSAlertStyle {

  DSAlertStyle(this.token);

  final DSToken token;


  Color getBgColorByType(DSAlertType type) {
    switch (type) {
      case DSAlertType.success:
        return token.color.feedback.success;
      case DSAlertType.error:
        return token.color.feedback.error;
      case DSAlertType.warning:
        return token.color.feedback.warning;
      case DSAlertType.info:
        return token.color.feedback.info;
    }
  }

  late final containerIcon = Mix(marginRight(token.spacing.xs));

  DSIcons getIconByType(DSAlertType type) {
    switch (type) {
      case DSAlertType.success:
        return DSIcons.checkCircle;
      case DSAlertType.error:
        return DSIcons.closeOctagon;
      case DSAlertType.warning:
        return DSIcons.alertTriangle;
      case DSAlertType.info:
        return DSIcons.information;
    }
  }


}