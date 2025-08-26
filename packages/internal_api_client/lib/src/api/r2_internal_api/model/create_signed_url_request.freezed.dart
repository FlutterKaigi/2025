// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_signed_url_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSignedUrlRequest {

 String get key; int get size; String get mimeType; String get variant; int get expiresIn;
/// Create a copy of CreateSignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSignedUrlRequestCopyWith<CreateSignedUrlRequest> get copyWith => _$CreateSignedUrlRequestCopyWithImpl<CreateSignedUrlRequest>(this as CreateSignedUrlRequest, _$identity);

  /// Serializes this CreateSignedUrlRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSignedUrlRequest&&(identical(other.key, key) || other.key == key)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,size,mimeType,variant,expiresIn);

@override
String toString() {
  return 'CreateSignedUrlRequest(key: $key, size: $size, mimeType: $mimeType, variant: $variant, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $CreateSignedUrlRequestCopyWith<$Res>  {
  factory $CreateSignedUrlRequestCopyWith(CreateSignedUrlRequest value, $Res Function(CreateSignedUrlRequest) _then) = _$CreateSignedUrlRequestCopyWithImpl;
@useResult
$Res call({
 String key, int size, String mimeType, String variant, int expiresIn
});




}
/// @nodoc
class _$CreateSignedUrlRequestCopyWithImpl<$Res>
    implements $CreateSignedUrlRequestCopyWith<$Res> {
  _$CreateSignedUrlRequestCopyWithImpl(this._self, this._then);

  final CreateSignedUrlRequest _self;
  final $Res Function(CreateSignedUrlRequest) _then;

/// Create a copy of CreateSignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? size = null,Object? mimeType = null,Object? variant = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSignedUrlRequest].
extension CreateSignedUrlRequestPatterns on CreateSignedUrlRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSignedUrlRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSignedUrlRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSignedUrlRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateSignedUrlRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSignedUrlRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSignedUrlRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  int size,  String mimeType,  String variant,  int expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSignedUrlRequest() when $default != null:
return $default(_that.key,_that.size,_that.mimeType,_that.variant,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  int size,  String mimeType,  String variant,  int expiresIn)  $default,) {final _that = this;
switch (_that) {
case _CreateSignedUrlRequest():
return $default(_that.key,_that.size,_that.mimeType,_that.variant,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  int size,  String mimeType,  String variant,  int expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _CreateSignedUrlRequest() when $default != null:
return $default(_that.key,_that.size,_that.mimeType,_that.variant,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSignedUrlRequest implements CreateSignedUrlRequest {
  const _CreateSignedUrlRequest({required this.key, required this.size, required this.mimeType, required this.variant, required this.expiresIn});
  factory _CreateSignedUrlRequest.fromJson(Map<String, dynamic> json) => _$CreateSignedUrlRequestFromJson(json);

@override final  String key;
@override final  int size;
@override final  String mimeType;
@override final  String variant;
@override final  int expiresIn;

/// Create a copy of CreateSignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSignedUrlRequestCopyWith<_CreateSignedUrlRequest> get copyWith => __$CreateSignedUrlRequestCopyWithImpl<_CreateSignedUrlRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSignedUrlRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSignedUrlRequest&&(identical(other.key, key) || other.key == key)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,size,mimeType,variant,expiresIn);

@override
String toString() {
  return 'CreateSignedUrlRequest(key: $key, size: $size, mimeType: $mimeType, variant: $variant, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$CreateSignedUrlRequestCopyWith<$Res> implements $CreateSignedUrlRequestCopyWith<$Res> {
  factory _$CreateSignedUrlRequestCopyWith(_CreateSignedUrlRequest value, $Res Function(_CreateSignedUrlRequest) _then) = __$CreateSignedUrlRequestCopyWithImpl;
@override @useResult
$Res call({
 String key, int size, String mimeType, String variant, int expiresIn
});




}
/// @nodoc
class __$CreateSignedUrlRequestCopyWithImpl<$Res>
    implements _$CreateSignedUrlRequestCopyWith<$Res> {
  __$CreateSignedUrlRequestCopyWithImpl(this._self, this._then);

  final _CreateSignedUrlRequest _self;
  final $Res Function(_CreateSignedUrlRequest) _then;

/// Create a copy of CreateSignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? size = null,Object? mimeType = null,Object? variant = null,Object? expiresIn = null,}) {
  return _then(_CreateSignedUrlRequest(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
