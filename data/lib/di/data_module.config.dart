// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../medical_specialty/data_source/medical_specialty_data_source.dart'
    as _i3;
import '../medical_specialty/medical_specialty_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.MedicalSpecialtyDataSource>(
      () => _i3.MedicalSpecialtyDataSource(get<_i4.Dio>()));
  gh.factory<_i5.MedicalSpecialtyRepository>(() =>
      _i5.MedicalSpecialtyRepository(get<_i3.MedicalSpecialtyDataSource>()));
  return get;
}
