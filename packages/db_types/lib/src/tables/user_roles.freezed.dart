// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_roles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRoles {

 String get userId; Role get role; DateTime get createdAt;
/// Create a copy of UserRoles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRolesCopyWith<UserRoles> get copyWith => _$UserRolesCopyWithImpl<UserRoles>(this as UserRoles, _$identity);

  /// Serializes this UserRoles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoles&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,role,createdAt);

@override
String toString() {
  return 'UserRoles(userId: $userId, role: $role, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserRolesCopyWith<$Res>  {
  factory $UserRolesCopyWith(UserRoles value, $Res Function(UserRoles) _then) = _$UserRolesCopyWithImpl;
@useResult
$Res call({
 String userId, Role role, DateTime createdAt
});




}
/// @nodoc
class _$UserRolesCopyWithImpl<$Res>
    implements $UserRolesCopyWith<$Res> {
  _$UserRolesCopyWithImpl(this._self, this._then);

  final UserRoles _self;
  final $Res Function(UserRoles) _then;

/// Create a copy of UserRoles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? role = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRoles].
extension UserRolesPatterns on UserRoles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoles value)  $default,){
final _that = this;
switch (_that) {
case _UserRoles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoles value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  Role role,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoles() when $default != null:
return $default(_that.userId,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  Role role,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserRoles():
return $default(_that.userId,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  Role role,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserRoles() when $default != null:
return $default(_that.userId,_that.role,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRoles implements UserRoles {
  const _UserRoles({required this.userId, required this.role, required this.createdAt});
  factory _UserRoles.fromJson(Map<String, dynamic> json) => _$UserRolesFromJson(json);

@override final  String userId;
@override final  Role role;
@override final  DateTime createdAt;

/// Create a copy of UserRoles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRolesCopyWith<_UserRoles> get copyWith => __$UserRolesCopyWithImpl<_UserRoles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRolesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoles&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,role,createdAt);

@override
String toString() {
  return 'UserRoles(userId: $userId, role: $role, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserRolesCopyWith<$Res> implements $UserRolesCopyWith<$Res> {
  factory _$UserRolesCopyWith(_UserRoles value, $Res Function(_UserRoles) _then) = __$UserRolesCopyWithImpl;
@override @useResult
$Res call({
 String userId, Role role, DateTime createdAt
});




}
/// @nodoc
class __$UserRolesCopyWithImpl<$Res>
    implements _$UserRolesCopyWith<$Res> {
  __$UserRolesCopyWithImpl(this._self, this._then);

  final _UserRoles _self;
  final $Res Function(_UserRoles) _then;

/// Create a copy of UserRoles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? role = null,Object? createdAt = null,}) {
  return _then(_UserRoles(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
