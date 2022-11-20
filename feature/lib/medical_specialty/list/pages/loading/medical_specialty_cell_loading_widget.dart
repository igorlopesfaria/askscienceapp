import 'dart:math';

import 'package:design_system/core/token/token.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class MedicalSpecialtyCellLoadingWidget extends StatefulWidget {
  const MedicalSpecialtyCellLoadingWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyCellLoadingState();
}

class _MedicalSpecialtyCellLoadingState extends State<MedicalSpecialtyCellLoadingWidget> {
  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) =>
      Container(
         padding: EdgeInsets.all( token.spacing.xs),
      child: Row(children: [

  Shimmer.fromColors(
  baseColor: token.color.light.one,
  highlightColor: token.color.light.pure,
  child:  Container(
          height: 35.0,
          width: Random().nextInt(100) + 100.0 ,
          color: token.color.dark.pure,
        )),
        const Spacer(),
  Shimmer.fromColors(
  baseColor: token.color.light.one,
  highlightColor: token.color.light.pure,
  child:
  Container(
    width: 25.0,
    height: 25.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFe0f2f1)),
  )

    // Container(
  //         height: 25.0,
  //         width: 45.0,
  //         color: token.color.dark.three,
  //       )
  ),
      ])
  );
}
