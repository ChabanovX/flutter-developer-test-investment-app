// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockModel {

 int get id; String get companyName; String get tradingSymbol; String get logo; String get currency; bool get shariahCheck; DateTime get analysisDate; bool get isCompliant; PriceModel get price;
/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockModelCopyWith<StockModel> get copyWith => _$StockModelCopyWithImpl<StockModel>(this as StockModel, _$identity);

  /// Serializes this StockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.tradingSymbol, tradingSymbol) || other.tradingSymbol == tradingSymbol)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shariahCheck, shariahCheck) || other.shariahCheck == shariahCheck)&&(identical(other.analysisDate, analysisDate) || other.analysisDate == analysisDate)&&(identical(other.isCompliant, isCompliant) || other.isCompliant == isCompliant)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,tradingSymbol,logo,currency,shariahCheck,analysisDate,isCompliant,price);

@override
String toString() {
  return 'StockModel(id: $id, companyName: $companyName, tradingSymbol: $tradingSymbol, logo: $logo, currency: $currency, shariahCheck: $shariahCheck, analysisDate: $analysisDate, isCompliant: $isCompliant, price: $price)';
}


}

/// @nodoc
abstract mixin class $StockModelCopyWith<$Res>  {
  factory $StockModelCopyWith(StockModel value, $Res Function(StockModel) _then) = _$StockModelCopyWithImpl;
@useResult
$Res call({
 int id, String companyName, String tradingSymbol, String logo, String currency, bool shariahCheck, DateTime analysisDate, bool isCompliant, PriceModel price
});


$PriceModelCopyWith<$Res> get price;

}
/// @nodoc
class _$StockModelCopyWithImpl<$Res>
    implements $StockModelCopyWith<$Res> {
  _$StockModelCopyWithImpl(this._self, this._then);

  final StockModel _self;
  final $Res Function(StockModel) _then;

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyName = null,Object? tradingSymbol = null,Object? logo = null,Object? currency = null,Object? shariahCheck = null,Object? analysisDate = null,Object? isCompliant = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,tradingSymbol: null == tradingSymbol ? _self.tradingSymbol : tradingSymbol // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,shariahCheck: null == shariahCheck ? _self.shariahCheck : shariahCheck // ignore: cast_nullable_to_non_nullable
as bool,analysisDate: null == analysisDate ? _self.analysisDate : analysisDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompliant: null == isCompliant ? _self.isCompliant : isCompliant // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceModel,
  ));
}
/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceModelCopyWith<$Res> get price {
  
  return $PriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockModel].
extension StockModelPatterns on StockModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockModel value)  $default,){
final _that = this;
switch (_that) {
case _StockModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String companyName,  String tradingSymbol,  String logo,  String currency,  bool shariahCheck,  DateTime analysisDate,  bool isCompliant,  PriceModel price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that.id,_that.companyName,_that.tradingSymbol,_that.logo,_that.currency,_that.shariahCheck,_that.analysisDate,_that.isCompliant,_that.price);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String companyName,  String tradingSymbol,  String logo,  String currency,  bool shariahCheck,  DateTime analysisDate,  bool isCompliant,  PriceModel price)  $default,) {final _that = this;
switch (_that) {
case _StockModel():
return $default(_that.id,_that.companyName,_that.tradingSymbol,_that.logo,_that.currency,_that.shariahCheck,_that.analysisDate,_that.isCompliant,_that.price);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String companyName,  String tradingSymbol,  String logo,  String currency,  bool shariahCheck,  DateTime analysisDate,  bool isCompliant,  PriceModel price)?  $default,) {final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that.id,_that.companyName,_that.tradingSymbol,_that.logo,_that.currency,_that.shariahCheck,_that.analysisDate,_that.isCompliant,_that.price);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StockModel implements StockModel {
  const _StockModel({required this.id, required this.companyName, required this.tradingSymbol, required this.logo, required this.currency, required this.shariahCheck, required this.analysisDate, required this.isCompliant, required this.price});
  factory _StockModel.fromJson(Map<String, dynamic> json) => _$StockModelFromJson(json);

@override final  int id;
@override final  String companyName;
@override final  String tradingSymbol;
@override final  String logo;
@override final  String currency;
@override final  bool shariahCheck;
@override final  DateTime analysisDate;
@override final  bool isCompliant;
@override final  PriceModel price;

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockModelCopyWith<_StockModel> get copyWith => __$StockModelCopyWithImpl<_StockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.tradingSymbol, tradingSymbol) || other.tradingSymbol == tradingSymbol)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shariahCheck, shariahCheck) || other.shariahCheck == shariahCheck)&&(identical(other.analysisDate, analysisDate) || other.analysisDate == analysisDate)&&(identical(other.isCompliant, isCompliant) || other.isCompliant == isCompliant)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,tradingSymbol,logo,currency,shariahCheck,analysisDate,isCompliant,price);

@override
String toString() {
  return 'StockModel(id: $id, companyName: $companyName, tradingSymbol: $tradingSymbol, logo: $logo, currency: $currency, shariahCheck: $shariahCheck, analysisDate: $analysisDate, isCompliant: $isCompliant, price: $price)';
}


}

/// @nodoc
abstract mixin class _$StockModelCopyWith<$Res> implements $StockModelCopyWith<$Res> {
  factory _$StockModelCopyWith(_StockModel value, $Res Function(_StockModel) _then) = __$StockModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String companyName, String tradingSymbol, String logo, String currency, bool shariahCheck, DateTime analysisDate, bool isCompliant, PriceModel price
});


@override $PriceModelCopyWith<$Res> get price;

}
/// @nodoc
class __$StockModelCopyWithImpl<$Res>
    implements _$StockModelCopyWith<$Res> {
  __$StockModelCopyWithImpl(this._self, this._then);

  final _StockModel _self;
  final $Res Function(_StockModel) _then;

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyName = null,Object? tradingSymbol = null,Object? logo = null,Object? currency = null,Object? shariahCheck = null,Object? analysisDate = null,Object? isCompliant = null,Object? price = null,}) {
  return _then(_StockModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,tradingSymbol: null == tradingSymbol ? _self.tradingSymbol : tradingSymbol // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,shariahCheck: null == shariahCheck ? _self.shariahCheck : shariahCheck // ignore: cast_nullable_to_non_nullable
as bool,analysisDate: null == analysisDate ? _self.analysisDate : analysisDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompliant: null == isCompliant ? _self.isCompliant : isCompliant // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceModel,
  ));
}

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceModelCopyWith<$Res> get price {
  
  return $PriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// @nodoc
mixin _$StockResponse {

 List<StockModel> get data; Meta get meta;
/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockResponseCopyWith<StockResponse> get copyWith => _$StockResponseCopyWithImpl<StockResponse>(this as StockResponse, _$identity);

  /// Serializes this StockResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'StockResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $StockResponseCopyWith<$Res>  {
  factory $StockResponseCopyWith(StockResponse value, $Res Function(StockResponse) _then) = _$StockResponseCopyWithImpl;
@useResult
$Res call({
 List<StockModel> data, Meta meta
});


$MetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$StockResponseCopyWithImpl<$Res>
    implements $StockResponseCopyWith<$Res> {
  _$StockResponseCopyWithImpl(this._self, this._then);

  final StockResponse _self;
  final $Res Function(StockResponse) _then;

/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<StockModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta,
  ));
}
/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaCopyWith<$Res> get meta {
  
  return $MetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockResponse].
extension StockResponsePatterns on StockResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockResponse value)  $default,){
final _that = this;
switch (_that) {
case _StockResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StockResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StockModel> data,  Meta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StockModel> data,  Meta meta)  $default,) {final _that = this;
switch (_that) {
case _StockResponse():
return $default(_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StockModel> data,  Meta meta)?  $default,) {final _that = this;
switch (_that) {
case _StockResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StockResponse implements StockResponse {
  const _StockResponse({required final  List<StockModel> data, required this.meta}): _data = data;
  factory _StockResponse.fromJson(Map<String, dynamic> json) => _$StockResponseFromJson(json);

 final  List<StockModel> _data;
@override List<StockModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  Meta meta;

/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockResponseCopyWith<_StockResponse> get copyWith => __$StockResponseCopyWithImpl<_StockResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'StockResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$StockResponseCopyWith<$Res> implements $StockResponseCopyWith<$Res> {
  factory _$StockResponseCopyWith(_StockResponse value, $Res Function(_StockResponse) _then) = __$StockResponseCopyWithImpl;
@override @useResult
$Res call({
 List<StockModel> data, Meta meta
});


@override $MetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$StockResponseCopyWithImpl<$Res>
    implements _$StockResponseCopyWith<$Res> {
  __$StockResponseCopyWithImpl(this._self, this._then);

  final _StockResponse _self;
  final $Res Function(_StockResponse) _then;

/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_StockResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<StockModel>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta,
  ));
}

/// Create a copy of StockResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaCopyWith<$Res> get meta {
  
  return $MetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$Meta {

 int get count;
/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaCopyWith<Meta> get copyWith => _$MetaCopyWithImpl<Meta>(this as Meta, _$identity);

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meta&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'Meta(count: $count)';
}


}

/// @nodoc
abstract mixin class $MetaCopyWith<$Res>  {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) _then) = _$MetaCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$MetaCopyWithImpl<$Res>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._self, this._then);

  final Meta _self;
  final $Res Function(Meta) _then;

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Meta].
extension MetaPatterns on Meta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meta value)  $default,){
final _that = this;
switch (_that) {
case _Meta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meta value)?  $default,){
final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _Meta():
return $default(_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meta implements Meta {
  const _Meta({required this.count});
  factory _Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

@override final  int count;

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaCopyWith<_Meta> get copyWith => __$MetaCopyWithImpl<_Meta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meta&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'Meta(count: $count)';
}


}

/// @nodoc
abstract mixin class _$MetaCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$MetaCopyWith(_Meta value, $Res Function(_Meta) _then) = __$MetaCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$MetaCopyWithImpl<$Res>
    implements _$MetaCopyWith<$Res> {
  __$MetaCopyWithImpl(this._self, this._then);

  final _Meta _self;
  final $Res Function(_Meta) _then;

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_Meta(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PriceModel {

 double get price; double get changePercent;
/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceModelCopyWith<PriceModel> get copyWith => _$PriceModelCopyWithImpl<PriceModel>(this as PriceModel, _$identity);

  /// Serializes this PriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceModel&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,changePercent);

@override
String toString() {
  return 'PriceModel(price: $price, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class $PriceModelCopyWith<$Res>  {
  factory $PriceModelCopyWith(PriceModel value, $Res Function(PriceModel) _then) = _$PriceModelCopyWithImpl;
@useResult
$Res call({
 double price, double changePercent
});




}
/// @nodoc
class _$PriceModelCopyWithImpl<$Res>
    implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._self, this._then);

  final PriceModel _self;
  final $Res Function(PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? changePercent = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceModel].
extension PriceModelPatterns on PriceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceModel value)  $default,){
final _that = this;
switch (_that) {
case _PriceModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  double changePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.price,_that.changePercent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  double changePercent)  $default,) {final _that = this;
switch (_that) {
case _PriceModel():
return $default(_that.price,_that.changePercent);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  double changePercent)?  $default,) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.price,_that.changePercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceModel implements PriceModel {
  const _PriceModel({required this.price, required this.changePercent});
  factory _PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

@override final  double price;
@override final  double changePercent;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceModelCopyWith<_PriceModel> get copyWith => __$PriceModelCopyWithImpl<_PriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceModel&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,changePercent);

@override
String toString() {
  return 'PriceModel(price: $price, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class _$PriceModelCopyWith<$Res> implements $PriceModelCopyWith<$Res> {
  factory _$PriceModelCopyWith(_PriceModel value, $Res Function(_PriceModel) _then) = __$PriceModelCopyWithImpl;
@override @useResult
$Res call({
 double price, double changePercent
});




}
/// @nodoc
class __$PriceModelCopyWithImpl<$Res>
    implements _$PriceModelCopyWith<$Res> {
  __$PriceModelCopyWithImpl(this._self, this._then);

  final _PriceModel _self;
  final $Res Function(_PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? changePercent = null,}) {
  return _then(_PriceModel(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
