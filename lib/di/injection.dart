import 'package:data/di/data_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  GetIt getIt = GetIt.instance;
  String environment = Environment.dev;
  await configureDataDependencies(getIt, environment);
  $initGetIt(getIt, environment: environment);
}