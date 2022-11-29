// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:commons/report/reporter.dart' as _i5;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../credential/credentials_repository.dart' as _i7;
import '../credential/data_source/credential_api_data_source.dart' as _i3;
import '../credential/data_source/credential_local_data_source.dart' as _i6;
import '../medical_specialty/data_source/medical_specialty_api_data_source.dart'
    as _i8;
import '../medical_specialty/medical_specialty_repository.dart' as _i9;
import '../terms/data_source/terms_api_data_source.dart' as _i10;
import '../terms/terms_repository.dart' as _i11;
import '../user/data_source/user_api_data_source.dart' as _i12;
import '../user/data_source/user_local_data_source.dart' as _i13;
import '../user/user_repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.ICredentialApiDataSource>(() => _i3.CredentialApiDataSource(
        get<_i4.Dio>(),
        get<_i5.IReporter>(),
      ));
  gh.factory<_i6.ICredentialLocalDataSource>(
      () => _i6.CredentialLocalDataSource(get<_i5.IReporter>()));
  gh.factory<_i7.ICredentialRepository>(() => _i7.CredentialRepository(
        get<_i3.ICredentialApiDataSource>(),
        get<_i6.ICredentialLocalDataSource>(),
      ));
  gh.factory<_i8.IMedicalSpecialtyApiDataSource>(
      () => _i8.MedicalSpecialtyApiDataSource(
            get<_i4.Dio>(),
            get<_i5.IReporter>(),
          ));
  gh.factory<_i9.IMedicalSpecialtyRepository>(() =>
      _i9.MedicalSpecialtyRepository(
          get<_i8.IMedicalSpecialtyApiDataSource>()));
  gh.factory<_i10.ITermsApiDataSource>(() => _i10.TermsApiDataSource(
        get<_i4.Dio>(),
        get<_i5.IReporter>(),
      ));
  gh.factory<_i11.ITermsRepository>(
      () => _i11.TermsRepository(get<_i10.ITermsApiDataSource>()));
  gh.factory<_i12.IUserApiDataSource>(() => _i12.UserApiDataSource(
        get<_i4.Dio>(),
        get<_i5.IReporter>(),
      ));
  gh.factory<_i13.IUserLocalDataSource>(
      () => _i13.UserLocalDataSource(get<_i5.IReporter>()));
  gh.factory<_i14.IUserRepository>(() => _i14.UserRepository(
        get<_i12.IUserApiDataSource>(),
        get<_i13.IUserLocalDataSource>(),
      ));
  return get;
}
