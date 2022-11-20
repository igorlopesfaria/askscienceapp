import 'package:design_system/components/RadioButton/radiobutton.widget.dart';
import 'package:design_system/components/radiobutton/radiobutton.props.dart';
import 'package:design_system/components/text/text.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:flutter/material.dart';

class MedicalSpecialtyCellWidget extends StatefulWidget {
  const MedicalSpecialtyCellWidget({Key? key, required this.uiModel, required this.itemSelected, required this.onItemSelected}) : super(key: key);

  final MedicalSpecialtyItemUIModel uiModel;
  final MedicalSpecialtyItemUIModel? itemSelected;
  final Function onItemSelected;

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyCellState();
}


class _MedicalSpecialtyCellState extends State<MedicalSpecialtyCellWidget> {

  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed:(){
        if(widget.itemSelected == null || widget.uiModel.id != widget.itemSelected!.id){
          widget.onItemSelected(widget.uiModel);
        }
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(token.color.light.one),
      ),
      child:Row(
        children: [
          Padding(padding: EdgeInsets.only(left:token.spacing.xxs, top: token.spacing.lg)),
          DSTextWidget(
            text: widget.uiModel.name,
            typographyStyle: DSTypographyStyleType.paragraph1
          ),
          const Spacer(),
          DSRadioButton<int>(
              value: widget.uiModel.id,
              groupValue: widget.itemSelected?.id,
              size: DSRadioButtonSize.sm,
              toggleable: true,
              onChanged: (int? value) {
                if(widget.itemSelected == null || widget.uiModel.id != widget.itemSelected!.id){
                  widget.onItemSelected(widget.uiModel);
                }
              }),
          Padding(padding: EdgeInsets.only(left:token.spacing.xxs, top: token.spacing.lg)),
        ]
      )
  );
}