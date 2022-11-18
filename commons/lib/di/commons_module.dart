import 'package:commons/di/commons_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initCommonsGetIt'
)

@InjectableInit()
Future<void> configureCommonsDependencies(GetIt getIt, String environment) async =>
    $initCommonsGetIt(getIt, environment: environment);