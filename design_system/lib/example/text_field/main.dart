import '../../components/textfield/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Design System")
          ),
          body: Column(
            children: [
              DSTextFieldWidget(
                hint:"Placeholder",
                label: "Label",
                feedbackText: "Text Error",
                feedbackType: DSTextFieldFeedbackType.error,
              ),
              const Spacer(),
              DSTextFieldWidget(
                hint:"Placeholder",
                label: "Label",
                feedbackText: "Text Success",
                feedbackType: DSTextFieldFeedbackType.success,
              ),
              const Spacer(),
              DSTextFieldWidget(
                hint:"Placeholder",
                label: "Label"
              ),
              const Spacer(),
              DSTextFieldWidget(
                  hint:"Placeholder"
              ),
              const Spacer(),
            ],
        )
      )
    );
  }
}
