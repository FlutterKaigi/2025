// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileShare {

 String get id; String get fromId; String get toId;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of ProfileShare
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareCopyWith<ProfileShare> get copyWith => _$ProfileShareCopyWithImpl<ProfileShare>(this as ProfileShare, _$identity);

  /// Serializes this ProfileShare to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShare&&(identical(other.id, id) || other.id == id)&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.toId, toId) || other.toId == toId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromId,toId,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileShare(id: $id, fromId: $fromId, toId: $toId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileShareCopyWith<$Res>  {
  factory $ProfileShareCopyWith(ProfileShare value, $Res Function(ProfileShare) _then) = _$ProfileShareCopyWithImpl;
@useResult
$Res call({
 String id, String fromId, String toId,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$ProfileShareCopyWithImpl<$Res>
    implements $ProfileShareCopyWith<$Res> {
  _$ProfileShareCopyWithImpl(this._self, this._then);

  final ProfileShare _self;
  final $Res Function(ProfileShare) _then;

/// Create a copy of ProfileShare
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fromId = null,Object? toId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,toId: null == toId ? _self.toId : toId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileShare].
extension ProfileSharePatterns on ProfileShare {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileShare value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileShare() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileShare value)  $default,){
final _that = this;
switch (_that) {
case _ProfileShare():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileShare value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileShare() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fromId,  String toId, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileShare() when $default != null:
return $default(_that.id,_that.fromId,_that.toId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fromId,  String toId, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileShare():
return $default(_that.id,_that.fromId,_that.toId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fromId,  String toId, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileShare() when $default != null:
return $default(_that.id,_that.fromId,_that.toId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileShare implements ProfileShare {
  const _ProfileShare({required this.id, required this.fromId, required this.toId, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _ProfileShare.fromJson(Map<String, dynamic> json) => _$ProfileShareFromJson(json);

@override final  String id;
@override final  String fromId;
@override final  String toId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of ProfileShare
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileShareCopyWith<_ProfileShare> get copyWith => __$ProfileShareCopyWithImpl<_ProfileShare>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileShare&&(identical(other.id, id) || other.id == id)&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.toId, toId) || other.toId == toId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromId,toId,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileShare(id: $id, fromId: $fromId, toId: $toId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileShareCopyWith<$Res> implements $ProfileShareCopyWith<$Res> {
  factory _$ProfileShareCopyWith(_ProfileShare value, $Res Function(_ProfileShare) _then) = __$ProfileShareCopyWithImpl;
@override @useResult
$Res call({
 String id, String fromId, String toId,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$ProfileShareCopyWithImpl<$Res>
    implements _$ProfileShareCopyWith<$Res> {
  __$ProfileShareCopyWithImpl(this._self, this._then);

  final _ProfileShare _self;
  final $Res Function(_ProfileShare) _then;

/// Create a copy of ProfileShare
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fromId = null,Object? toId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProfileShare(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,toId: null == toId ? _self.toId : toId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
