// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sns_link_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnsLinkData {

@JsonKey(name: 'sns_type') String get snsType; String get value;
/// Create a copy of SnsLinkData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnsLinkDataCopyWith<SnsLinkData> get copyWith => _$SnsLinkDataCopyWithImpl<SnsLinkData>(this as SnsLinkData, _$identity);

  /// Serializes this SnsLinkData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnsLinkData&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLinkData(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class $SnsLinkDataCopyWith<$Res>  {
  factory $SnsLinkDataCopyWith(SnsLinkData value, $Res Function(SnsLinkData) _then) = _$SnsLinkDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sns_type') String snsType, String value
});




}
/// @nodoc
class _$SnsLinkDataCopyWithImpl<$Res>
    implements $SnsLinkDataCopyWith<$Res> {
  _$SnsLinkDataCopyWithImpl(this._self, this._then);

  final SnsLinkData _self;
  final $Res Function(SnsLinkData) _then;

/// Create a copy of SnsLinkData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_self.copyWith(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnsLinkData].
extension SnsLinkDataPatterns on SnsLinkData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnsLinkData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnsLinkData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnsLinkData value)  $default,){
final _that = this;
switch (_that) {
case _SnsLinkData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnsLinkData value)?  $default,){
final _that = this;
switch (_that) {
case _SnsLinkData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sns_type')  String snsType,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnsLinkData() when $default != null:
return $default(_that.snsType,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sns_type')  String snsType,  String value)  $default,) {final _that = this;
switch (_that) {
case _SnsLinkData():
return $default(_that.snsType,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sns_type')  String snsType,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SnsLinkData() when $default != null:
return $default(_that.snsType,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnsLinkData implements SnsLinkData {
  const _SnsLinkData({@JsonKey(name: 'sns_type') required this.snsType, required this.value});
  factory _SnsLinkData.fromJson(Map<String, dynamic> json) => _$SnsLinkDataFromJson(json);

@override@JsonKey(name: 'sns_type') final  String snsType;
@override final  String value;

/// Create a copy of SnsLinkData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnsLinkDataCopyWith<_SnsLinkData> get copyWith => __$SnsLinkDataCopyWithImpl<_SnsLinkData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnsLinkDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnsLinkData&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLinkData(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SnsLinkDataCopyWith<$Res> implements $SnsLinkDataCopyWith<$Res> {
  factory _$SnsLinkDataCopyWith(_SnsLinkData value, $Res Function(_SnsLinkData) _then) = __$SnsLinkDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sns_type') String snsType, String value
});




}
/// @nodoc
class __$SnsLinkDataCopyWithImpl<$Res>
    implements _$SnsLinkDataCopyWith<$Res> {
  __$SnsLinkDataCopyWithImpl(this._self, this._then);

  final _SnsLinkData _self;
  final $Res Function(_SnsLinkData) _then;

/// Create a copy of SnsLinkData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_SnsLinkData(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
