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

@JsonKey(name: 'minimum_version') PlatformMap get minimumVersion;@JsonKey(name: 'store_urls') PlatformMap get storeUrls; Map<String, String> get message;
/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppVersionResponseCopyWith<AppVersionResponse> get copyWith => _$AppVersionResponseCopyWithImpl<AppVersionResponse>(this as AppVersionResponse, _$identity);

  /// Serializes this AppVersionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppVersionResponse&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.storeUrls, storeUrls) || other.storeUrls == storeUrls)&&const DeepCollectionEquality().equals(other.message, message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,storeUrls,const DeepCollectionEquality().hash(message));

@override
String toString() {
  return 'AppVersionResponse(minimumVersion: $minimumVersion, storeUrls: $storeUrls, message: $message)';
}


}

/// @nodoc
abstract mixin class $AppVersionResponseCopyWith<$Res>  {
  factory $AppVersionResponseCopyWith(AppVersionResponse value, $Res Function(AppVersionResponse) _then) = _$AppVersionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'minimum_version') PlatformMap minimumVersion,@JsonKey(name: 'store_urls') PlatformMap storeUrls, Map<String, String> message
});


$PlatformMapCopyWith<$Res> get minimumVersion;$PlatformMapCopyWith<$Res> get storeUrls;

}
/// @nodoc
class _$AppVersionResponseCopyWithImpl<$Res>
    implements $AppVersionResponseCopyWith<$Res> {
  _$AppVersionResponseCopyWithImpl(this._self, this._then);

  final AppVersionResponse _self;
  final $Res Function(AppVersionResponse) _then;

/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minimumVersion = null,Object? storeUrls = null,Object? message = null,}) {
  return _then(_self.copyWith(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as PlatformMap,storeUrls: null == storeUrls ? _self.storeUrls : storeUrls // ignore: cast_nullable_to_non_nullable
as PlatformMap,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}
/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformMapCopyWith<$Res> get minimumVersion {
  
  return $PlatformMapCopyWith<$Res>(_self.minimumVersion, (value) {
    return _then(_self.copyWith(minimumVersion: value));
  });
}/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformMapCopyWith<$Res> get storeUrls {
  
  return $PlatformMapCopyWith<$Res>(_self.storeUrls, (value) {
    return _then(_self.copyWith(storeUrls: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'minimum_version')  PlatformMap minimumVersion, @JsonKey(name: 'store_urls')  PlatformMap storeUrls,  Map<String, String> message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
return $default(_that.minimumVersion,_that.storeUrls,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'minimum_version')  PlatformMap minimumVersion, @JsonKey(name: 'store_urls')  PlatformMap storeUrls,  Map<String, String> message)  $default,) {final _that = this;
switch (_that) {
case _AppVersionResponse():
return $default(_that.minimumVersion,_that.storeUrls,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'minimum_version')  PlatformMap minimumVersion, @JsonKey(name: 'store_urls')  PlatformMap storeUrls,  Map<String, String> message)?  $default,) {final _that = this;
switch (_that) {
case _AppVersionResponse() when $default != null:
return $default(_that.minimumVersion,_that.storeUrls,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppVersionResponse implements AppVersionResponse {
  const _AppVersionResponse({@JsonKey(name: 'minimum_version') required this.minimumVersion, @JsonKey(name: 'store_urls') required this.storeUrls, required final  Map<String, String> message}): _message = message;
  factory _AppVersionResponse.fromJson(Map<String, dynamic> json) => _$AppVersionResponseFromJson(json);

@override@JsonKey(name: 'minimum_version') final  PlatformMap minimumVersion;
@override@JsonKey(name: 'store_urls') final  PlatformMap storeUrls;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppVersionResponse&&(identical(other.minimumVersion, minimumVersion) || other.minimumVersion == minimumVersion)&&(identical(other.storeUrls, storeUrls) || other.storeUrls == storeUrls)&&const DeepCollectionEquality().equals(other._message, _message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minimumVersion,storeUrls,const DeepCollectionEquality().hash(_message));

@override
String toString() {
  return 'AppVersionResponse(minimumVersion: $minimumVersion, storeUrls: $storeUrls, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AppVersionResponseCopyWith<$Res> implements $AppVersionResponseCopyWith<$Res> {
  factory _$AppVersionResponseCopyWith(_AppVersionResponse value, $Res Function(_AppVersionResponse) _then) = __$AppVersionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'minimum_version') PlatformMap minimumVersion,@JsonKey(name: 'store_urls') PlatformMap storeUrls, Map<String, String> message
});


@override $PlatformMapCopyWith<$Res> get minimumVersion;@override $PlatformMapCopyWith<$Res> get storeUrls;

}
/// @nodoc
class __$AppVersionResponseCopyWithImpl<$Res>
    implements _$AppVersionResponseCopyWith<$Res> {
  __$AppVersionResponseCopyWithImpl(this._self, this._then);

  final _AppVersionResponse _self;
  final $Res Function(_AppVersionResponse) _then;

/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minimumVersion = null,Object? storeUrls = null,Object? message = null,}) {
  return _then(_AppVersionResponse(
minimumVersion: null == minimumVersion ? _self.minimumVersion : minimumVersion // ignore: cast_nullable_to_non_nullable
as PlatformMap,storeUrls: null == storeUrls ? _self.storeUrls : storeUrls // ignore: cast_nullable_to_non_nullable
as PlatformMap,message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformMapCopyWith<$Res> get minimumVersion {
  
  return $PlatformMapCopyWith<$Res>(_self.minimumVersion, (value) {
    return _then(_self.copyWith(minimumVersion: value));
  });
}/// Create a copy of AppVersionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformMapCopyWith<$Res> get storeUrls {
  
  return $PlatformMapCopyWith<$Res>(_self.storeUrls, (value) {
    return _then(_self.copyWith(storeUrls: value));
  });
}
}


/// @nodoc
mixin _$PlatformMap {

 String get ios; String get android;
/// Create a copy of PlatformMap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformMapCopyWith<PlatformMap> get copyWith => _$PlatformMapCopyWithImpl<PlatformMap>(this as PlatformMap, _$identity);

  /// Serializes this PlatformMap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformMap&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'PlatformMap(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class $PlatformMapCopyWith<$Res>  {
  factory $PlatformMapCopyWith(PlatformMap value, $Res Function(PlatformMap) _then) = _$PlatformMapCopyWithImpl;
@useResult
$Res call({
 String ios, String android
});




}
/// @nodoc
class _$PlatformMapCopyWithImpl<$Res>
    implements $PlatformMapCopyWith<$Res> {
  _$PlatformMapCopyWithImpl(this._self, this._then);

  final PlatformMap _self;
  final $Res Function(PlatformMap) _then;

/// Create a copy of PlatformMap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_self.copyWith(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as String,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlatformMap].
extension PlatformMapPatterns on PlatformMap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformMap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformMap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformMap value)  $default,){
final _that = this;
switch (_that) {
case _PlatformMap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformMap value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformMap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ios,  String android)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformMap() when $default != null:
return $default(_that.ios,_that.android);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ios,  String android)  $default,) {final _that = this;
switch (_that) {
case _PlatformMap():
return $default(_that.ios,_that.android);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ios,  String android)?  $default,) {final _that = this;
switch (_that) {
case _PlatformMap() when $default != null:
return $default(_that.ios,_that.android);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformMap implements PlatformMap {
  const _PlatformMap({required this.ios, required this.android});
  factory _PlatformMap.fromJson(Map<String, dynamic> json) => _$PlatformMapFromJson(json);

@override final  String ios;
@override final  String android;

/// Create a copy of PlatformMap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformMapCopyWith<_PlatformMap> get copyWith => __$PlatformMapCopyWithImpl<_PlatformMap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformMapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformMap&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'PlatformMap(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class _$PlatformMapCopyWith<$Res> implements $PlatformMapCopyWith<$Res> {
  factory _$PlatformMapCopyWith(_PlatformMap value, $Res Function(_PlatformMap) _then) = __$PlatformMapCopyWithImpl;
@override @useResult
$Res call({
 String ios, String android
});




}
/// @nodoc
class __$PlatformMapCopyWithImpl<$Res>
    implements _$PlatformMapCopyWith<$Res> {
  __$PlatformMapCopyWithImpl(this._self, this._then);

  final _PlatformMap _self;
  final $Res Function(_PlatformMap) _then;

/// Create a copy of PlatformMap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_PlatformMap(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as String,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
