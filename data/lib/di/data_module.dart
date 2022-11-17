import 'package:data/di/data_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initDataGetIt'
)

@InjectableInit()
Future<void> configureDataDependencies(GetIt getIt, String environment) async =>
    $initDataGetIt(getIt, environment: environment);