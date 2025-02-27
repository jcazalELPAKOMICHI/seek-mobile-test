// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/dashboard/data/repository/dashboard_repository.dart'
    as _i671;
import '../../features/dashboard/domain/repository/dashboard_repository.dart'
    as _i275;
import '../../features/dashboard/domain/use_case/dashboard_use_case.dart'
    as _i359;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i275.DashboardRepository>(() => _i671.DashboardRepositoryIml());
    gh.factory<_i359.DashboardUseCase>(
      () => _i359.DashboardUseCase(repository: gh<_i275.DashboardRepository>()),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(useCase: gh<_i359.DashboardUseCase>()),
    );
    return this;
  }
}
