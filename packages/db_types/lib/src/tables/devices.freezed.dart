// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Devices {

 String get id; String get userId; DeviceType get type; String get name;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of Devices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevicesCopyWith<Devices> get copyWith => _$DevicesCopyWithImpl<Devices>(this as Devices, _$identity);

  /// Serializes this Devices to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Devices&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,name,createdAt,updatedAt);

@override
String toString() {
  return 'Devices(id: $id, userId: $userId, type: $type, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DevicesCopyWith<$Res>  {
  factory $DevicesCopyWith(Devices value, $Res Function(Devices) _then) = _$DevicesCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DeviceType type, String name,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$DevicesCopyWithImpl<$Res>
    implements $DevicesCopyWith<$Res> {
  _$DevicesCopyWithImpl(this._self, this._then);

  final Devices _self;
  final $Res Function(Devices) _then;

/// Create a copy of Devices
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Devices].
extension DevicesPatterns on Devices {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Devices value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Devices() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Devices value)  $default,){
final _that = this;
switch (_that) {
case _Devices():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Devices value)?  $default,){
final _that = this;
switch (_that) {
case _Devices() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DeviceType type,  String name, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Devices() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.name,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DeviceType type,  String name, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Devices():
return $default(_that.id,_that.userId,_that.type,_that.name,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DeviceType type,  String name, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Devices() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.name,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Devices implements Devices {
  const _Devices({required this.id, required this.userId, required this.type, required this.name, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _Devices.fromJson(Map<String, dynamic> json) => _$DevicesFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DeviceType type;
@override final  String name;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of Devices
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevicesCopyWith<_Devices> get copyWith => __$DevicesCopyWithImpl<_Devices>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevicesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Devices&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,name,createdAt,updatedAt);

@override
String toString() {
  return 'Devices(id: $id, userId: $userId, type: $type, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DevicesCopyWith<$Res> implements $DevicesCopyWith<$Res> {
  factory _$DevicesCopyWith(_Devices value, $Res Function(_Devices) _then) = __$DevicesCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DeviceType type, String name,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$DevicesCopyWithImpl<$Res>
    implements _$DevicesCopyWith<$Res> {
  __$DevicesCopyWithImpl(this._self, this._then);

  final _Devices _self;
  final $Res Function(_Devices) _then;

/// Create a copy of Devices
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Devices(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
