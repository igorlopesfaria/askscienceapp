
import '../../core/token/token.dart';
import '../feedback/feedback.dart';
import '../button/button.dart';
import '../icon/icon.props.dart';
import '../text/text.dart';

class DSFeedbackStyle {

  DSFeedbackStyle();

  final DSToken token = DSToken();

  DSTypographyStyleType titleFont(DSFeedbackSize size) {
    switch(size){
      case DSFeedbackSize.sm:
        return DSTypographyStyleType.heading7;
      case DSFeedbackSize.md:
        return DSTypographyStyleType.heading6;
    }
  }

  DSTypographyStyleType descriptionFont(DSFeedbackSize size) {
    switch(size){
      case DSFeedbackSize.sm:
        return DSTypographyStyleType.label;
      case DSFeedbackSize.md:
        return DSTypographyStyleType.paragraph2;
    }
  }

  double spacingVerticalIconSize(DSFeedbackSize size) {
    switch(size){
      case DSFeedbackSize.sm:
        return token.spacing.xs;
      case DSFeedbackSize.md:
        return token.spacing.sm;
    }
  }

  double spacingVerticalSize(DSFeedbackSize size) {
    switch(size){
      case DSFeedbackSize.sm:
        return token.spacing.xxs;
      case DSFeedbackSize.md:
        return token.spacing.xs;
    }

  }

  DSButtonSize geButtonBySize(DSFeedbackSize size) {
      switch(size){
        case DSFeedbackSize.sm:
          return DSButtonSize.sm;
        case DSFeedbackSize.md:
          return DSButtonSize.md;
      }
  }
  DSIconSize getIconBySize(DSFeedbackSize size ) {
    switch(size){
      case DSFeedbackSize.sm:
        return DSIconSize.sm;
      case DSFeedbackSize.md:
        return DSIconSize.md;
    }
 }

  DSIcons getIconByType(DSFeedbackType type ) {
    switch(type){
      case DSFeedbackType.success:
        return DSIcons.success;
      case DSFeedbackType.error:
        return DSIcons.error;
      case DSFeedbackType.email:
        return DSIcons.email;
      case DSFeedbackType.warning:
        return DSIcons.warning;
      case DSFeedbackType.await:
        return DSIcons.await;
      case DSFeedbackType.info:
        return DSIcons.info;
      case DSFeedbackType.reload:
        return DSIcons.reload;
      case DSFeedbackType.empty:
        return DSIcons.emptySearch;
    }
  }
}

