import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object?> get props => const [];
}

class StockInitialized extends StockEvent {
  const StockInitialized();
}

class StockRefreshRequested extends StockEvent {
  const StockRefreshRequested();
}

class StockLoadMoreRequested extends StockEvent {
  const StockLoadMoreRequested();
}

class StockSearchChanged extends StockEvent {
  const StockSearchChanged(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}

class StockComplianceChanged extends StockEvent {
  const StockComplianceChanged(this.compliance);

  final bool? compliance;

  @override
  List<Object?> get props => <Object?>[compliance];
}

class StockCountryChanged extends StockEvent {
  const StockCountryChanged(this.countryCode);

  final String? countryCode;

  @override
  List<Object?> get props => <Object?>[countryCode];
}
