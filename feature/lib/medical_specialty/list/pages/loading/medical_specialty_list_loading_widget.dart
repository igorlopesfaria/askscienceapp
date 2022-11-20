import 'package:design_system/core/token/token.dart';
import 'package:feature/medical_specialty/list/pages/loading/medical_specialty_cell_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MedicalSpecialtyListLoading extends StatefulWidget {
  const MedicalSpecialtyListLoading({super.key});

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyListLoadingState();
}

class _MedicalSpecialtyListLoadingState
    extends State<MedicalSpecialtyListLoading> {
  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(token.spacing.xs),
              child: Shimmer.fromColors(
                baseColor: token.color.light.one,
                highlightColor: token.color.light.pure,
                child: Container(
                  height: 45.0,
                  color: token.color.dark.two,
                ),
              )),
          Flexible(
              child: ListView.separated(
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: ScrollController(),
                  separatorBuilder: (_, __) => Divider(
                        color: token.color.light.two,
                        indent: token.spacing.xs,
                        endIndent: token.spacing.xs,
                        height: token.divider.height.sm,
                      ),
                  itemBuilder: (BuildContext context, int index) =>
                      const MedicalSpecialtyCellLoadingWidget()))
        ]);
  }
}
