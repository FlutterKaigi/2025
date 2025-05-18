// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_get_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserGetResponse {

 Users get user;
/// Create a copy of UserGetResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserGetResponseCopyWith<UserGetResponse> get copyWith => _$UserGetResponseCopyWithImpl<UserGetResponse>(this as UserGetResponse, _$identity);

  /// Serializes this UserGetResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserGetResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserGetResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserGetResponseCopyWith<$Res>  {
  factory $UserGetResponseCopyWith(UserGetResponse value, $Res Function(UserGetResponse) _then) = _$UserGetResponseCopyWithImpl;
@useResult
$Res call({
 Users user
});


$UsersCopyWith<$Res> get user;

}
/// @nodoc
class _$UserGetResponseCopyWithImpl<$Res>
    implements $UserGetResponseCopyWith<$Res> {
  _$UserGetResponseCopyWithImpl(this._self, this._then);

  final UserGetResponse _self;
  final $Res Function(UserGetResponse) _then;

/// Create a copy of UserGetResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,
  ));
}
/// Create a copy of UserGetResponse
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

class _UserGetResponse implements UserGetResponse {
  const _UserGetResponse({required this.user});
  factory _UserGetResponse.fromJson(Map<String, dynamic> json) => _$UserGetResponseFromJson(json);

@override final  Users user;

/// Create a copy of UserGetResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserGetResponseCopyWith<_UserGetResponse> get copyWith => __$UserGetResponseCopyWithImpl<_UserGetResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserGetResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserGetResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserGetResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserGetResponseCopyWith<$Res> implements $UserGetResponseCopyWith<$Res> {
  factory _$UserGetResponseCopyWith(_UserGetResponse value, $Res Function(_UserGetResponse) _then) = __$UserGetResponseCopyWithImpl;
@override @useResult
$Res call({
 Users user
});


@override $UsersCopyWith<$Res> get user;

}
/// @nodoc
class __$UserGetResponseCopyWithImpl<$Res>
    implements _$UserGetResponseCopyWith<$Res> {
  __$UserGetResponseCopyWithImpl(this._self, this._then);

  final _UserGetResponse _self;
  final $Res Function(_UserGetResponse) _then;

/// Create a copy of UserGetResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UserGetResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,
  ));
}

/// Create a copy of UserGetResponse
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
