import 'package:flutter/material.dart';

import '../../components/Checkbox/Checkbox.dart';
import '../../components/button/button.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool checkBox4Activated = false;
  bool checkBox3Activated = false;
  bool checkBox2Activated = false;
  bool checkBox1Activated = false;


  @override
  Widget build(BuildContext context) {

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DSCheckbox(value: checkBox1Activated, onChanged: (bool value) {
              setState(() {
                checkBox1Activated = value;
              });
            }),
            const Spacer(),
            DSCheckbox(value: checkBox2Activated, label: "Teste", onChanged: (bool value) {
              setState(() {
                checkBox2Activated = value;
              });
            }),
            const Spacer(),
            DSCheckbox(value: checkBox3Activated, onChanged: (bool value) {
              setState(() {
                checkBox3Activated = value;
              });
            }),
            const Spacer(),
            DSCheckbox(value: checkBox4Activated, label: "Teste", onChanged: (bool value) {
              setState(() {
                checkBox4Activated = value;
              });
            })
          ],
    ));
  }
}
