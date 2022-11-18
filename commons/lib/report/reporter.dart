import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

abstract class IReporter {
  Future<void> recordCustomError(dynamic exception, StackTrace? stack, String reason);
}

@Injectable(as: IReporter)
class Reporter implements IReporter{

  @override
  Future<void> recordCustomError(dynamic exception, StackTrace? stack, String reason) async {
    FirebaseCrashlytics.instance.recordError(
      exception,
      stack,
      reason: reason,
    );
  }
}