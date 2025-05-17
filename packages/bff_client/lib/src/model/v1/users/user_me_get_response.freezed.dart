// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_me_get_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMeGetResponse {

 Users get user;
/// Create a copy of UserMeGetResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMeGetResponseCopyWith<UserMeGetResponse> get copyWith => _$UserMeGetResponseCopyWithImpl<UserMeGetResponse>(this as UserMeGetResponse, _$identity);

  /// Serializes this UserMeGetResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMeGetResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserMeGetResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserMeGetResponseCopyWith<$Res>  {
  factory $UserMeGetResponseCopyWith(UserMeGetResponse value, $Res Function(UserMeGetResponse) _then) = _$UserMeGetResponseCopyWithImpl;
@useResult
$Res call({
 Users user
});


$UsersCopyWith<$Res> get user;

}
/// @nodoc
class _$UserMeGetResponseCopyWithImpl<$Res>
    implements $UserMeGetResponseCopyWith<$Res> {
  _$UserMeGetResponseCopyWithImpl(this._self, this._then);

  final UserMeGetResponse _self;
  final $Res Function(UserMeGetResponse) _then;

/// Create a copy of UserMeGetResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,
  ));
}
/// Create a copy of UserMeGetResponse
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

class _UserMeGetResponse implements UserMeGetResponse {
  const _UserMeGetResponse({required this.user});
  factory _UserMeGetResponse.fromJson(Map<String, dynamic> json) => _$UserMeGetResponseFromJson(json);

@override final  Users user;

/// Create a copy of UserMeGetResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMeGetResponseCopyWith<_UserMeGetResponse> get copyWith => __$UserMeGetResponseCopyWithImpl<_UserMeGetResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMeGetResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMeGetResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserMeGetResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserMeGetResponseCopyWith<$Res> implements $UserMeGetResponseCopyWith<$Res> {
  factory _$UserMeGetResponseCopyWith(_UserMeGetResponse value, $Res Function(_UserMeGetResponse) _then) = __$UserMeGetResponseCopyWithImpl;
@override @useResult
$Res call({
 Users user
});


@override $UsersCopyWith<$Res> get user;

}
/// @nodoc
class __$UserMeGetResponseCopyWithImpl<$Res>
    implements _$UserMeGetResponseCopyWith<$Res> {
  __$UserMeGetResponseCopyWithImpl(this._self, this._then);

  final _UserMeGetResponse _self;
  final $Res Function(_UserMeGetResponse) _then;

/// Create a copy of UserMeGetResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UserMeGetResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Users,
  ));
}

/// Create a copy of UserMeGetResponse
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
