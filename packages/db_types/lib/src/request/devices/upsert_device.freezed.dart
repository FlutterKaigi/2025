// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertDevice {

 String get id; String get userId; DeviceType get type; String get name;
/// Create a copy of UpsertDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpsertDeviceCopyWith<UpsertDevice> get copyWith => _$UpsertDeviceCopyWithImpl<UpsertDevice>(this as UpsertDevice, _$identity);

  /// Serializes this UpsertDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpsertDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,name);

@override
String toString() {
  return 'UpsertDevice(id: $id, userId: $userId, type: $type, name: $name)';
}


}

/// @nodoc
abstract mixin class $UpsertDeviceCopyWith<$Res>  {
  factory $UpsertDeviceCopyWith(UpsertDevice value, $Res Function(UpsertDevice) _then) = _$UpsertDeviceCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DeviceType type, String name
});




}
/// @nodoc
class _$UpsertDeviceCopyWithImpl<$Res>
    implements $UpsertDeviceCopyWith<$Res> {
  _$UpsertDeviceCopyWithImpl(this._self, this._then);

  final UpsertDevice _self;
  final $Res Function(UpsertDevice) _then;

/// Create a copy of UpsertDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpsertDevice].
extension UpsertDevicePatterns on UpsertDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpsertDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpsertDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpsertDevice value)  $default,){
final _that = this;
switch (_that) {
case _UpsertDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpsertDevice value)?  $default,){
final _that = this;
switch (_that) {
case _UpsertDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DeviceType type,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpsertDevice() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DeviceType type,  String name)  $default,) {final _that = this;
switch (_that) {
case _UpsertDevice():
return $default(_that.id,_that.userId,_that.type,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DeviceType type,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UpsertDevice() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpsertDevice implements UpsertDevice {
  const _UpsertDevice({required this.id, required this.userId, required this.type, required this.name});
  factory _UpsertDevice.fromJson(Map<String, dynamic> json) => _$UpsertDeviceFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DeviceType type;
@override final  String name;

/// Create a copy of UpsertDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpsertDeviceCopyWith<_UpsertDevice> get copyWith => __$UpsertDeviceCopyWithImpl<_UpsertDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpsertDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpsertDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,name);

@override
String toString() {
  return 'UpsertDevice(id: $id, userId: $userId, type: $type, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UpsertDeviceCopyWith<$Res> implements $UpsertDeviceCopyWith<$Res> {
  factory _$UpsertDeviceCopyWith(_UpsertDevice value, $Res Function(_UpsertDevice) _then) = __$UpsertDeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DeviceType type, String name
});




}
/// @nodoc
class __$UpsertDeviceCopyWithImpl<$Res>
    implements _$UpsertDeviceCopyWith<$Res> {
  __$UpsertDeviceCopyWithImpl(this._self, this._then);

  final _UpsertDevice _self;
  final $Res Function(_UpsertDevice) _then;

/// Create a copy of UpsertDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? name = null,}) {
  return _then(_UpsertDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
