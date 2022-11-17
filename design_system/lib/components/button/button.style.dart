import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import '../button/button.props.dart';
import '../../core/token/token.dart';
import '../variants.dart' as ds_variants;

final _primary = DSButtonType.primary.variant;
final _secondary = DSButtonType.secondary.variant;
final _link = DSButtonType.link.variant;

class DSButtonStyle {

  DSButtonStyle();

  final DSToken token = DSToken();

  late final backgroundBox = _backgroundBoxAppearance.apply(_backgroundBoxSize);
  
  late final _backgroundBoxAppearance = Mix(
    textDirection(TextDirection.ltr),
    _primary(
      bgColor(token.color.primary.normal),
      rounded(token.radius.sm),
      textAlign(TextAlign.center),
    ),
    _secondary(
      bgColor(token.color.light.pure),
      rounded(token.radius.sm),
      textAlign(TextAlign.center),
      borderWidth(token.border.size.thick),
      borderColor(token.color.primary.normal),
    ),
    _link(
      bgColor(token.color.transparent),
      rounded(token.radius.sm),
      textAlign(TextAlign.center),
    ),
    (disabled & _primary)(
      bgColor(token.color.light.two),
    ),
    (disabled & _secondary)(
      bgColor(token.color.light.two),
    ),
    (press & _primary)(
      bgColor(token.color.primary.light),
    ),
    (press & _secondary)(
      bgColor(token.color.light.pure),
      borderColor(token.color.primary.light),
    ),
    (press & _link)(
      bgColor(token.color.transparent),
    )
  );

  late final _backgroundBoxSize = Mix(
    ds_variants.large(
        height(56),
        minWidth(180),
        paddingHorizontal(token.spacing.md)
    ),
    ds_variants.medium(
      height(44),
      minWidth(148),
      paddingHorizontal(token.spacing.sm),
    ),
    ds_variants.small(
      height(32),
      minWidth(102),
      paddingHorizontal(token.spacing.xs),
    ),
  );

  late final text = Mix(
    _primary(
      textStyle(TextStyle(
        fontFamily: token.font.family.base,
        color: token.color.light.pure,
        fontWeight: token.font.weight.medium,
      )),
    ),
    _secondary(
      textStyle(TextStyle(
          fontFamily: token.font.family.base,
          color: token.color.primary.normal,
          fontWeight: token.font.weight.medium
      )),
    ),
    _link(
      textStyle(TextStyle(
        fontFamily: token.font.family.base,
        color: token.color.primary.normal,
        fontWeight: token.font.weight.medium,
        decoration: TextDecoration.underline,
      )),
    ),
    (disabled & _primary)(
      textColor(token.color.dark.one),
    ),
    (disabled & _secondary)(
      textColor(token.color.dark.one),
    ),
    (press & _secondary)(
        textColor(token.color.primary.light)
    ),
    (press & _link)(
        textColor(token.color.primary.light)
    ),
    ds_variants.large(
      fontSize(token.font.size.xxs),
    ),
    ds_variants.medium(
      fontSize(token.font.size.xxxs),
    ),
    ds_variants.small(
      fontSize(token.font.size.us),
    ),
  );

  final vBox = Mix(
    mainAxis(MainAxisAlignment.center),
    crossAxis(CrossAxisAlignment.center),
  );

  double loadingSize(DSButtonSize size) {
    switch (size) {
      case DSButtonSize.sm:
        return token.loading.size.sm;
      case DSButtonSize.md:
        return token.loading.size.md;
      case DSButtonSize.lg:
        return token.loading.size.lg;
    }
  }

  double loadingStrokeSize(DSButtonSize size) {
    switch (size) {
      case DSButtonSize.sm:
        return token.loading.stroke.sm;
      case DSButtonSize.md:
        return token.loading.stroke.md;
      case DSButtonSize.lg:
        return token.loading.stroke.lg;
    }
  }

  Color? loadingStrokeColor(DSButtonType type) {
    switch (type) {
      case DSButtonType.primary:
        return token.color.light.pure;
      case DSButtonType.secondary:
        return token.color.primary.normal;
      case DSButtonType.link:
        return null;
    }
  }
}
