import 'package:design_system/components/icon/icon.dart';
import 'package:design_system/components/text/text.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/di/feature_module.dart';
import 'package:feature/medical_specialty/list/bloc/medical_specialty_list_cubit.dart';
import 'package:design_system/components/feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalSpecialtyListPageWidget extends StatefulWidget {
  const MedicalSpecialtyListPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyListPageState();
}


class _MedicalSpecialtyListPageState
    extends State<MedicalSpecialtyListPageWidget> {

  DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
          foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle( //<-- SEE HERE
            // Status bar color
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: Scaffold(
          backgroundColor: token.color.light.pure,
          appBar: AppBar(
              primary: true, //<-- For iOS SEE HERE (dark icons)
              leading: IconButton(
                  icon: DSIconWidget(icon: DSIcons.chevronLeftPrimary),
                  onPressed: () => Navigator.of(context).pop()
              ),
              backgroundColor: token.color.light.pure,
              title: DSTextWidget(
                text: "Especialidade",
                typographyStyle: DSTypographyStyleType.heading6,
                typographyColor: DSTypographyColorType.accent,
              ),
              elevation: 0,
              centerTitle: true),
          body: Center(
            child: BlocProvider<MedicalSpecialtyListCubit>(
              create: (context) => getIt<MedicalSpecialtyListCubit>(),
              child: BlocBuilder<
                  MedicalSpecialtyListCubit,
                  MedicalSpecialtyListState>(
                builder: (context, state) {
                  if (state is MedicalSpecialtyListLoadedState) {
                    return _loadedState(context, state);
                  } else if (state is MedicalSpecialtyListEmptyState) {
                    return _emptyState(state);
                  } else if (state is MedicalSpecialtyListErrorState) {
                    return _errorState(context, state);
                  } else {
                    return _loadingState();
                  }
                },
              ),
            ),
          )),
    );
  }

  Widget _loadingState() =>
      const Text("Loading"); //const MedicalSpecialtyLoadingPage();

  Widget _loadedState(BuildContext context,
      MedicalSpecialtyListLoadedState state) => const Text("Loaded");

  // MedicalSpecialtyLoadedWidget(orders: state.orders);

  Widget _errorState(BuildContext context,
      MedicalSpecialtyListErrorState state) =>
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top: token.spacing.md)),
          DSFeedbackWidget(
              title: state.feedbackErrorUIModel.title,
              description: state.feedbackErrorUIModel.description,
              type: DSFeedbackType.reload,
              onIconPressed: () {
                context.read<MedicalSpecialtyListCubit>()
                    .getMedicalSpecialtyList();
              }
          )
        ],
      );

  Widget _emptyState(MedicalSpecialtyListEmptyState state) =>
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top: token.spacing.md)),
          DSFeedbackWidget(
              title: state.feedbackEmptyUIModel.title,
              description: state.feedbackEmptyUIModel.description,
              type: DSFeedbackType.empty,
              onIconPressed: () {
                context.read<MedicalSpecialtyListCubit>()
                    .getMedicalSpecialtyList();
              }
          )
        ],
      );
}

