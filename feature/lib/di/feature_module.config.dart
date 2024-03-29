// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons/report/reporter.dart' as _i5;
import 'package:domain/medical_specialty/get_medical_specialty_list_filtered_use_case.dart'
    as _i7;
import 'package:domain/medical_specialty/get_medical_specialty_list_use_case.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../medical_specialty/list/bloc/medical_specialty_filter_list_cubit.dart'
    as _i6;
import '../medical_specialty/list/bloc/medical_specialty_list_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initFeatureGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.MedicalSpecialtyListCubit>(() => _i3.MedicalSpecialtyListCubit(
        getMedicalListUseCase: get<_i4.GetMedicalSpecialtyListUseCase>(),
        reporter: get<_i5.IReporter>(),
      ));
  gh.factory<_i6.MedicalSpecialtyListFilteredCubit>(
      () => _i6.MedicalSpecialtyListFilteredCubit(
            getMedicalListFilteredUseCase:
                get<_i7.GetMedicalSpecialtyListFilteredUseCase>(),
            reporter: get<_i5.IReporter>(),
          ));
  return get;
}
