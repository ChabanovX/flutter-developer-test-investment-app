// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockModel _$StockModelFromJson(Map<String, dynamic> json) => _StockModel(
  id: (json['id'] as num).toInt(),
  companyName: json['companyName'] as String,
  tradingSymbol: json['tradingSymbol'] as String,
  logo: json['logo'] as String,
  currency: json['currency'] as String,
  shariahCheck: json['shariahCheck'] as bool,
  analysisDate: DateTime.parse(json['analysisDate'] as String),
  isCompliant: json['isCompliant'] as bool,
  price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StockModelToJson(_StockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'tradingSymbol': instance.tradingSymbol,
      'logo': instance.logo,
      'currency': instance.currency,
      'shariahCheck': instance.shariahCheck,
      'analysisDate': instance.analysisDate.toIso8601String(),
      'isCompliant': instance.isCompliant,
      'price': instance.price.toJson(),
    };

_StockResponse _$StockResponseFromJson(Map<String, dynamic> json) =>
    _StockResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => StockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StockResponseToJson(_StockResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_Meta _$MetaFromJson(Map<String, dynamic> json) =>
    _Meta(count: (json['count'] as num).toInt());

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'count': instance.count,
};

_PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => _PriceModel(
  price: (json['price'] as num).toDouble(),
  changePercent: (json['changePercent'] as num).toDouble(),
);

Map<String, dynamic> _$PriceModelToJson(_PriceModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'changePercent': instance.changePercent,
    };
