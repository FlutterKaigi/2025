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

 Users get user; List<Role> get roles; AuthMetaData get authMetaData;
/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<UserAndUserRoles> get copyWith => _$UserAndUserRolesCopyWithImpl<UserAndUserRoles>(this as UserAndUserRoles, _$identity);

  /// Serializes this UserAndUserRoles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAndUserRoles&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.authMetaData, authMetaData) || other.authMetaData == authMetaData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(roles),authMetaData);

@override
String toString() {
  return 'UserAndUserRoles(user: $user, roles: $roles, authMetaData: $authMetaData)';
}


}

/// @nodoc
abstract mixin class $UserAndUserRolesCopyWith<$Res>  {
  factory $UserAndUserRolesCopyWith(UserAndUserRoles value, $Res Function(UserAndUserRoles) _then) = _$UserAndUserRolesCopyWithImpl;
@useResult
$Res call({
 Users user, List<Role> roles, AuthMetaData authMetaData
});


$UsersCopyWith<$Res> get user;$AuthMetaDataCopyWith<$Res> get authMetaData;

}
/// @nodoc
class _$UserAndUserRolesCopyWithImpl<$Res>
    implements $UserAndUserRolesCopyWith<$Res> {
  _$UserAndUserRolesCopyWithImpl(this._self, this._then);

  final UserAndUserRoles _self;
  final $Res Function(UserAndUserRoles) _then;

/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? roles = null,Object? authMetaData = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,authMetaData: null == authMetaData ? _self.authMetaData : authMetaData // ignore: cast_nullable_to_non_nullable
as AuthMetaData,
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
}/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMetaDataCopyWith<$Res> get authMetaData {
  
  return $AuthMetaDataCopyWith<$Res>(_self.authMetaData, (value) {
    return _then(_self.copyWith(authMetaData: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserAndUserRoles implements UserAndUserRoles {
  const _UserAndUserRoles({required this.user, required final  List<Role> roles, required this.authMetaData}): _roles = roles;
  factory _UserAndUserRoles.fromJson(Map<String, dynamic> json) => _$UserAndUserRolesFromJson(json);

@override final  Users user;
 final  List<Role> _roles;
@override List<Role> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  AuthMetaData authMetaData;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAndUserRoles&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.authMetaData, authMetaData) || other.authMetaData == authMetaData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_roles),authMetaData);

@override
String toString() {
  return 'UserAndUserRoles(user: $user, roles: $roles, authMetaData: $authMetaData)';
}


}

/// @nodoc
abstract mixin class _$UserAndUserRolesCopyWith<$Res> implements $UserAndUserRolesCopyWith<$Res> {
  factory _$UserAndUserRolesCopyWith(_UserAndUserRoles value, $Res Function(_UserAndUserRoles) _then) = __$UserAndUserRolesCopyWithImpl;
@override @useResult
$Res call({
 Users user, List<Role> roles, AuthMetaData authMetaData
});


@override $UsersCopyWith<$Res> get user;@override $AuthMetaDataCopyWith<$Res> get authMetaData;

}
/// @nodoc
class __$UserAndUserRolesCopyWithImpl<$Res>
    implements _$UserAndUserRolesCopyWith<$Res> {
  __$UserAndUserRolesCopyWithImpl(this._self, this._then);

  final _UserAndUserRoles _self;
  final $Res Function(_UserAndUserRoles) _then;

/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? roles = null,Object? authMetaData = null,}) {
  return _then(_UserAndUserRoles(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,authMetaData: null == authMetaData ? _self.authMetaData : authMetaData // ignore: cast_nullable_to_non_nullable
as AuthMetaData,
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
}/// Create a copy of UserAndUserRoles
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMetaDataCopyWith<$Res> get authMetaData {
  
  return $AuthMetaDataCopyWith<$Res>(_self.authMetaData, (value) {
    return _then(_self.copyWith(authMetaData: value));
  });
}
}


/// @nodoc
mixin _$AuthMetaData {

 String get email; String get avatarUrl; String get name;
/// Create a copy of AuthMetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMetaDataCopyWith<AuthMetaData> get copyWith => _$AuthMetaDataCopyWithImpl<AuthMetaData>(this as AuthMetaData, _$identity);

  /// Serializes this AuthMetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthMetaData&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,avatarUrl,name);

@override
String toString() {
  return 'AuthMetaData(email: $email, avatarUrl: $avatarUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class $AuthMetaDataCopyWith<$Res>  {
  factory $AuthMetaDataCopyWith(AuthMetaData value, $Res Function(AuthMetaData) _then) = _$AuthMetaDataCopyWithImpl;
@useResult
$Res call({
 String email, String avatarUrl, String name
});




}
/// @nodoc
class _$AuthMetaDataCopyWithImpl<$Res>
    implements $AuthMetaDataCopyWith<$Res> {
  _$AuthMetaDataCopyWithImpl(this._self, this._then);

  final AuthMetaData _self;
  final $Res Function(AuthMetaData) _then;

/// Create a copy of AuthMetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? avatarUrl = null,Object? name = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthMetaData implements AuthMetaData {
  const _AuthMetaData({required this.email, required this.avatarUrl, required this.name});
  factory _AuthMetaData.fromJson(Map<String, dynamic> json) => _$AuthMetaDataFromJson(json);

@override final  String email;
@override final  String avatarUrl;
@override final  String name;

/// Create a copy of AuthMetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthMetaDataCopyWith<_AuthMetaData> get copyWith => __$AuthMetaDataCopyWithImpl<_AuthMetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthMetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthMetaData&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,avatarUrl,name);

@override
String toString() {
  return 'AuthMetaData(email: $email, avatarUrl: $avatarUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AuthMetaDataCopyWith<$Res> implements $AuthMetaDataCopyWith<$Res> {
  factory _$AuthMetaDataCopyWith(_AuthMetaData value, $Res Function(_AuthMetaData) _then) = __$AuthMetaDataCopyWithImpl;
@override @useResult
$Res call({
 String email, String avatarUrl, String name
});




}
/// @nodoc
class __$AuthMetaDataCopyWithImpl<$Res>
    implements _$AuthMetaDataCopyWith<$Res> {
  __$AuthMetaDataCopyWithImpl(this._self, this._then);

  final _AuthMetaData _self;
  final $Res Function(_AuthMetaData) _then;

/// Create a copy of AuthMetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? avatarUrl = null,Object? name = null,}) {
  return _then(_AuthMetaData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
