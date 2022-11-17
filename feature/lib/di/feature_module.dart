import '../di/feature_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initFeatureGetIt'
)

@InjectableInit()
Future<void> configureFeatureListMedicalSpecialtyDependencies(GetIt getIt, String environment) async =>
    $initFeatureGetIt(getIt, environment: environment);