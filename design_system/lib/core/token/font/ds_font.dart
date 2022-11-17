import '../color/color_token.dart';
import '../color/ds_color_token.dart';
import 'package:flutter/material.dart';
import 'font_token.dart';

class DSFont implements FontTokenBase {

  @override
  FontFamilyTokenBase family = DSFontFamily();

  @override
  FontSizeTokenBase size = DSFontSize();

  @override
  FontWeightTokenBase weight = DSFontWeight();

  @override
  ColorTokenBase color = DSColorToken();
}

class DSFontFamily implements FontFamilyTokenBase {

  DSFontFamily({
    String? base,
    String? highlight,
  }) {
    this.base = base ?? this.base;
    this.highlight = highlight ?? this.highlight;
  }

  @override
  String base = 'IBMPlexSans';

  @override
  String highlight = 'IBMPlexSans';
}


class DSFontSize implements FontSizeTokenBase {

  DSFontSize({
    double? us,
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
    double? ul,
  }) {
    us = us ?? this.us;
    xxxs = xxxs ?? this.xxxs;
    xxs = xxs ?? this.xxs;
    xs = xs ?? this.xs;
    sm = sm ?? this.sm;
    md = md ?? this.md;
    lg = lg ?? this.lg;
    xl = xl ?? this.xl;
    xxl = xxl ?? this.xxl;
    xxxl = xxxl ?? this.xxxl;
    ul = ul ?? this.ul;
  }

  @override
  double us = 12;

  @override
  double xxxs = 14;

  @override
  double xxs = 16;

  @override
  double xs = 20;

  @override
  double sm = 24;

  @override
  double md = 28;

  @override
  double lg = 40;

  @override
  double xl = 48;

  @override
  double xxl = 56;

  @override
  double xxxl = 64;

  @override
  double ul = 72;
}

class DSFontWeight implements FontWeightTokenBase {

  DSFontWeight({
    FontWeight? light,
    FontWeight? regular,
    FontWeight? medium,
    FontWeight? bold,
  }) {
    light = light ?? this.light;
    regular = regular ?? this.regular;
    medium = medium ?? this.medium;
    bold = bold ?? this.bold;
  }

  @override
  FontWeight light = FontWeight.w300;

  @override
  FontWeight regular = FontWeight.w400;

  @override
  FontWeight medium = FontWeight.w500;

  @override
  FontWeight bold = FontWeight.w600;
}
