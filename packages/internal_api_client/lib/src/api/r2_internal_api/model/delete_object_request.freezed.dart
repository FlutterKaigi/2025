// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteObjectRequest {

 String get key;
/// Create a copy of DeleteObjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteObjectRequestCopyWith<DeleteObjectRequest> get copyWith => _$DeleteObjectRequestCopyWithImpl<DeleteObjectRequest>(this as DeleteObjectRequest, _$identity);

  /// Serializes this DeleteObjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteObjectRequest&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'DeleteObjectRequest(key: $key)';
}


}

/// @nodoc
abstract mixin class $DeleteObjectRequestCopyWith<$Res>  {
  factory $DeleteObjectRequestCopyWith(DeleteObjectRequest value, $Res Function(DeleteObjectRequest) _then) = _$DeleteObjectRequestCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$DeleteObjectRequestCopyWithImpl<$Res>
    implements $DeleteObjectRequestCopyWith<$Res> {
  _$DeleteObjectRequestCopyWithImpl(this._self, this._then);

  final DeleteObjectRequest _self;
  final $Res Function(DeleteObjectRequest) _then;

/// Create a copy of DeleteObjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteObjectRequest].
extension DeleteObjectRequestPatterns on DeleteObjectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteObjectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteObjectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteObjectRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeleteObjectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteObjectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteObjectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteObjectRequest() when $default != null:
return $default(_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key)  $default,) {final _that = this;
switch (_that) {
case _DeleteObjectRequest():
return $default(_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key)?  $default,) {final _that = this;
switch (_that) {
case _DeleteObjectRequest() when $default != null:
return $default(_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteObjectRequest implements DeleteObjectRequest {
  const _DeleteObjectRequest({required this.key});
  factory _DeleteObjectRequest.fromJson(Map<String, dynamic> json) => _$DeleteObjectRequestFromJson(json);

@override final  String key;

/// Create a copy of DeleteObjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteObjectRequestCopyWith<_DeleteObjectRequest> get copyWith => __$DeleteObjectRequestCopyWithImpl<_DeleteObjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteObjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteObjectRequest&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'DeleteObjectRequest(key: $key)';
}


}

/// @nodoc
abstract mixin class _$DeleteObjectRequestCopyWith<$Res> implements $DeleteObjectRequestCopyWith<$Res> {
  factory _$DeleteObjectRequestCopyWith(_DeleteObjectRequest value, $Res Function(_DeleteObjectRequest) _then) = __$DeleteObjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String key
});




}
/// @nodoc
class __$DeleteObjectRequestCopyWithImpl<$Res>
    implements _$DeleteObjectRequestCopyWith<$Res> {
  __$DeleteObjectRequestCopyWithImpl(this._self, this._then);

  final _DeleteObjectRequest _self;
  final $Res Function(_DeleteObjectRequest) _then;

/// Create a copy of DeleteObjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(_DeleteObjectRequest(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
