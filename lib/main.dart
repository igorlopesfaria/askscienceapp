import 'dart:ui';

import 'package:ask_science/firebase_options.dart';
import 'package:design_system/components/bottomsheet/bottomsheet.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/medical_specialty/list/pages/loaded/medical_specialty_cell_widget.dart';
import 'package:feature/medical_specialty/list/pages/medical_specialty_list_page_widget.dart';
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
  runApp(const MedicalSpecialtyListPageWidget());
}

// class MyApp extends StatefulWidget {
//
//   const MyApp({super.key});
//
//
//   @override
//   State<StatefulWidget> createState() => _MyAppState();
// }
//
//
// class _MyAppState extends State<StatefulWidget> {
//
//   MedicalSpecialtyItemUIModel? uiModelSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: Row(
//               children: <Widget>[
//                 Expanded(
//                     child: ListView.separated(
//                         itemCount: list.length,
//                         controller: ScrollController(),
//                         itemBuilder: (BuildContext context, int index) {
//                           return MedicalSpecialtyCellWidget(
//                               uiModel: list[index],
//                               itemSelected: uiModelSelected,
//                               onItemSelected: newItemSelected
//                           );
//                         }, separatorBuilder: (_, __) => Divider(
//                       color: DSToken().color.light.two,
//                       indent: token.spacing.xs,
//                       endIndent: token.spacing.xs,
//                       height: token.divider.height.sm,
//                     )
//                     )
//                 )]
//           )
//           // medicalList(createMockList())
//
//         )
//     );
//     //return const MedicalSpecialtyListPageWidget();
//   }
//
//   void newItemSelected(MedicalSpecialtyItemUIModel newItemSelected) {
//     setState(() {
//       uiModelSelected = newItemSelected;
//     });
//   }
//
//   // void newItemSelected(MedicalSpecialtyItemUIModel uiModel) {
//   //   if(uiModelSelected != null){
//   //     print("antes ${uiModelSelected!.id}");
//   //   }
//   //   uiModelSelected = uiModel;
//   //   print("depois ${uiModelSelected!.id}");
//   //   // Navigator.pop(context);
//   // }
//
//   List<MedicalSpecialtyItemUIModel> get list =>[
//     const MedicalSpecialtyItemUIModel(id: 1, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 2, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 3, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 4, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 5, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 6, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 7, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 8, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 9, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 10, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 11, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 12, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 13, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 14, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 15, name: "Anestesiologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 16, name: "Alergologia", isSelected: false),
//     const MedicalSpecialtyItemUIModel(id: 17, name: "Anestesiologia", isSelected: false),
//   ];
// }
