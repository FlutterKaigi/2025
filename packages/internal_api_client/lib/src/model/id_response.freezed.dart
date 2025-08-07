// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdResponse {

 String get id;
/// Create a copy of IdResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdResponseCopyWith<IdResponse> get copyWith => _$IdResponseCopyWithImpl<IdResponse>(this as IdResponse, _$identity);

  /// Serializes this IdResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'IdResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class $IdResponseCopyWith<$Res>  {
  factory $IdResponseCopyWith(IdResponse value, $Res Function(IdResponse) _then) = _$IdResponseCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$IdResponseCopyWithImpl<$Res>
    implements $IdResponseCopyWith<$Res> {
  _$IdResponseCopyWithImpl(this._self, this._then);

  final IdResponse _self;
  final $Res Function(IdResponse) _then;

/// Create a copy of IdResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdResponse].
extension IdResponsePatterns on IdResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdResponse value)  $default,){
final _that = this;
switch (_that) {
case _IdResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IdResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdResponse() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _IdResponse():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _IdResponse() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdResponse implements IdResponse {
  const _IdResponse({required this.id});
  factory _IdResponse.fromJson(Map<String, dynamic> json) => _$IdResponseFromJson(json);

@override final  String id;

/// Create a copy of IdResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdResponseCopyWith<_IdResponse> get copyWith => __$IdResponseCopyWithImpl<_IdResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdResponse&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'IdResponse(id: $id)';
}


}

/// @nodoc
abstract mixin class _$IdResponseCopyWith<$Res> implements $IdResponseCopyWith<$Res> {
  factory _$IdResponseCopyWith(_IdResponse value, $Res Function(_IdResponse) _then) = __$IdResponseCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$IdResponseCopyWithImpl<$Res>
    implements _$IdResponseCopyWith<$Res> {
  __$IdResponseCopyWithImpl(this._self, this._then);

  final _IdResponse _self;
  final $Res Function(_IdResponse) _then;

/// Create a copy of IdResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_IdResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
