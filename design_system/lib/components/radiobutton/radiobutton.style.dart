
import 'package:design_system/core/token/token.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class DSRadioButtonStyle {
  DSRadioButtonStyle(this.token);

  final DSToken token;

  late final animation = animated(duration: 200, curve: Curves.fastOutSlowIn);

  late final labelPadding = Mix(paddingLeft(token.spacing.xs));

  late final circle = Mix(
    animation,
    rounded(token.border.radius.circular),
    height(0),
    width(0),
  );

  late final base = Mix(
    animation,
    rounded(token.border.radius.circular),
    height(24),
    width(24),
    align(Alignment.center),
    inactive(
      border(
        color: token.color.light.two,
        width: token.border.size.thick,
      ),
      bgColor(token.color.light.pure),
    ),
    active(
      border(
        color: token.color.primary.normal,
        width: token.border.size.radio,
      ),
      bgColor(token.color.light.pure),
    ),
  );

  late final hBox = Mix(mainAxisSize(MainAxisSize.min));

}