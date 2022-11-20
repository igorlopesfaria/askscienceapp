import 'package:design_system/core/token/border/border_token.dart';
import 'package:design_system/core/token/border/ds_border_token.dart';
import 'package:design_system/core/token/color/color_token.dart';
import 'package:design_system/core/token/color/ds_color_token.dart';
import 'package:design_system/core/token/divider/divider.dart';
import 'package:design_system/core/token/divider/ds_divider.dart';
import 'package:design_system/core/token/font/ds_font.dart';
import 'package:design_system/core/token/font/font_token.dart';
import 'package:design_system/core/token/loading/ds_loading_token.dart';
import 'package:design_system/core/token/loading/loading_token.dart';
import 'package:design_system/core/token/radiobutton/ds_radiobutton_token.dart';
import 'package:design_system/core/token/radiobutton/radiobutton_token.dart';
import 'package:design_system/core/token/radius/ds_radius_token.dart';
import 'package:design_system/core/token/radius/radius_token.dart';
import 'package:design_system/core/token/space/ds_spacing_token.dart';
import 'package:design_system/core/token/space/spacing_token.dart';
import 'package:design_system/core/token/text/ds_text.dart';
import 'package:design_system/core/token/text/text.dart';
import 'package:design_system/core/token/textfield/ds_textfield.dart';
import 'package:design_system/core/token/textfield/textfield.dart';

class DSToken {
  SpacingTokenBase spacing = DSSpacingToken();
  TextBase text = DSText();
  TextFieldTokenBase textField = DSTextFieldToken();
  RadiusTokenBase radius = DSRadiusToken();
  RadioButtonTokenBase radioButton = DSRadioButtonToken();
  DividerTokenBase  divider = DSDividerToken();
  FontTokenBase font = DSFont();
  ColorTokenBase color = DSColorToken();
  LoadingTokenBase loading = DSLoadingToken();
  BorderTokenBase border = DSBorderToken();
}