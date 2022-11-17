
class DSDialogProps {

  DSDialogProps({
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
    this.showLoading = false
  });

  final String title;
  final String description;
  final String primaryButtonText;
  final String secondaryButtonText;
  final void Function()? onPrimaryPressed;
  final void Function()? onSecondaryPressed;
  final bool showLoading;
}