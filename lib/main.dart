import 'dart:ui';

import 'package:ask_science/firebase_options.dart';
import 'package:feature/medical_specialty/list/pages/loaded/medical_specialty_cell_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';

import '../di/injection.dart';

void main() async {
  await configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if(!kDebugMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: createList([
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 3, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
            const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
          ])

        )
    );
    //return const MedicalSpecialtyListPageWidget();
  }

  int idSelected = 10;
  Widget createList(List<MedicalSpecialtyItemUIModel> list) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: <Widget>[
      Expanded(
        child: ListView.separated(
          itemCount: list.length,
          controller: ScrollController(),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (BuildContext context, int index) {
            return MedicalSpecialtyCellWidget(uiModel: list[index], idSelected: idSelected);
          },
        )
      )]
    )
  );

}
