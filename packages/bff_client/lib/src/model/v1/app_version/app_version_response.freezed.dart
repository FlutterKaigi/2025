// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppVersionResponse {

@JsonKey(name: 'minimum_version') String get minimumVersion;@JsonKey(name: 'latest_version') String get latestVersion;@JsonKey(name: 'store_urls') Map<String, String> get storeUrls; Map<String, String> get message;
/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppVersionResponseCopyWith<AppVersionResponse> get copyWith => _$AppVersionResponseCopyWithImpl<AppVersionResponse>(this as AppVersionResponse, _$identity);

  /// Serializes this AppVersionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppVersionResponse&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&const DeepCollectionEquality().equals(other.storeUrls, storeUrls)&&const DeepCollectionEquality().equals(other.message, message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,latestVersion,const DeepCollectionEquality().hash(storeUrls),const DeepCollectionEquality().hash(message));

@override
String toString() {
  return 'AppVersionResponse(minimumVersion: $minimumVersion, latestVersion: $latestVersion, storeUrls: $storeUrls, message: $message)';
}


}

/// @nodoc
abstract mixin class $AppVersionResponseCopyWith<$Res>  {
  factory $AppVersionResponseCopyWith(AppVersionResponse value, $Res Function(AppVersionResponse) _then) = _$AppVersionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'minimum_version') String minimumVersion,@JsonKey(name: 'latest_version') String latestVersion,@JsonKey(name: 'store_urls') Map<String, String> storeUrls, Map<String, String> message
});




}
/// @nodoc
class _$AppVersionResponseCopyWithImpl<$Res>
    implements $AppVersionResponseCopyWith<$Res> {
  _$AppVersionResponseCopyWithImpl(this._self, this._then);

  final AppVersionResponse _self;
  final $Res Function(AppVersionResponse) _then;

/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? storeUrls = null,Object? message = null,}) {
  return _then(_self.copyWith(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrls: null == storeUrls ? _self.storeUrls : storeUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppVersionResponse].
extension AppVersionResponsePatterns on AppVersionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppVersionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppVersionResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppVersionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppVersionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'minimum_version')  String minimumVersion, @JsonKey(name: 'latest_version')  String latestVersion, @JsonKey(name: 'store_urls')  Map<String, String> storeUrls,  Map<String, String> message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.storeUrls,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'minimum_version')  String minimumVersion, @JsonKey(name: 'latest_version')  String latestVersion, @JsonKey(name: 'store_urls')  Map<String, String> storeUrls,  Map<String, String> message)  $default,) {final _that = this;
switch (_that) {
case _AppVersionResponse():
return $default(_that.minimumVersion,_that.latestVersion,_that.storeUrls,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'minimum_version')  String minimumVersion, @JsonKey(name: 'latest_version')  String latestVersion, @JsonKey(name: 'store_urls')  Map<String, String> storeUrls,  Map<String, String> message)?  $default,) {final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
return $default(_that.minimumVersion,_that.latestVersion,_that.storeUrls,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppVersionResponse implements AppVersionResponse {
  const _AppVersionResponse({@JsonKey(name: 'minimum_version') required this.minimumVersion, @JsonKey(name: 'latest_version') required this.latestVersion, @JsonKey(name: 'store_urls') required final  Map<String, String> storeUrls, required final  Map<String, String> message}): _storeUrls = storeUrls,_message = message;
  factory _AppVersionResponse.fromJson(Map<String, dynamic> json) => _$AppVersionResponseFromJson(json);

@override@JsonKey(name: 'minimum_version') final  String minimumVersion;
@override@JsonKey(name: 'latest_version') final  String latestVersion;
 final  Map<String, String> _storeUrls;
@override@JsonKey(name: 'store_urls') Map<String, String> get storeUrls {
  if (_storeUrls is EqualUnmodifiableMapView) return _storeUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_storeUrls);
}

 final  Map<String, String> _message;
@override Map<String, String> get message {
  if (_message is EqualUnmodifiableMapView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_message);
}


/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppVersionResponseCopyWith<_AppVersionResponse> get copyWith => __$AppVersionResponseCopyWithImpl<_AppVersionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppVersionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppVersionResponse&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&const DeepCollectionEquality().equals(other._storeUrls, _storeUrls)&&const DeepCollectionEquality().equals(other._message, _message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,latestVersion,const DeepCollectionEquality().hash(_storeUrls),const DeepCollectionEquality().hash(_message));

@override
String toString() {
  return 'AppVersionResponse(minimumVersion: $minimumVersion, latestVersion: $latestVersion, storeUrls: $storeUrls, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AppVersionResponseCopyWith<$Res> implements $AppVersionResponseCopyWith<$Res> {
  factory _$AppVersionResponseCopyWith(_AppVersionResponse value, $Res Function(_AppVersionResponse) _then) = __$AppVersionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'minimum_version') String minimumVersion,@JsonKey(name: 'latest_version') String latestVersion,@JsonKey(name: 'store_urls') Map<String, String> storeUrls, Map<String, String> message
});




}
/// @nodoc
class __$AppVersionResponseCopyWithImpl<$Res>
    implements _$AppVersionResponseCopyWith<$Res> {
  __$AppVersionResponseCopyWithImpl(this._self, this._then);

  final _AppVersionResponse _self;
  final $Res Function(_AppVersionResponse) _then;

/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumVersion = null,Object? latestVersion = null,Object? storeUrls = null,Object? message = null,}) {
  return _then(_AppVersionResponse(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrls: null == storeUrls ? _self._storeUrls : storeUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
