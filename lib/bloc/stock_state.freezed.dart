// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockState {

 StockStatus get status; List<Stock> get stocks; List<String> get supportedCountries; String get search; bool? get compliance; String? get countryCode; int get page; int get totalCount; bool get hasReachedEnd; bool get isLoadingMore; bool get usingMockData; String? get errorMessage;
/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockStateCopyWith<StockState> get copyWith => _$StockStateCopyWithImpl<StockState>(this as StockState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.stocks, stocks)&&const DeepCollectionEquality().equals(other.supportedCountries, supportedCountries)&&(identical(other.search, search) || other.search == search)&&(identical(other.compliance, compliance) || other.compliance == compliance)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.usingMockData, usingMockData) || other.usingMockData == usingMockData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(stocks),const DeepCollectionEquality().hash(supportedCountries),search,compliance,countryCode,page,totalCount,hasReachedEnd,isLoadingMore,usingMockData,errorMessage);

@override
String toString() {
  return 'StockState(status: $status, stocks: $stocks, supportedCountries: $supportedCountries, search: $search, compliance: $compliance, countryCode: $countryCode, page: $page, totalCount: $totalCount, hasReachedEnd: $hasReachedEnd, isLoadingMore: $isLoadingMore, usingMockData: $usingMockData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $StockStateCopyWith<$Res>  {
  factory $StockStateCopyWith(StockState value, $Res Function(StockState) _then) = _$StockStateCopyWithImpl;
@useResult
$Res call({
 StockStatus status, List<Stock> stocks, List<String> supportedCountries, String search, bool? compliance, String? countryCode, int page, int totalCount, bool hasReachedEnd, bool isLoadingMore, bool usingMockData, String? errorMessage
});




}
/// @nodoc
class _$StockStateCopyWithImpl<$Res>
    implements $StockStateCopyWith<$Res> {
  _$StockStateCopyWithImpl(this._self, this._then);

  final StockState _self;
  final $Res Function(StockState) _then;

/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stocks = null,Object? supportedCountries = null,Object? search = null,Object? compliance = freezed,Object? countryCode = freezed,Object? page = null,Object? totalCount = null,Object? hasReachedEnd = null,Object? isLoadingMore = null,Object? usingMockData = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockStatus,stocks: null == stocks ? _self.stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<Stock>,supportedCountries: null == supportedCountries ? _self.supportedCountries : supportedCountries // ignore: cast_nullable_to_non_nullable
as List<String>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,compliance: freezed == compliance ? _self.compliance : compliance // ignore: cast_nullable_to_non_nullable
as bool?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,usingMockData: null == usingMockData ? _self.usingMockData : usingMockData // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockState].
extension StockStatePatterns on StockState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockState value)  $default,){
final _that = this;
switch (_that) {
case _StockState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockState value)?  $default,){
final _that = this;
switch (_that) {
case _StockState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StockStatus status,  List<Stock> stocks,  List<String> supportedCountries,  String search,  bool? compliance,  String? countryCode,  int page,  int totalCount,  bool hasReachedEnd,  bool isLoadingMore,  bool usingMockData,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.status,_that.stocks,_that.supportedCountries,_that.search,_that.compliance,_that.countryCode,_that.page,_that.totalCount,_that.hasReachedEnd,_that.isLoadingMore,_that.usingMockData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StockStatus status,  List<Stock> stocks,  List<String> supportedCountries,  String search,  bool? compliance,  String? countryCode,  int page,  int totalCount,  bool hasReachedEnd,  bool isLoadingMore,  bool usingMockData,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _StockState():
return $default(_that.status,_that.stocks,_that.supportedCountries,_that.search,_that.compliance,_that.countryCode,_that.page,_that.totalCount,_that.hasReachedEnd,_that.isLoadingMore,_that.usingMockData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StockStatus status,  List<Stock> stocks,  List<String> supportedCountries,  String search,  bool? compliance,  String? countryCode,  int page,  int totalCount,  bool hasReachedEnd,  bool isLoadingMore,  bool usingMockData,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.status,_that.stocks,_that.supportedCountries,_that.search,_that.compliance,_that.countryCode,_that.page,_that.totalCount,_that.hasReachedEnd,_that.isLoadingMore,_that.usingMockData,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _StockState extends StockState {
  const _StockState({required this.status, required final  List<Stock> stocks, required final  List<String> supportedCountries, required this.search, this.compliance, this.countryCode, required this.page, required this.totalCount, required this.hasReachedEnd, required this.isLoadingMore, required this.usingMockData, this.errorMessage}): _stocks = stocks,_supportedCountries = supportedCountries,super._();
  

@override final  StockStatus status;
 final  List<Stock> _stocks;
@override List<Stock> get stocks {
  if (_stocks is EqualUnmodifiableListView) return _stocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stocks);
}

 final  List<String> _supportedCountries;
@override List<String> get supportedCountries {
  if (_supportedCountries is EqualUnmodifiableListView) return _supportedCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedCountries);
}

@override final  String search;
@override final  bool? compliance;
@override final  String? countryCode;
@override final  int page;
@override final  int totalCount;
@override final  bool hasReachedEnd;
@override final  bool isLoadingMore;
@override final  bool usingMockData;
@override final  String? errorMessage;

/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockStateCopyWith<_StockState> get copyWith => __$StockStateCopyWithImpl<_StockState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._stocks, _stocks)&&const DeepCollectionEquality().equals(other._supportedCountries, _supportedCountries)&&(identical(other.search, search) || other.search == search)&&(identical(other.compliance, compliance) || other.compliance == compliance)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.usingMockData, usingMockData) || other.usingMockData == usingMockData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_stocks),const DeepCollectionEquality().hash(_supportedCountries),search,compliance,countryCode,page,totalCount,hasReachedEnd,isLoadingMore,usingMockData,errorMessage);

@override
String toString() {
  return 'StockState(status: $status, stocks: $stocks, supportedCountries: $supportedCountries, search: $search, compliance: $compliance, countryCode: $countryCode, page: $page, totalCount: $totalCount, hasReachedEnd: $hasReachedEnd, isLoadingMore: $isLoadingMore, usingMockData: $usingMockData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$StockStateCopyWith<$Res> implements $StockStateCopyWith<$Res> {
  factory _$StockStateCopyWith(_StockState value, $Res Function(_StockState) _then) = __$StockStateCopyWithImpl;
@override @useResult
$Res call({
 StockStatus status, List<Stock> stocks, List<String> supportedCountries, String search, bool? compliance, String? countryCode, int page, int totalCount, bool hasReachedEnd, bool isLoadingMore, bool usingMockData, String? errorMessage
});




}
/// @nodoc
class __$StockStateCopyWithImpl<$Res>
    implements _$StockStateCopyWith<$Res> {
  __$StockStateCopyWithImpl(this._self, this._then);

  final _StockState _self;
  final $Res Function(_StockState) _then;

/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stocks = null,Object? supportedCountries = null,Object? search = null,Object? compliance = freezed,Object? countryCode = freezed,Object? page = null,Object? totalCount = null,Object? hasReachedEnd = null,Object? isLoadingMore = null,Object? usingMockData = null,Object? errorMessage = freezed,}) {
  return _then(_StockState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockStatus,stocks: null == stocks ? _self._stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<Stock>,supportedCountries: null == supportedCountries ? _self._supportedCountries : supportedCountries // ignore: cast_nullable_to_non_nullable
as List<String>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,compliance: freezed == compliance ? _self.compliance : compliance // ignore: cast_nullable_to_non_nullable
as bool?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,usingMockData: null == usingMockData ? _self.usingMockData : usingMockData // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
