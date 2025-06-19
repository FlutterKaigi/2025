// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersListResponse {

 List<UserAndUserRoles> get users;
/// Create a copy of UsersListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListResponseCopyWith<UsersListResponse> get copyWith => _$UsersListResponseCopyWithImpl<UsersListResponse>(this as UsersListResponse, _$identity);

  /// Serializes this UsersListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListResponse&&const DeepCollectionEquality().equals(other.users, users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users));

@override
String toString() {
  return 'UsersListResponse(users: $users)';
}


}

/// @nodoc
abstract mixin class $UsersListResponseCopyWith<$Res>  {
  factory $UsersListResponseCopyWith(UsersListResponse value, $Res Function(UsersListResponse) _then) = _$UsersListResponseCopyWithImpl;
@useResult
$Res call({
 List<UserAndUserRoles> users
});




}
/// @nodoc
class _$UsersListResponseCopyWithImpl<$Res>
    implements $UsersListResponseCopyWith<$Res> {
  _$UsersListResponseCopyWithImpl(this._self, this._then);

  final UsersListResponse _self;
  final $Res Function(UsersListResponse) _then;

/// Create a copy of UsersListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UsersListResponse implements UsersListResponse {
  const _UsersListResponse({required final  List<UserAndUserRoles> users}): _users = users;
  factory _UsersListResponse.fromJson(Map<String, dynamic> json) => _$UsersListResponseFromJson(json);

 final  List<UserAndUserRoles> _users;
@override List<UserAndUserRoles> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UsersListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersListResponseCopyWith<_UsersListResponse> get copyWith => __$UsersListResponseCopyWithImpl<_UsersListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListResponse&&const DeepCollectionEquality().equals(other._users, _users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UsersListResponse(users: $users)';
}


}

/// @nodoc
abstract mixin class _$UsersListResponseCopyWith<$Res> implements $UsersListResponseCopyWith<$Res> {
  factory _$UsersListResponseCopyWith(_UsersListResponse value, $Res Function(_UsersListResponse) _then) = __$UsersListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<UserAndUserRoles> users
});




}
/// @nodoc
class __$UsersListResponseCopyWithImpl<$Res>
    implements _$UsersListResponseCopyWith<$Res> {
  __$UsersListResponseCopyWithImpl(this._self, this._then);

  final _UsersListResponse _self;
  final $Res Function(_UsersListResponse) _then;

/// Create a copy of UsersListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_UsersListResponse(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,
  ));
}


}

// dart format on
