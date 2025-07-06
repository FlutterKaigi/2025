// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersListRequest {

@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100') int get limit;@Assert('offset >= 0', 'offset must be greater than or equal to 0') int get offset; String? get email; List<Role>? get roles;
/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListRequestCopyWith<UsersListRequest> get copyWith => _$UsersListRequestCopyWithImpl<UsersListRequest>(this as UsersListRequest, _$identity);

  /// Serializes this UsersListRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,email,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UsersListRequest(limit: $limit, offset: $offset, email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UsersListRequestCopyWith<$Res>  {
  factory $UsersListRequestCopyWith(UsersListRequest value, $Res Function(UsersListRequest) _then) = _$UsersListRequestCopyWithImpl;
@useResult
$Res call({
@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100') int limit,@Assert('offset >= 0', 'offset must be greater than or equal to 0') int offset, String? email, List<Role>? roles
});




}
/// @nodoc
class _$UsersListRequestCopyWithImpl<$Res>
    implements $UsersListRequestCopyWith<$Res> {
  _$UsersListRequestCopyWithImpl(this._self, this._then);

  final UsersListRequest _self;
  final $Res Function(UsersListRequest) _then;

/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? offset = null,Object? email = freezed,Object? roles = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UsersListRequest implements UsersListRequest {
  const _UsersListRequest({@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100') required this.limit, @Assert('offset >= 0', 'offset must be greater than or equal to 0') required this.offset, this.email, final  List<Role>? roles}): _roles = roles;
  factory _UsersListRequest.fromJson(Map<String, dynamic> json) => _$UsersListRequestFromJson(json);

@override@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100') final  int limit;
@override@Assert('offset >= 0', 'offset must be greater than or equal to 0') final  int offset;
@override final  String? email;
 final  List<Role>? _roles;
@override List<Role>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersListRequestCopyWith<_UsersListRequest> get copyWith => __$UsersListRequestCopyWithImpl<_UsersListRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersListRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,email,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UsersListRequest(limit: $limit, offset: $offset, email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UsersListRequestCopyWith<$Res> implements $UsersListRequestCopyWith<$Res> {
  factory _$UsersListRequestCopyWith(_UsersListRequest value, $Res Function(_UsersListRequest) _then) = __$UsersListRequestCopyWithImpl;
@override @useResult
$Res call({
@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100') int limit,@Assert('offset >= 0', 'offset must be greater than or equal to 0') int offset, String? email, List<Role>? roles
});




}
/// @nodoc
class __$UsersListRequestCopyWithImpl<$Res>
    implements _$UsersListRequestCopyWith<$Res> {
  __$UsersListRequestCopyWithImpl(this._self, this._then);

  final _UsersListRequest _self;
  final $Res Function(_UsersListRequest) _then;

/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = null,Object? email = freezed,Object? roles = freezed,}) {
  return _then(_UsersListRequest(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}


}

// dart format on
