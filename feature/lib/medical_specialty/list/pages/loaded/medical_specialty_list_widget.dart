import 'package:commons/di/commons_module.dart';
import 'package:design_system/components/feedback/feedback.dart';
import 'package:design_system/components/textfield/textfield.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/medical_specialty/list/bloc/medical_specialty_filter_list_cubit.dart';
import 'package:feature/medical_specialty/list/model/medical_specialty_ui_model.dart';
import 'package:feature/medical_specialty/list/pages/loaded/medical_specialty_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalSpecialtyListWidget extends StatefulWidget {
  const MedicalSpecialtyListWidget(
      {super.key, required this.listMedicalSpecialty});

  final List<MedicalSpecialtyItemUIModel> listMedicalSpecialty;

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyListState();
}

class _MedicalSpecialtyListState extends State<MedicalSpecialtyListWidget> {
  MedicalSpecialtyItemUIModel? uiModelSelected;

  TextEditingController textEditingController = TextEditingController();
  bool showSuffix = false;
  DSToken token = DSToken();

  late BuildContext providerContext;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:EdgeInsets.all(token.spacing.xs),
            child: DSTextFieldWidget(
              hint: "Pesquisar",
              size: DSTextFieldSize.sm,
              onTextChanged: cleanOrFilterByText,
              textEditingController: textEditingController,
              showSuffixIcon: showSuffix,
            ),
          ),
          buildProvider(context)
        ]);
  }
  Widget buildProvider(BuildContext context) => BlocProvider<MedicalSpecialtyListFilteredCubit>(
    create: (_) => getIt<MedicalSpecialtyListFilteredCubit>(),
    child: BlocBuilder<MedicalSpecialtyListFilteredCubit, MedicalSpecialtyListFilteredState>(
      builder: (context, state) {
        providerContext = context;
        if (state is MedicalSpecialtyListFilteredEmptyState) {
          return _emptyState(state);
        } else if (state is MedicalSpecialtyListFilteredErrorState) {
          return _errorState(context, state);
        } else if (state is MedicalSpecialtyListFilteredLoadedState) {
          return _loadedState(state.listFilteredMedicalSpecialty);
        } else {

          return _loadedState(widget.listMedicalSpecialty);
        }
      },
    ),
  );

  Widget _loadedState(List<MedicalSpecialtyItemUIModel> list) => Flexible(child: ListView.separated(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (BuildContext context, int index) {
        return MedicalSpecialtyCellWidget(
            uiModel: list[index],
            itemSelected: uiModelSelected,
            onItemSelected: newItemSelected);
      },
      separatorBuilder: (_, __) => Divider(
        color: token.color.light.two,
        indent: token.spacing.xs,
        endIndent: token.spacing.xs,
        height: token.divider.height.sm,
      )));

  Widget _errorState(
      BuildContext context, MedicalSpecialtyListFilteredErrorState state) =>
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top: token.spacing.md)),
          DSFeedbackWidget(
            title: state.feedbackErrorUIModel.title,
            description: state.feedbackErrorUIModel.description,
            type: DSFeedbackType.error,
          )
        ],
      );

  Widget _emptyState(MedicalSpecialtyListFilteredEmptyState state) => Column(
    children: [
      Padding(padding: EdgeInsets.only(top: token.spacing.md)),
      DSFeedbackWidget(
          title: state.feedbackEmptyUIModel.title,
          description: state.feedbackEmptyUIModel.description,
          type: DSFeedbackType.empty,
          buttonText: state.feedbackEmptyUIModel.buttonText,
          onButtonPressed: ()  {
            providerContext.read<MedicalSpecialtyListFilteredCubit>()
                .cleanFilter();
            setState(() {
              textEditingController.clear();
              showSuffix = false;
            });
         },
      )
    ],
  );

  void cleanOrFilterByText(String textFilter) {

    if(textFilter.length > 3) {
      providerContext.read<MedicalSpecialtyListFilteredCubit>()
          .getMedicalSpecialtyListFiltered(
          textFilter, widget.listMedicalSpecialty);
    } else {
      providerContext.read<MedicalSpecialtyListFilteredCubit>()
          .cleanFilter();
      }
    if(textFilter == "") {
      setState(() {
        textEditingController.clear();
        showSuffix = false;
      });
    } else {
      setState(() {
        showSuffix = true;
      });
    }
  }

  void newItemSelected(MedicalSpecialtyItemUIModel newItemSelected) {
    setState(() {
      uiModelSelected = newItemSelected;
    });
  }
}
