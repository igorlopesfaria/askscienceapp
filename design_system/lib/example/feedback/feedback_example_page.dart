import '../../core/token/token.dart';
import '../../components/bottomsheet/bottomsheet.dart';
import '../../components/feedback/feedback.dart';
import '../../../components/button/button.dart';
import 'package:flutter/material.dart';

class FeedbackExample extends StatefulWidget {
  const FeedbackExample({super.key});

  @override
  State<FeedbackExample> createState() => _FeedbackExampleState();
}

class _FeedbackExampleState extends State<FeedbackExample> {

  final DSToken token = DSToken();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DSFeedbackWidget(
              title: "Título do Feedback MD ",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra ligula quis dolor laoreet consequat. Proin molestie, metus quis rhoncus pharetra, quam augue",
              buttonText: "Botão 1",
                type: DSFeedbackType.success,
                onButtonPressed: () => {}
            ),
            DSFeedbackWidget(
                title: "Título do Feedback SM",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Su pharetra ligula quis dolor laoreet consequat. Proin molestie, metus quis rhoncus pharetra, quam augue",
                buttonText: "Botão 1",
                type: DSFeedbackType.reload,
                size: DSFeedbackSize.sm,
                onButtonPressed: () => {}
            ),
            DSButtonWidget(
               type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: openDialogMD,
                label: "Abrir Bottomsheet"),
            Padding(padding: EdgeInsets.only(top: token.spacing.sm)),
            DSButtonWidget(
                type: DSButtonType.primary,
                size: DSButtonSize.md,
                onPressed: openDialogSM,
                label: "Abrir Bottomsheet"),
          ],
    ));
  }

  Widget get feedbackErrorDialog => DSFeedbackWidget(
      title: "Título do Feedback MD",
    type: DSFeedbackType.await,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra ligula quis dolor laoreet consequat. Proin molestie, metus quis rhoncus pharetra, quam augue",

  );

  Widget get feedbackSuccessDialog => DSFeedbackWidget(
      title: "Título do Feedback SM",
      type: DSFeedbackType.email,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra ligula quis dolor laoreet consequat. Proin molestie, metus quis rhoncus pharetra, quam augue",
      size: DSFeedbackSize.sm
  );


  openDialogMD() => showDSBottomSheet(context, feedbackErrorDialog);

  openDialogSM() => showDSBottomSheet(context, feedbackSuccessDialog);

}
