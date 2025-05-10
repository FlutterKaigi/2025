// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
