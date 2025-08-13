// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_upload_url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvatarUploadUrlResponse {

 String get uploadUrl; String get avatarKey; int get expiresIn;
/// Create a copy of AvatarUploadUrlResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarUploadUrlResponseCopyWith<AvatarUploadUrlResponse> get copyWith => _$AvatarUploadUrlResponseCopyWithImpl<AvatarUploadUrlResponse>(this as AvatarUploadUrlResponse, _$identity);

  /// Serializes this AvatarUploadUrlResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarUploadUrlResponse&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,avatarKey,expiresIn);

@override
String toString() {
  return 'AvatarUploadUrlResponse(uploadUrl: $uploadUrl, avatarKey: $avatarKey, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $AvatarUploadUrlResponseCopyWith<$Res>  {
  factory $AvatarUploadUrlResponseCopyWith(AvatarUploadUrlResponse value, $Res Function(AvatarUploadUrlResponse) _then) = _$AvatarUploadUrlResponseCopyWithImpl;
@useResult
$Res call({
 String uploadUrl, String avatarKey, int expiresIn
});




}
/// @nodoc
class _$AvatarUploadUrlResponseCopyWithImpl<$Res>
    implements $AvatarUploadUrlResponseCopyWith<$Res> {
  _$AvatarUploadUrlResponseCopyWithImpl(this._self, this._then);

  final AvatarUploadUrlResponse _self;
  final $Res Function(AvatarUploadUrlResponse) _then;

/// Create a copy of AvatarUploadUrlResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadUrl = null,Object? avatarKey = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,avatarKey: null == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarUploadUrlResponse].
extension AvatarUploadUrlResponsePatterns on AvatarUploadUrlResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarUploadUrlResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarUploadUrlResponse value)  $default,){
final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarUploadUrlResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uploadUrl,  String avatarKey,  int expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse() when $default != null:
return $default(_that.uploadUrl,_that.avatarKey,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uploadUrl,  String avatarKey,  int expiresIn)  $default,) {final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse():
return $default(_that.uploadUrl,_that.avatarKey,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uploadUrl,  String avatarKey,  int expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _AvatarUploadUrlResponse() when $default != null:
return $default(_that.uploadUrl,_that.avatarKey,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvatarUploadUrlResponse implements AvatarUploadUrlResponse {
  const _AvatarUploadUrlResponse({required this.uploadUrl, required this.avatarKey, required this.expiresIn});
  factory _AvatarUploadUrlResponse.fromJson(Map<String, dynamic> json) => _$AvatarUploadUrlResponseFromJson(json);

@override final  String uploadUrl;
@override final  String avatarKey;
@override final  int expiresIn;

/// Create a copy of AvatarUploadUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarUploadUrlResponseCopyWith<_AvatarUploadUrlResponse> get copyWith => __$AvatarUploadUrlResponseCopyWithImpl<_AvatarUploadUrlResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvatarUploadUrlResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarUploadUrlResponse&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uploadUrl,avatarKey,expiresIn);

@override
String toString() {
  return 'AvatarUploadUrlResponse(uploadUrl: $uploadUrl, avatarKey: $avatarKey, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$AvatarUploadUrlResponseCopyWith<$Res> implements $AvatarUploadUrlResponseCopyWith<$Res> {
  factory _$AvatarUploadUrlResponseCopyWith(_AvatarUploadUrlResponse value, $Res Function(_AvatarUploadUrlResponse) _then) = __$AvatarUploadUrlResponseCopyWithImpl;
@override @useResult
$Res call({
 String uploadUrl, String avatarKey, int expiresIn
});




}
/// @nodoc
class __$AvatarUploadUrlResponseCopyWithImpl<$Res>
    implements _$AvatarUploadUrlResponseCopyWith<$Res> {
  __$AvatarUploadUrlResponseCopyWithImpl(this._self, this._then);

  final _AvatarUploadUrlResponse _self;
  final $Res Function(_AvatarUploadUrlResponse) _then;

/// Create a copy of AvatarUploadUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadUrl = null,Object? avatarKey = null,Object? expiresIn = null,}) {
  return _then(_AvatarUploadUrlResponse(
uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,avatarKey: null == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
