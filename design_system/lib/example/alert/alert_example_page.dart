import 'package:flutter/material.dart';

import '../../components/alert/alert.dart';
import '../../components/button/button.dart';

class AlertExample extends StatefulWidget {
  const AlertExample({super.key});

  @override
  State<AlertExample> createState() => _AlertExampleState();
}

class _AlertExampleState extends State<AlertExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: () => {
                  DSAlertBuilder(
                    onPressed: () => {},
                    message: "Teste Message",
                    type: DSAlertType.error
                  ).show(context)
                },
                label: "Abrir Alert Error"),
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: () => {
                  DSAlertBuilder(
                      onPressed: () => {},
                      message: "Teste Message",
                      type: DSAlertType.success
                  ).show(context)
                },
                label: "Abrir Alert Success"),
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: () => {
                  DSAlertBuilder(
                      onPressed: () => {},
                      message: "Teste Message",
                      type: DSAlertType.warning
                  ).show(context)
                },
                label: "Abrir Alert Warning"),
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: () => {
                  DSAlertBuilder(
                      onPressed: () => {},
                      message: "Teste Message",
                      type: DSAlertType.info
                  ).show(context)
                },
                label: "Abrir Alert Info"),
          ],
    ));
  }

  // get alertError => DSAlert(
  //   type: DSAlertType.error,
  //   message: "Mensagem de Error",
  //   onPressed: ()  {
  //     Navigator.of(context).pop();
  //   }
  // );
}
