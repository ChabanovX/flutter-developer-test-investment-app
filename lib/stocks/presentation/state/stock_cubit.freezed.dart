// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterOptions {

 String? get filterByCountry; Compliance? get filterByCompliance;
/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterOptionsCopyWith<FilterOptions> get copyWith => _$FilterOptionsCopyWithImpl<FilterOptions>(this as FilterOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterOptions&&(identical(other.filterByCountry, filterByCountry) || other.filterByCountry == filterByCountry)&&(identical(other.filterByCompliance, filterByCompliance) || other.filterByCompliance == filterByCompliance));
}


@override
int get hashCode => Object.hash(runtimeType,filterByCountry,filterByCompliance);

@override
String toString() {
  return 'FilterOptions(filterByCountry: $filterByCountry, filterByCompliance: $filterByCompliance)';
}


}

/// @nodoc
abstract mixin class $FilterOptionsCopyWith<$Res>  {
  factory $FilterOptionsCopyWith(FilterOptions value, $Res Function(FilterOptions) _then) = _$FilterOptionsCopyWithImpl;
@useResult
$Res call({
 String? filterByCountry, Compliance? filterByCompliance
});




}
/// @nodoc
class _$FilterOptionsCopyWithImpl<$Res>
    implements $FilterOptionsCopyWith<$Res> {
  _$FilterOptionsCopyWithImpl(this._self, this._then);

  final FilterOptions _self;
  final $Res Function(FilterOptions) _then;

/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filterByCountry = freezed,Object? filterByCompliance = freezed,}) {
  return _then(_self.copyWith(
filterByCountry: freezed == filterByCountry ? _self.filterByCountry : filterByCountry // ignore: cast_nullable_to_non_nullable
as String?,filterByCompliance: freezed == filterByCompliance ? _self.filterByCompliance : filterByCompliance // ignore: cast_nullable_to_non_nullable
as Compliance?,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterOptions].
extension FilterOptionsPatterns on FilterOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterOptions value)  $default,){
final _that = this;
switch (_that) {
case _FilterOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterOptions value)?  $default,){
final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? filterByCountry,  Compliance? filterByCompliance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
return $default(_that.filterByCountry,_that.filterByCompliance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? filterByCountry,  Compliance? filterByCompliance)  $default,) {final _that = this;
switch (_that) {
case _FilterOptions():
return $default(_that.filterByCountry,_that.filterByCompliance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? filterByCountry,  Compliance? filterByCompliance)?  $default,) {final _that = this;
switch (_that) {
case _FilterOptions() when $default != null:
return $default(_that.filterByCountry,_that.filterByCompliance);case _:
  return null;

}
}

}

/// @nodoc


class _FilterOptions implements FilterOptions {
  const _FilterOptions({this.filterByCountry, this.filterByCompliance});
  

@override final  String? filterByCountry;
@override final  Compliance? filterByCompliance;

/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterOptionsCopyWith<_FilterOptions> get copyWith => __$FilterOptionsCopyWithImpl<_FilterOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterOptions&&(identical(other.filterByCountry, filterByCountry) || other.filterByCountry == filterByCountry)&&(identical(other.filterByCompliance, filterByCompliance) || other.filterByCompliance == filterByCompliance));
}


@override
int get hashCode => Object.hash(runtimeType,filterByCountry,filterByCompliance);

@override
String toString() {
  return 'FilterOptions(filterByCountry: $filterByCountry, filterByCompliance: $filterByCompliance)';
}


}

/// @nodoc
abstract mixin class _$FilterOptionsCopyWith<$Res> implements $FilterOptionsCopyWith<$Res> {
  factory _$FilterOptionsCopyWith(_FilterOptions value, $Res Function(_FilterOptions) _then) = __$FilterOptionsCopyWithImpl;
@override @useResult
$Res call({
 String? filterByCountry, Compliance? filterByCompliance
});




}
/// @nodoc
class __$FilterOptionsCopyWithImpl<$Res>
    implements _$FilterOptionsCopyWith<$Res> {
  __$FilterOptionsCopyWithImpl(this._self, this._then);

  final _FilterOptions _self;
  final $Res Function(_FilterOptions) _then;

/// Create a copy of FilterOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filterByCountry = freezed,Object? filterByCompliance = freezed,}) {
  return _then(_FilterOptions(
filterByCountry: freezed == filterByCountry ? _self.filterByCountry : filterByCountry // ignore: cast_nullable_to_non_nullable
as String?,filterByCompliance: freezed == filterByCompliance ? _self.filterByCompliance : filterByCompliance // ignore: cast_nullable_to_non_nullable
as Compliance?,
  ));
}


}

/// @nodoc
mixin _$StockState {

 bool get isLoading; String? get error; int? get stockCount; List<StockModel>? get allStocks; List<StockModel>? get filteredStocks;
/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockStateCopyWith<StockState> get copyWith => _$StockStateCopyWithImpl<StockState>(this as StockState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.stockCount, stockCount) || other.stockCount == stockCount)&&const DeepCollectionEquality().equals(other.allStocks, allStocks)&&const DeepCollectionEquality().equals(other.filteredStocks, filteredStocks));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,stockCount,const DeepCollectionEquality().hash(allStocks),const DeepCollectionEquality().hash(filteredStocks));

@override
String toString() {
  return 'StockState(isLoading: $isLoading, error: $error, stockCount: $stockCount, allStocks: $allStocks, filteredStocks: $filteredStocks)';
}


}

/// @nodoc
abstract mixin class $StockStateCopyWith<$Res>  {
  factory $StockStateCopyWith(StockState value, $Res Function(StockState) _then) = _$StockStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, int? stockCount, List<StockModel>? allStocks, List<StockModel>? filteredStocks
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? stockCount = freezed,Object? allStocks = freezed,Object? filteredStocks = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,stockCount: freezed == stockCount ? _self.stockCount : stockCount // ignore: cast_nullable_to_non_nullable
as int?,allStocks: freezed == allStocks ? _self.allStocks : allStocks // ignore: cast_nullable_to_non_nullable
as List<StockModel>?,filteredStocks: freezed == filteredStocks ? _self.filteredStocks : filteredStocks // ignore: cast_nullable_to_non_nullable
as List<StockModel>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  int? stockCount,  List<StockModel>? allStocks,  List<StockModel>? filteredStocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.isLoading,_that.error,_that.stockCount,_that.allStocks,_that.filteredStocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  int? stockCount,  List<StockModel>? allStocks,  List<StockModel>? filteredStocks)  $default,) {final _that = this;
switch (_that) {
case _StockState():
return $default(_that.isLoading,_that.error,_that.stockCount,_that.allStocks,_that.filteredStocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  int? stockCount,  List<StockModel>? allStocks,  List<StockModel>? filteredStocks)?  $default,) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.isLoading,_that.error,_that.stockCount,_that.allStocks,_that.filteredStocks);case _:
  return null;

}
}

}

/// @nodoc


class _StockState implements StockState {
  const _StockState({this.isLoading = false, this.error, this.stockCount, final  List<StockModel>? allStocks, final  List<StockModel>? filteredStocks}): _allStocks = allStocks,_filteredStocks = filteredStocks;
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  int? stockCount;
 final  List<StockModel>? _allStocks;
@override List<StockModel>? get allStocks {
  final value = _allStocks;
  if (value == null) return null;
  if (_allStocks is EqualUnmodifiableListView) return _allStocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<StockModel>? _filteredStocks;
@override List<StockModel>? get filteredStocks {
  final value = _filteredStocks;
  if (value == null) return null;
  if (_filteredStocks is EqualUnmodifiableListView) return _filteredStocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockStateCopyWith<_StockState> get copyWith => __$StockStateCopyWithImpl<_StockState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.stockCount, stockCount) || other.stockCount == stockCount)&&const DeepCollectionEquality().equals(other._allStocks, _allStocks)&&const DeepCollectionEquality().equals(other._filteredStocks, _filteredStocks));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,stockCount,const DeepCollectionEquality().hash(_allStocks),const DeepCollectionEquality().hash(_filteredStocks));

@override
String toString() {
  return 'StockState(isLoading: $isLoading, error: $error, stockCount: $stockCount, allStocks: $allStocks, filteredStocks: $filteredStocks)';
}


}

/// @nodoc
abstract mixin class _$StockStateCopyWith<$Res> implements $StockStateCopyWith<$Res> {
  factory _$StockStateCopyWith(_StockState value, $Res Function(_StockState) _then) = __$StockStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, int? stockCount, List<StockModel>? allStocks, List<StockModel>? filteredStocks
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? stockCount = freezed,Object? allStocks = freezed,Object? filteredStocks = freezed,}) {
  return _then(_StockState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,stockCount: freezed == stockCount ? _self.stockCount : stockCount // ignore: cast_nullable_to_non_nullable
as int?,allStocks: freezed == allStocks ? _self._allStocks : allStocks // ignore: cast_nullable_to_non_nullable
as List<StockModel>?,filteredStocks: freezed == filteredStocks ? _self._filteredStocks : filteredStocks // ignore: cast_nullable_to_non_nullable
as List<StockModel>?,
  ));
}


}

// dart format on
