import 'package:design_system/components/icon/icon.dart';
import 'package:design_system/components/text/text.dart';
import 'package:design_system/core/token/token.dart';
import 'package:feature/di/feature_module.dart';
import 'package:feature/medical_specialty/list/bloc/medical_specialty_list_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalSpecialtyListPageWidget extends StatefulWidget {
  const MedicalSpecialtyListPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicalSpecialtyListPageState();
}


class _MedicalSpecialtyListPageState extends State<MedicalSpecialtyListPageWidget> {
  
  DSToken token = DSToken();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: token.color.light.pure,
          appBar: AppBar(
              leading: IconButton(
                icon: DSIconWidget(icon:  DSIcons.chevronLeftPrimary,) ,
                onPressed: () => Navigator.of(context).pop()
              ),
              backgroundColor: token.color.light.pure,
              title: DSTextWidget(
                text: "Especialidades Médicas",
                typographyStyle: DSTypographyStyleType.paragraph1,
              ),
              elevation: 0,
              centerTitle: true),
          body: Center(
            child: BlocProvider<MedicalSpecialtyListCubit>(
              create: (context) => getIt<MedicalSpecialtyListCubit>(),
              child: BlocBuilder<MedicalSpecialtyListCubit, MedicalSpecialtyListState>(
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

  Widget _loadingState() => const Text("Loading"); //const MedicalSpecialtyLoadingPage();

  Widget _loadedState(BuildContext context, MedicalSpecialtyListLoadedState state) => const Text("Loaded");
      // MedicalSpecialtyLoadedWidget(orders: state.orders);

  Widget _errorState(BuildContext context, MedicalSpecialtyListErrorState state) => const Text("Error");
      // MedicalSpecialtyFeedbackWidget(
      //     MedicalSpecialtyFeedback: state.feedbackUIModel,
      //     iconClick: () {
      //       context.read<MedicalSpecialtyListCubit>().getMedicalSpecialtyList();
      //     });

  Widget _emptyState(MedicalSpecialtyListEmptyState state) => const Text("Loading");
      // MedicalSpecialtyFeedbackWidget(
      //   MedicalSpecialtyFeedback: state.feedbackUIModel,
      //   buttonClick: () {
      //   tmpGoWatchlistFunction();
      // });

  void tmpGoWatchlistFunction() {
    if (kDebugMode) {
      print('Go to Watchlist called.');
    }
  }
}

