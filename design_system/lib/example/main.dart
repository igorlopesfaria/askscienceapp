import 'package:design_system/example/alert/alert_example_page.dart';
import 'package:design_system/example/bottomsheet/bottomsheet_example_page.dart';
import 'package:design_system/example/button/buton_bottomsheet_page.dart';
import 'package:design_system/example/checkbox/checkbox_example_page.dart';
import 'package:design_system/example/feedback/feedback_example_page.dart';
import 'package:design_system/example/radiobutton/radiobutton_example_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('TEST DESGIN SYSTEM')),
            body: const FeedbackExample()
        )
    );
  }
}

