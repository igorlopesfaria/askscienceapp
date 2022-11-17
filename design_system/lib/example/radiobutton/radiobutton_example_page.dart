import 'package:design_system/components/RadioButton/radiobutton.widget.dart';
import 'package:design_system/core/token/token.dart';
import 'package:flutter/material.dart';

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  final DSToken token = DSToken();

  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DSRadioButton<int>(
                value: 0,
                groupValue: groupValue,
                label: 'Label 1',
                toggleable: true,
                onChanged: (int? value) {
                  setState(() {
                    groupValue = value;
                  });
                }),
            Padding(padding: EdgeInsets.only(top: token.spacing.sm)),
            DSRadioButton<int>(
                value: 1,
                groupValue: groupValue,
                label: 'Label 2',
                toggleable: true,
                onChanged: (int? value) {
                  setState(() {
                    groupValue = value;
                  });
                })
      ],
    ));
  }
}
