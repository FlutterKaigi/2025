// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListResponse {

 List<UserListItem> get users;@JsonKey(name: 'total_count') int get totalCount; int get page;@JsonKey(name: 'page_size') int get pageSize;
/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListResponseCopyWith<UserListResponse> get copyWith => _$UserListResponseCopyWithImpl<UserListResponse>(this as UserListResponse, _$identity);

  /// Serializes this UserListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListResponse&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),totalCount,page,pageSize);

@override
String toString() {
  return 'UserListResponse(users: $users, totalCount: $totalCount, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $UserListResponseCopyWith<$Res>  {
  factory $UserListResponseCopyWith(UserListResponse value, $Res Function(UserListResponse) _then) = _$UserListResponseCopyWithImpl;
@useResult
$Res call({
 List<UserListItem> users,@JsonKey(name: 'total_count') int totalCount, int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class _$UserListResponseCopyWithImpl<$Res>
    implements $UserListResponseCopyWith<$Res> {
  _$UserListResponseCopyWithImpl(this._self, this._then);

  final UserListResponse _self;
  final $Res Function(UserListResponse) _then;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? totalCount = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserListItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserListResponse implements UserListResponse {
  const _UserListResponse({required final  List<UserListItem> users, @JsonKey(name: 'total_count') required this.totalCount, required this.page, @JsonKey(name: 'page_size') required this.pageSize}): _users = users;
  factory _UserListResponse.fromJson(Map<String, dynamic> json) => _$UserListResponseFromJson(json);

 final  List<UserListItem> _users;
@override List<UserListItem> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey(name: 'total_count') final  int totalCount;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListResponseCopyWith<_UserListResponse> get copyWith => __$UserListResponseCopyWithImpl<_UserListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListResponse&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),totalCount,page,pageSize);

@override
String toString() {
  return 'UserListResponse(users: $users, totalCount: $totalCount, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$UserListResponseCopyWith<$Res> implements $UserListResponseCopyWith<$Res> {
  factory _$UserListResponseCopyWith(_UserListResponse value, $Res Function(_UserListResponse) _then) = __$UserListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<UserListItem> users,@JsonKey(name: 'total_count') int totalCount, int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class __$UserListResponseCopyWithImpl<$Res>
    implements _$UserListResponseCopyWith<$Res> {
  __$UserListResponseCopyWithImpl(this._self, this._then);

  final _UserListResponse _self;
  final $Res Function(_UserListResponse) _then;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? totalCount = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_UserListResponse(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserListItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
