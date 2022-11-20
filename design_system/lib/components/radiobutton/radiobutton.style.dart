
import 'dart:ffi';

import 'package:design_system/components/radiobutton/radiobutton.props.dart';
import 'package:design_system/core/token/token.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import '../variants.dart' as ds_variants;

class DSRadioButtonStyle {
  DSRadioButtonStyle(this.token);

  final DSToken token;

  late final animation = animated(duration: 200, curve: Curves.fastOutSlowIn);

  late final labelPadding = Mix(paddingLeft(token.spacing.xs));

  late final circle = Mix(
    animation,
    rounded(token.border.radius.pill),
    height(0),
    width(0),
  );

  late final base = Mix(
    animation,
    rounded(token.border.radius.pill),
    align(Alignment.center),
    ds_variants.large(
      height(token.radioButton.size.lg),
      width(token.radioButton.size.lg),
    ),
    ds_variants.medium(
      height(token.radioButton.size.md),
      width(token.radioButton.size.md),
    ),
    ds_variants.small(
      height(token.radioButton.size.sm),
      width(token.radioButton.size.sm),
    ),
    inactive(
      border(
        color: token.color.light.two,
        width: token.border.size.thick,
      ),
      bgColor(token.color.light.pure),
    ),
    (active & ds_variants.large)(
      active(
        border(
          color: token.color.primary.normal,
          width: token.radioButton.border.lg,
        ),
        bgColor(token.color.light.pure),
      ),
    ),
    (active & ds_variants.medium)(
      active(
        border(
          color: token.color.primary.normal,
          width: token.radioButton.border.md,
        ),
        bgColor(token.color.light.pure),
      ),
    ),
    (active & ds_variants.small)(
      active(
        border(
          color: token.color.primary.normal,
          width: token.radioButton.border.sm,
        ),
        bgColor(token.color.light.pure),
      ),
    ),

  );

  late final hBox = Mix(mainAxisSize(MainAxisSize.min));
}