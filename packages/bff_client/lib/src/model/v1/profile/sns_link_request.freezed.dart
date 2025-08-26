// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sns_link_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnsLinkRequest {

 String get snsType; String get value;
/// Create a copy of SnsLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnsLinkRequestCopyWith<SnsLinkRequest> get copyWith => _$SnsLinkRequestCopyWithImpl<SnsLinkRequest>(this as SnsLinkRequest, _$identity);

  /// Serializes this SnsLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnsLinkRequest&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLinkRequest(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class $SnsLinkRequestCopyWith<$Res>  {
  factory $SnsLinkRequestCopyWith(SnsLinkRequest value, $Res Function(SnsLinkRequest) _then) = _$SnsLinkRequestCopyWithImpl;
@useResult
$Res call({
 String snsType, String value
});




}
/// @nodoc
class _$SnsLinkRequestCopyWithImpl<$Res>
    implements $SnsLinkRequestCopyWith<$Res> {
  _$SnsLinkRequestCopyWithImpl(this._self, this._then);

  final SnsLinkRequest _self;
  final $Res Function(SnsLinkRequest) _then;

/// Create a copy of SnsLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_self.copyWith(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnsLinkRequest].
extension SnsLinkRequestPatterns on SnsLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnsLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnsLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnsLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _SnsLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnsLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SnsLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String snsType,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnsLinkRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String snsType,  String value)  $default,) {final _that = this;
switch (_that) {
case _SnsLinkRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String snsType,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SnsLinkRequest() when $default != null:
return $default(_that.snsType,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnsLinkRequest implements SnsLinkRequest {
  const _SnsLinkRequest({required this.snsType, required this.value});
  factory _SnsLinkRequest.fromJson(Map<String, dynamic> json) => _$SnsLinkRequestFromJson(json);

@override final  String snsType;
@override final  String value;

/// Create a copy of SnsLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnsLinkRequestCopyWith<_SnsLinkRequest> get copyWith => __$SnsLinkRequestCopyWithImpl<_SnsLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnsLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnsLinkRequest&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLinkRequest(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SnsLinkRequestCopyWith<$Res> implements $SnsLinkRequestCopyWith<$Res> {
  factory _$SnsLinkRequestCopyWith(_SnsLinkRequest value, $Res Function(_SnsLinkRequest) _then) = __$SnsLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String snsType, String value
});




}
/// @nodoc
class __$SnsLinkRequestCopyWithImpl<$Res>
    implements _$SnsLinkRequestCopyWith<$Res> {
  __$SnsLinkRequestCopyWithImpl(this._self, this._then);

  final _SnsLinkRequest _self;
  final $Res Function(_SnsLinkRequest) _then;

/// Create a copy of SnsLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_SnsLinkRequest(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
