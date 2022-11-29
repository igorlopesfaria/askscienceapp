import 'package:commons/di/commons_module.dart';
import 'package:data/di/data_module.dart';
import 'package:domain/di/domain_module.dart';
import 'package:feature/di/feature_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  GetIt getIt = GetIt.instance;
  String environment = Environment.dev;
  await configureFeatureDependencies(getIt, environment);
  await configureDomainDependencies(getIt, environment);
  await configureDataDependencies(getIt, environment);
  await configureCommonsDependencies(getIt, environment);
  $initGetIt(getIt, environment: environment);
}