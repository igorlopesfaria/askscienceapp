import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../../core/token/token.dart';
import '../radiobutton/radiobutton.props.dart';
import '../radiobutton/radiobutton.style.dart';
import '../text/text.props.dart';
import '../text/text.widget.dart';

class DSRadioButton<T> extends StatelessWidget {
  DSRadioButton({
    super.key,
    required T value,
    required T? groupValue,
    ValueChanged<T?>? onChanged,
    String label = '',
    final bool toggleable = false,
  })  : props = DSRadioButtonProps<T>(
    value: value,
    onChanged: onChanged,
    label: label,
    groupValue: groupValue,
    toggleable: toggleable,
  );

  DSRadioButtonProps<T> props;
  DSToken token = DSToken();

  bool get toggleable => props.toggleable;

  Mix<Attribute> _applyVariants(Mix<Attribute> mix) {
    return mix.withVariant(props.selected ? active : inactive)
      .withMaybeVariant(props.onChanged == null ? disabled : null);
  }

  Mix<Attribute> labelPaddingMix(DSRadioButtonStyle style) {
    if (props.label.isNotEmpty) {
      return style.labelPadding;
    }
    return Mix.constant;
  }

  void _onPressed() {
    switch (props.selected) {
      case false:
        _handleChanged(true);
        break;
      case true:
        _handleChanged(toggleable ? null : false);
        break;
    }
  }

  void _handleChanged(bool? selected) {
    if (selected == null) {
      props.onChanged?.call(null);
      return;
    }
    if (selected) {
      props.onChanged?.call(props.value);
    }
  }


  @override
  Widget build(BuildContext context) {
    final styleRadioButton = DSRadioButtonStyle(token);

    return Pressable(
      onPressed: () => {
        _onPressed()
      },
      child: Box(
        child: HBox(
          mix: styleRadioButton.hBox,
          children: [
            Box(
              mix: _applyVariants(styleRadioButton.base),
              child: Box(
                mix: _applyVariants(styleRadioButton.circle),
              ),
            ),
            if (props.label.isNotEmpty)
              Box(
                mix: labelPaddingMix(styleRadioButton),
                child: DSTextWidget(
                  text: props.label,
                  typographyStyle: DSTypographyStyleType.paragraph1,
                  typographyColor: DSTypographyColorType.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
