// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_and_user_roles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAndUserRoles {

@JsonKey(readValue: extractRootJson) Users get user; List<Role> get roles;
/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<UserAndUserRoles> get copyWith => _$UserAndUserRolesCopyWithImpl<UserAndUserRoles>(this as UserAndUserRoles, _$identity);

  /// Serializes this UserAndUserRoles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAndUserRoles&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserAndUserRoles(user: $user, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserAndUserRolesCopyWith<$Res>  {
  factory $UserAndUserRolesCopyWith(UserAndUserRoles value, $Res Function(UserAndUserRoles) _then) = _$UserAndUserRolesCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: extractRootJson) Users user, List<Role> roles
});


$UsersCopyWith<$Res> get user;

}
/// @nodoc
class _$UserAndUserRolesCopyWithImpl<$Res>
    implements $UserAndUserRolesCopyWith<$Res> {
  _$UserAndUserRolesCopyWithImpl(this._self, this._then);

  final UserAndUserRoles _self;
  final $Res Function(UserAndUserRoles) _then;

/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? roles = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}
/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsersCopyWith<$Res> get user {
  
  return $UsersCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserAndUserRoles implements UserAndUserRoles {
  const _UserAndUserRoles({@JsonKey(readValue: extractRootJson) required this.user, required final  List<Role> roles}): _roles = roles;
  factory _UserAndUserRoles.fromJson(Map<String, dynamic> json) => _$UserAndUserRolesFromJson(json);

@override@JsonKey(readValue: extractRootJson) final  Users user;
 final  List<Role> _roles;
@override List<Role> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAndUserRolesCopyWith<_UserAndUserRoles> get copyWith => __$UserAndUserRolesCopyWithImpl<_UserAndUserRoles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAndUserRolesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAndUserRoles&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserAndUserRoles(user: $user, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserAndUserRolesCopyWith<$Res> implements $UserAndUserRolesCopyWith<$Res> {
  factory _$UserAndUserRolesCopyWith(_UserAndUserRoles value, $Res Function(_UserAndUserRoles) _then) = __$UserAndUserRolesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: extractRootJson) Users user, List<Role> roles
});


@override $UsersCopyWith<$Res> get user;

}
/// @nodoc
class __$UserAndUserRolesCopyWithImpl<$Res>
    implements _$UserAndUserRolesCopyWith<$Res> {
  __$UserAndUserRolesCopyWithImpl(this._self, this._then);

  final _UserAndUserRoles _self;
  final $Res Function(_UserAndUserRoles) _then;

/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? roles = null,}) {
  return _then(_UserAndUserRoles(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}

/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsersCopyWith<$Res> get user {
  
  return $UsersCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
