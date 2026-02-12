import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

@freezed
abstract class StockModel with _$StockModel {
  @JsonSerializable(explicitToJson: true)
  const factory StockModel({
    required int id,
    required String companyName,
    required String tradingSymbol,
    required String logo,
    required String currency,
    required bool shariahCheck,
    required DateTime analysisDate,
    required bool isCompliant,
    required PriceModel price,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) => _$StockModelFromJson(json);
}

@freezed
abstract class StockResponse with _$StockResponse {
  @JsonSerializable(explicitToJson: true)
  const factory StockResponse({
    required List<StockModel> data,
    required Meta meta,
  }) = _StockResponse;

  factory StockResponse.fromJson(Map<String, dynamic> json) => _$StockResponseFromJson(json);
}

@freezed
abstract class Meta with _$Meta {
  const factory Meta({
    required int count,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
abstract class PriceModel with _$PriceModel {
  const factory PriceModel({
    required double price,
    required double changePercent,
  }) = _PriceModel;

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);
}
