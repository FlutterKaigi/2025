// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [UserAndUserRoles].
extension UserAndUserRolesPatterns on UserAndUserRoles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAndUserRoles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAndUserRoles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAndUserRoles value)  $default,){
final _that = this;
switch (_that) {
case _UserAndUserRoles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAndUserRoles value)?  $default,){
final _that = this;
switch (_that) {
case _UserAndUserRoles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Users user,  List<Role> roles,  AuthMetaData authMetaData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAndUserRoles() when $default != null:
return $default(_that.user,_that.roles,_that.authMetaData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Users user,  List<Role> roles,  AuthMetaData authMetaData)  $default,) {final _that = this;
switch (_that) {
case _UserAndUserRoles():
return $default(_that.user,_that.roles,_that.authMetaData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Users user,  List<Role> roles,  AuthMetaData authMetaData)?  $default,) {final _that = this;
switch (_that) {
case _UserAndUserRoles() when $default != null:
return $default(_that.user,_that.roles,_that.authMetaData);case _:
  return null;

}
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

 String? get email; String? get avatarUrl; String? get name; @JsonKey(name: 'is_adult') bool? get isAdult;
/// Create a copy of AuthMetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMetaDataCopyWith<AuthMetaData> get copyWith => _$AuthMetaDataCopyWithImpl<AuthMetaData>(this as AuthMetaData, _$identity);

  /// Serializes this AuthMetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is AuthMetaData &&
          (identical(other.email, email) || other.email == email) &&
          (identical(other.avatarUrl, avatarUrl) ||
              other.avatarUrl == avatarUrl) &&
          (identical(other.name, name) || other.name == name) &&
          (identical(other.isAdult, isAdult) || other.isAdult == isAdult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode =>
    Object.hash(runtimeType, email, avatarUrl, name, isAdult);

@override
String toString() {
  return 'AuthMetaData(email: $email, avatarUrl: $avatarUrl, name: $name, isAdult: $isAdult)';
}


}

/// @nodoc
abstract mixin class $AuthMetaDataCopyWith<$Res>  {
  factory $AuthMetaDataCopyWith(AuthMetaData value, $Res Function(AuthMetaData) _then) = _$AuthMetaDataCopyWithImpl;
@useResult
$Res call({
 String? email, String? avatarUrl, String? name, @JsonKey(name: 'is_adult') bool? isAdult
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
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? avatarUrl = freezed,Object? name = freezed,Object? isAdult = freezed,}) {
    return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
 as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
 as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
 as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
 as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthMetaData].
extension AuthMetaDataPatterns on AuthMetaData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthMetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthMetaData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthMetaData value)  $default,){
final _that = this;
switch (_that) {
case _AuthMetaData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthMetaData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthMetaData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? avatarUrl,  String? name,  bool? isAdult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthMetaData() when $default != null:
  return $default(_that.email,_that.avatarUrl,_that.name,_that.isAdult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? avatarUrl,  String? name,  bool? isAdult)  $default,) {final _that = this;
switch (_that) {
case _AuthMetaData():
  return $default(_that.email,_that.avatarUrl,_that.name,_that.isAdult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? avatarUrl,  String? name,  bool? isAdult)?  $default,) {final _that = this;
switch (_that) {
case _AuthMetaData() when $default != null:
  return $default(_that.email,_that.avatarUrl,_that.name,_that.isAdult);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthMetaData implements AuthMetaData {
  const _AuthMetaData(
      {this.email,
      this.avatarUrl,
      this.name,
      @JsonKey(name: 'is_adult') this.isAdult});
  factory _AuthMetaData.fromJson(Map<String, dynamic> json) => _$AuthMetaDataFromJson(json);

@override final  String? email;
@override final  String? avatarUrl;
@override final  String? name;
@override @JsonKey(name: 'is_adult') final  bool? isAdult;

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
  return identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is _AuthMetaData &&
          (identical(other.email, email) || other.email == email) &&
          (identical(other.avatarUrl, avatarUrl) ||
              other.avatarUrl == avatarUrl) &&
          (identical(other.name, name) || other.name == name) &&
          (identical(other.isAdult, isAdult) || other.isAdult == isAdult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode =>
    Object.hash(runtimeType, email, avatarUrl, name, isAdult);

@override
String toString() {
  return 'AuthMetaData(email: $email, avatarUrl: $avatarUrl, name: $name, isAdult: $isAdult)';
}


}

/// @nodoc
abstract mixin class _$AuthMetaDataCopyWith<$Res>
    implements $AuthMetaDataCopyWith<$Res> {
  factory _$AuthMetaDataCopyWith(_AuthMetaData value, $Res Function(_AuthMetaData) _then) = __$AuthMetaDataCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? avatarUrl, String? name, @JsonKey(name: 'is_adult') bool? isAdult
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
@override
@pragma('vm:prefer-inline')
$Res call(
    {Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? name = freezed,
    Object? isAdult = freezed,}) {
  return _then(_AuthMetaData(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
 as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
 as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
 as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
 as bool?,
  ));
}


}

// dart format on
