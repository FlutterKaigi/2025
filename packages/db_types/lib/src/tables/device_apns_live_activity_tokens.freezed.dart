// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_apns_live_activity_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceApnsLiveActivityTokens {

 String get deviceId; String get token; ApnsLiveActivityTokenType get type; String get topic;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of DeviceApnsLiveActivityTokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceApnsLiveActivityTokensCopyWith<DeviceApnsLiveActivityTokens> get copyWith => _$DeviceApnsLiveActivityTokensCopyWithImpl<DeviceApnsLiveActivityTokens>(this as DeviceApnsLiveActivityTokens, _$identity);

  /// Serializes this DeviceApnsLiveActivityTokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceApnsLiveActivityTokens&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.token, token) || other.token == token)&&(identical(other.type, type) || other.type == type)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,token,type,topic,createdAt,updatedAt);

@override
String toString() {
  return 'DeviceApnsLiveActivityTokens(deviceId: $deviceId, token: $token, type: $type, topic: $topic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DeviceApnsLiveActivityTokensCopyWith<$Res>  {
  factory $DeviceApnsLiveActivityTokensCopyWith(DeviceApnsLiveActivityTokens value, $Res Function(DeviceApnsLiveActivityTokens) _then) = _$DeviceApnsLiveActivityTokensCopyWithImpl;
@useResult
$Res call({
 String deviceId, String token, ApnsLiveActivityTokenType type, String topic,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$DeviceApnsLiveActivityTokensCopyWithImpl<$Res>
    implements $DeviceApnsLiveActivityTokensCopyWith<$Res> {
  _$DeviceApnsLiveActivityTokensCopyWithImpl(this._self, this._then);

  final DeviceApnsLiveActivityTokens _self;
  final $Res Function(DeviceApnsLiveActivityTokens) _then;

/// Create a copy of DeviceApnsLiveActivityTokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? token = null,Object? type = null,Object? topic = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ApnsLiveActivityTokenType,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceApnsLiveActivityTokens].
extension DeviceApnsLiveActivityTokensPatterns on DeviceApnsLiveActivityTokens {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceApnsLiveActivityTokens value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceApnsLiveActivityTokens value)  $default,){
final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceApnsLiveActivityTokens value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String token,  ApnsLiveActivityTokenType type,  String topic, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens() when $default != null:
return $default(_that.deviceId,_that.token,_that.type,_that.topic,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String token,  ApnsLiveActivityTokenType type,  String topic, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens():
return $default(_that.deviceId,_that.token,_that.type,_that.topic,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String token,  ApnsLiveActivityTokenType type,  String topic, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceApnsLiveActivityTokens() when $default != null:
return $default(_that.deviceId,_that.token,_that.type,_that.topic,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceApnsLiveActivityTokens implements DeviceApnsLiveActivityTokens {
  const _DeviceApnsLiveActivityTokens({required this.deviceId, required this.token, required this.type, required this.topic, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _DeviceApnsLiveActivityTokens.fromJson(Map<String, dynamic> json) => _$DeviceApnsLiveActivityTokensFromJson(json);

@override final  String deviceId;
@override final  String token;
@override final  ApnsLiveActivityTokenType type;
@override final  String topic;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of DeviceApnsLiveActivityTokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceApnsLiveActivityTokensCopyWith<_DeviceApnsLiveActivityTokens> get copyWith => __$DeviceApnsLiveActivityTokensCopyWithImpl<_DeviceApnsLiveActivityTokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceApnsLiveActivityTokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceApnsLiveActivityTokens&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.token, token) || other.token == token)&&(identical(other.type, type) || other.type == type)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,token,type,topic,createdAt,updatedAt);

@override
String toString() {
  return 'DeviceApnsLiveActivityTokens(deviceId: $deviceId, token: $token, type: $type, topic: $topic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceApnsLiveActivityTokensCopyWith<$Res> implements $DeviceApnsLiveActivityTokensCopyWith<$Res> {
  factory _$DeviceApnsLiveActivityTokensCopyWith(_DeviceApnsLiveActivityTokens value, $Res Function(_DeviceApnsLiveActivityTokens) _then) = __$DeviceApnsLiveActivityTokensCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String token, ApnsLiveActivityTokenType type, String topic,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$DeviceApnsLiveActivityTokensCopyWithImpl<$Res>
    implements _$DeviceApnsLiveActivityTokensCopyWith<$Res> {
  __$DeviceApnsLiveActivityTokensCopyWithImpl(this._self, this._then);

  final _DeviceApnsLiveActivityTokens _self;
  final $Res Function(_DeviceApnsLiveActivityTokens) _then;

/// Create a copy of DeviceApnsLiveActivityTokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? token = null,Object? type = null,Object? topic = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DeviceApnsLiveActivityTokens(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ApnsLiveActivityTokenType,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
