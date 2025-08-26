// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_signed_url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSignedUrlResponse {

 String get key; String get signedUrl;
/// Create a copy of CreateSignedUrlResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSignedUrlResponseCopyWith<CreateSignedUrlResponse> get copyWith => _$CreateSignedUrlResponseCopyWithImpl<CreateSignedUrlResponse>(this as CreateSignedUrlResponse, _$identity);

  /// Serializes this CreateSignedUrlResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSignedUrlResponse&&(identical(other.key, key) || other.key == key)&&(identical(other.signedUrl, signedUrl) || other.signedUrl == signedUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,signedUrl);

@override
String toString() {
  return 'CreateSignedUrlResponse(key: $key, signedUrl: $signedUrl)';
}


}

/// @nodoc
abstract mixin class $CreateSignedUrlResponseCopyWith<$Res>  {
  factory $CreateSignedUrlResponseCopyWith(CreateSignedUrlResponse value, $Res Function(CreateSignedUrlResponse) _then) = _$CreateSignedUrlResponseCopyWithImpl;
@useResult
$Res call({
 String key, String signedUrl
});




}
/// @nodoc
class _$CreateSignedUrlResponseCopyWithImpl<$Res>
    implements $CreateSignedUrlResponseCopyWith<$Res> {
  _$CreateSignedUrlResponseCopyWithImpl(this._self, this._then);

  final CreateSignedUrlResponse _self;
  final $Res Function(CreateSignedUrlResponse) _then;

/// Create a copy of CreateSignedUrlResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? signedUrl = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,signedUrl: null == signedUrl ? _self.signedUrl : signedUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSignedUrlResponse].
extension CreateSignedUrlResponsePatterns on CreateSignedUrlResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSignedUrlResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSignedUrlResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSignedUrlResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateSignedUrlResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSignedUrlResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSignedUrlResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String signedUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSignedUrlResponse() when $default != null:
return $default(_that.key,_that.signedUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String signedUrl)  $default,) {final _that = this;
switch (_that) {
case _CreateSignedUrlResponse():
return $default(_that.key,_that.signedUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String signedUrl)?  $default,) {final _that = this;
switch (_that) {
case _CreateSignedUrlResponse() when $default != null:
return $default(_that.key,_that.signedUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSignedUrlResponse implements CreateSignedUrlResponse {
  const _CreateSignedUrlResponse({required this.key, required this.signedUrl});
  factory _CreateSignedUrlResponse.fromJson(Map<String, dynamic> json) => _$CreateSignedUrlResponseFromJson(json);

@override final  String key;
@override final  String signedUrl;

/// Create a copy of CreateSignedUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSignedUrlResponseCopyWith<_CreateSignedUrlResponse> get copyWith => __$CreateSignedUrlResponseCopyWithImpl<_CreateSignedUrlResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSignedUrlResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSignedUrlResponse&&(identical(other.key, key) || other.key == key)&&(identical(other.signedUrl, signedUrl) || other.signedUrl == signedUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,signedUrl);

@override
String toString() {
  return 'CreateSignedUrlResponse(key: $key, signedUrl: $signedUrl)';
}


}

/// @nodoc
abstract mixin class _$CreateSignedUrlResponseCopyWith<$Res> implements $CreateSignedUrlResponseCopyWith<$Res> {
  factory _$CreateSignedUrlResponseCopyWith(_CreateSignedUrlResponse value, $Res Function(_CreateSignedUrlResponse) _then) = __$CreateSignedUrlResponseCopyWithImpl;
@override @useResult
$Res call({
 String key, String signedUrl
});




}
/// @nodoc
class __$CreateSignedUrlResponseCopyWithImpl<$Res>
    implements _$CreateSignedUrlResponseCopyWith<$Res> {
  __$CreateSignedUrlResponseCopyWithImpl(this._self, this._then);

  final _CreateSignedUrlResponse _self;
  final $Res Function(_CreateSignedUrlResponse) _then;

/// Create a copy of CreateSignedUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? signedUrl = null,}) {
  return _then(_CreateSignedUrlResponse(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,signedUrl: null == signedUrl ? _self.signedUrl : signedUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
