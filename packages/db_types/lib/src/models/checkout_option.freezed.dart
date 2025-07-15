// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutOption {

 String get optionId; String get value;
/// Create a copy of CheckoutOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutOptionCopyWith<CheckoutOption> get copyWith => _$CheckoutOptionCopyWithImpl<CheckoutOption>(this as CheckoutOption, _$identity);

  /// Serializes this CheckoutOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutOption&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,value);

@override
String toString() {
  return 'CheckoutOption(optionId: $optionId, value: $value)';
}


}

/// @nodoc
abstract mixin class $CheckoutOptionCopyWith<$Res>  {
  factory $CheckoutOptionCopyWith(CheckoutOption value, $Res Function(CheckoutOption) _then) = _$CheckoutOptionCopyWithImpl;
@useResult
$Res call({
 String optionId, String value
});




}
/// @nodoc
class _$CheckoutOptionCopyWithImpl<$Res>
    implements $CheckoutOptionCopyWith<$Res> {
  _$CheckoutOptionCopyWithImpl(this._self, this._then);

  final CheckoutOption _self;
  final $Res Function(CheckoutOption) _then;

/// Create a copy of CheckoutOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? optionId = null,Object? value = null,}) {
  return _then(_self.copyWith(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutOption].
extension CheckoutOptionPatterns on CheckoutOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutOption value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutOption value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String optionId,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutOption() when $default != null:
return $default(_that.optionId,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String optionId,  String value)  $default,) {final _that = this;
switch (_that) {
case _CheckoutOption():
return $default(_that.optionId,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String optionId,  String value)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutOption() when $default != null:
return $default(_that.optionId,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutOption implements CheckoutOption {
  const _CheckoutOption({required this.optionId, required this.value});
  factory _CheckoutOption.fromJson(Map<String, dynamic> json) => _$CheckoutOptionFromJson(json);

@override final  String optionId;
@override final  String value;

/// Create a copy of CheckoutOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutOptionCopyWith<_CheckoutOption> get copyWith => __$CheckoutOptionCopyWithImpl<_CheckoutOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutOption&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,value);

@override
String toString() {
  return 'CheckoutOption(optionId: $optionId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$CheckoutOptionCopyWith<$Res> implements $CheckoutOptionCopyWith<$Res> {
  factory _$CheckoutOptionCopyWith(_CheckoutOption value, $Res Function(_CheckoutOption) _then) = __$CheckoutOptionCopyWithImpl;
@override @useResult
$Res call({
 String optionId, String value
});




}
/// @nodoc
class __$CheckoutOptionCopyWithImpl<$Res>
    implements _$CheckoutOptionCopyWith<$Res> {
  __$CheckoutOptionCopyWithImpl(this._self, this._then);

  final _CheckoutOption _self;
  final $Res Function(_CheckoutOption) _then;

/// Create a copy of CheckoutOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? optionId = null,Object? value = null,}) {
  return _then(_CheckoutOption(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
