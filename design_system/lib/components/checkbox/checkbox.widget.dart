import '../icon/icon.dart';
import '../text/text.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import '../../core/token/token.dart';
import '../checkbox/checkbox.props.dart';
import '../checkbox/checkbox.style.dart';

class DSCheckbox extends StatelessWidget {
  DSCheckbox({
    super.key,
    required bool value,
    required ValueChanged<bool> onChanged,
    String label = '',
  }) : props = DSCheckboxProps(
      value: value,
      onChanged: onChanged,
      label: label);

  final DSCheckboxProps props;

  void _onPressed() {
    props.onChanged.call(!props.value);
  }

  Mix<Attribute> _applyVariants(Mix<Attribute> mix) {
    return mix
        .withVariant(props.value ? active : inactive);
  }

  @override
  Widget build(BuildContext context) {
    final styleCheckbox = DSCheckboxStyle(DSToken());

    return Pressable(
        onPressed: () => {
          _onPressed()
        },
        child: HBox(mix: styleCheckbox.hBox, children: [
          Box(
            mix: _applyVariants(styleCheckbox.base),
            child:
            DSIconWidget(
              icon: styleCheckbox.getIconByValue(props.value),
            ),
          ),
          Box(
            mix: styleCheckbox.labelPadding,
            child: DSTextWidget(
              text: props.label,
              typographyStyle: DSTypographyStyleType.paragraph2,
              typographyColor: DSTypographyColorType.secondary,
            ),
          ),
        ]));
  }
}
