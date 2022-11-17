import 'package:flutter/material.dart';

import '../../../components/button/button.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.sm,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.sm,
            onPressed: () => {},
            showLoading: true,
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.md,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.md,
            onPressed: () => {},
            showLoading: true,
            label: "Teste md"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.lg,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.primary,
            size: DSButtonSize.lg,
            showLoading: true,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.secondary,
            size: DSButtonSize.sm,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.secondary,
            size: DSButtonSize.md,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.secondary,
            size: DSButtonSize.lg,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.secondary,
            size: DSButtonSize.lg,
            showLoading: true,
            onPressed: () => {},
            label: "Teste"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.link,
            size: DSButtonSize.sm,
            onPressed: () => {},
            label: "Teste Link"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.link,
            size: DSButtonSize.md,
            onPressed: () => {},
            label: "Teste Link"),
        const Spacer(),
        DSButtonWidget(
            type: DSButtonType.link,
            size: DSButtonSize.lg,
            onPressed: () => {},
            label: "Teste Link"),
      ],
    );
  }
}
