import 'package:design_system/core/token/border/border_token.dart';
import 'package:design_system/core/token/border/ds_border_token.dart';
import 'package:flutter/material.dart';

import '../token/color/color_token.dart';
import '../token/color/ds_color_token.dart';
import '../token/font/ds_font.dart';
import '../token/font/font_token.dart';
import '../token/loading/ds_loading_token.dart';
import '../token/loading/loading_token.dart';
import '../token/radius/ds_radius_token.dart';
import '../token/radius/radius_token.dart';
import '../token/space/ds_spacing_token.dart';
import '../token/space/spacing_token.dart';
import '../token/text/ds_text.dart';
import '../token/text/text.dart';

class DSToken {
  SpacingTokenBase spacing = DSSpacingToken();
  TextBase text = DSText();
  RadiusTokenBase radius = DSRadiusToken();
  FontTokenBase font = DSFont();
  ColorTokenBase color = DSColorToken();
  LoadingTokenBase loading = DSLoadingToken();
  BorderTokenBase border = DSBorderToken();
}