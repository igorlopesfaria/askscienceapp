import '../../../core/token/color/color_token.dart';
import 'package:flutter/material.dart';

class FontTokenBase {
  FontTokenBase({
    required this.family,
    required this.size,
    required this.weight,
    required this.color
  });

  FontFamilyTokenBase family;
  FontSizeTokenBase size;
  FontWeightTokenBase weight;
  ColorTokenBase color;

}

class FontFamilyTokenBase {
  FontFamilyTokenBase({
    required this.base,
    required this.highlight,
  });

  String base;
  String highlight;
}

class FontSizeTokenBase {
  FontSizeTokenBase({
    required this.us,
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.ul,
  });

  double us;
  double xxxs;
  double xxs;
  double xs;
  double sm;
  double md;
  double lg;
  double xl;
  double xxl;
  double xxxl;
  double ul;
}

class FontWeightTokenBase {
  FontWeightTokenBase({
    required this.light,
    required this.regular,
    required this.medium,
    required this.bold,
  });

  FontWeight light;
  FontWeight regular;
  FontWeight medium;
  FontWeight bold;
}
