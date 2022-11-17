import '../../components/bottomsheet/bottomsheet.dart';
import '../../components/dialog/dialog.widget.dart';
import 'package:flutter/material.dart';
import '../../../components/button/button.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.lg,
                onPressed: openDialog,
                label: "Abrir Bottomsheet"),
      ],
    ));
  }

  Widget get dialogConfirmation => DSDialogWidget(
        title: "Título",
        description: "Descrição",
        primaryButtonText: "Botão 1",
        secondaryButtonText: "Botão 2",
        onPrimaryPressed: () => {},
        onSecondaryPressed: () => {},
        showLoading: false,
      );

  openDialog() => showDSBottomSheet(context, dialogConfirmation);
// const Text('Modal bottom sheet', style: TextStyle(fontSize: 30)));
}
