import '../../components/text/text.props.dart';
import '../../components/text/text.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Design System")
          ),
          body: Column(
            children: [
              DSTextWidget(
                typographyStyle: DSTypographyStyleType.heading1,
                text: "heading1"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.heading2,
                  text: "heading2"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.heading3,
                  text: "heading3"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.heading4,
                  text: "heading4"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.heading5,
                  text: "heading5"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.heading6,
                  text: "heading6"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.paragraph1,
                  text: "heading6"
              ),
              const Spacer(),

              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.paragraph1,
                  text: "paragraphy1"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.paragraph2,
                  text: "paragraphy2"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.label,
                  text: "label"
              ),
              const Spacer(),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.label,
                  typographyColor: DSTypographyColorType.error,
                  text: "label"
              ),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.label,
                  typographyColor: DSTypographyColorType.success,
                  text: "label"
              ),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.label,
                  typographyColor: DSTypographyColorType.muted,
                  text: "label"
              ),
              DSTextWidget(
                  typographyStyle: DSTypographyStyleType.label,
                  typographyColor: DSTypographyColorType.warning,
                  text: "label"
              ),

              const Spacer(),
            ],
        )
      )
    );
  }
}
