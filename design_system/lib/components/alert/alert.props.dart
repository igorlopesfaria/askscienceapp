import 'package:mix/mix.dart';
import '../variants.dart' as ds_variants;

class DSAlertProps {

  DSAlertProps({
    required this.message,
    required this.type,
    required this.onPressed
  });

  final String message;
  final DSAlertType type;
  final void Function()? onPressed;
}
enum DSAlertType {
  success,
  error,
  warning,
  info;

  Variant get variant {
    switch (this) {
      case success:
        return ds_variants.success;
      case error:
        return ds_variants.error;
      case warning:
        return ds_variants.warning;
      case info:
        return ds_variants.info;
    }
  }
}
