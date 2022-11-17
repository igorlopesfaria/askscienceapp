
import 'dart:ui';

import 'package:design_system/components/icon/icon.dart';

import '../../core/token/token.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

class DSCheckboxStyle {

  DSCheckboxStyle(this.token);

  final DSToken token;


  late final labelPadding = Mix(
    paddingLeft(token.spacing.xxs)
  );
  late final animation = animated(duration: 150, curve: Curves.linear);

  late final base = Mix(
    rounded(token.radius.sm),
    animation,
    height(28),
    width(28),
    align(Alignment.center),

    active(
        border(
          color: token.color.primary.normal,
          width: token.border.size.thick,
        ),
        bgColor(token.color.light.pure),
    ),
    inactive(
      border(
        color: token.color.light.two,
        width: token.border.size.thick,
      ),
      bgColor(token.color.light.pure),
    )
  );
  
  Color iconColor(bool activated, bool disabled) {
    if (disabled && activated) {
      return token.color.dark.two;
    }
    if (activated) {
      return token.color.primary.normal;
    }

    return token.color.transparent;
  }

  late final hBox = Mix(mainAxisSize(MainAxisSize.min));

  DSIcons getIconByValue(bool activated) {
    if(activated) {
      return DSIcons.dragHandle;
    } else {
      return DSIcons.empty;
    }

  }


}