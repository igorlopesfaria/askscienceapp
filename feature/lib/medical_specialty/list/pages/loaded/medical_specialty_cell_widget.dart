import 'package:design_system/components/RadioButton/radiobutton.widget.dart';
import 'package:design_system/components/text/text.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:flutter/widgets.dart';

class MedicalSpecialtyCellWidget extends StatefulWidget {
  const MedicalSpecialtyCellWidget({Key? key, required this.uiModel, required this.idSelected}) : super(key: key);

  final MedicalSpecialtyItemUIModel uiModel;
  final int idSelected;

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyCellState();
}


class _MedicalSpecialtyCellState extends State<MedicalSpecialtyCellWidget> {

  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(token.spacing.xs),
    child: Row(
      children: [
        DSTextWidget(
          text: widget.uiModel.name,
          typographyStyle: DSTypographyStyleType.paragraph1
        ),
        const Spacer(),
        DSRadioButton<int>(
            value: widget.uiModel.id,
            groupValue: widget.idSelected,
            toggleable: false,
            onChanged: (int? value) {
            })
      ]
    )
  );
}