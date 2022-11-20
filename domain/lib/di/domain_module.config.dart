// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/medical_specialty/medical_specialty_repository.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../medical_specialty/get_medical_specialty_list_filtered_use_case.dart'
    as _i3;
import '../medical_specialty/get_medical_specialty_list_use_case.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.GetMedicalSpecialtyListFilteredUseCase>(
      () => _i3.GetMedicalSpecialtyListFilteredUseCase());
  gh.factory<_i4.GetMedicalSpecialtyListUseCase>(() =>
      _i4.GetMedicalSpecialtyListUseCase(
          get<_i5.IMedicalSpecialtyRepository>()));
  return get;
}
