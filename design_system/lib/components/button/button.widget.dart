import '../button/button.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class DSButtonWidget extends StatelessWidget {

  DSButtonWidget({
    super.key,
    required void Function()? onPressed,
    required String label,
    bool showLoading = false,
    DSButtonType type = DSButtonType.primary,
    DSButtonSize size = DSButtonSize.lg,
  }) : props = DSButtonProps(
    label: label,
    size: size,
    type: type,
    showLoading: showLoading,
    onPressed: onPressed
  );

  final DSButtonProps props;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = DSButtonStyle();

    return Pressable(
      onPressed: props.onPressed,
      child: Box(
        mix: buttonStyle.backgroundBox.withVariants([
          props.type.variant,
          props.size.variant
        ]).withMaybeVariant(props.onPressed == null ? disabled : null),
        child: VBox(
          mix: buttonStyle.vBox,
          children: [
            if (props.showLoading) ...[
              SizedBox(
                height: buttonStyle.loadingSize(props.size),
                width: buttonStyle.loadingSize(props.size),
                child: CircularProgressIndicator(
                    strokeWidth: buttonStyle.loadingStrokeSize(props.size),
                    color: buttonStyle.loadingStrokeColor(props.type),
                )
              )
            ] else ...[
              TextMix(
                mix: buttonStyle.text.withVariants(
                  [props.type.variant, props.size.variant],
                ).withMaybeVariant(
                  props.onPressed == null ? disabled : null,
                ),
                props.label,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
