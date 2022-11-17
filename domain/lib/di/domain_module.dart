
import 'package:domain/di/domain_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initDomainGetIt'
)

@InjectableInit()
Future<void> configureDomainDependencies(GetIt getIt, String environment) async =>
    $initDomainGetIt(getIt, environment: environment);