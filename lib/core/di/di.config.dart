// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stock_investment_app/stocks/data/stock_data.dart' as _i207;
import 'package:stock_investment_app/stocks/data/stock_repository.dart'
    as _i663;
import 'package:stock_investment_app/stocks/presentation/state/stock_cubit.dart'
    as _i818;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i207.StockData>(() => const _i207.StockData());
    gh.singleton<_i663.StockRepository>(
      () => _i663.StockRepository(gh<_i207.StockData>()),
    );
    gh.factory<_i818.StockCubit>(
      () => _i818.StockCubit(gh<_i663.StockRepository>()),
    );
    return this;
  }
}
