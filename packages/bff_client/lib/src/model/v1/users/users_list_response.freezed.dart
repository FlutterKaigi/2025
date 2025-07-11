// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<UserAndUserRoles> get users;/// 次の要素が存在する時に出現する
 String? get nextCursor;
/// Create a copy of UsersListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListResponseCopyWith<UsersListResponse> get copyWith => _$UsersListResponseCopyWithImpl<UsersListResponse>(this as UsersListResponse, _$identity);

  /// Serializes this UsersListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListResponse&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),nextCursor);

@override
String toString() {
  return 'UsersListResponse(users: $users, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $UsersListResponseCopyWith<$Res>  {
  factory $UsersListResponseCopyWith(UsersListResponse value, $Res Function(UsersListResponse) _then) = _$UsersListResponseCopyWithImpl;
@useResult
$Res call({
 List<UserAndUserRoles> users, String? nextCursor
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
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersListResponse].
extension UsersListResponsePatterns on UsersListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersListResponse value)  $default,){
final _that = this;
switch (_that) {
case _UsersListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UsersListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserAndUserRoles> users,  String? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersListResponse() when $default != null:
return $default(_that.users,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserAndUserRoles> users,  String? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _UsersListResponse():
return $default(_that.users,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserAndUserRoles> users,  String? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _UsersListResponse() when $default != null:
return $default(_that.users,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsersListResponse implements UsersListResponse {
  const _UsersListResponse({required final  List<UserAndUserRoles> users, this.nextCursor}): _users = users;
  factory _UsersListResponse.fromJson(Map<String, dynamic> json) => _$UsersListResponseFromJson(json);

 final  List<UserAndUserRoles> _users;
@override List<UserAndUserRoles> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

/// 次の要素が存在する時に出現する
@override final  String? nextCursor;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListResponse&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),nextCursor);

@override
String toString() {
  return 'UsersListResponse(users: $users, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$UsersListResponseCopyWith<$Res> implements $UsersListResponseCopyWith<$Res> {
  factory _$UsersListResponseCopyWith(_UsersListResponse value, $Res Function(_UsersListResponse) _then) = __$UsersListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<UserAndUserRoles> users, String? nextCursor
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
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? nextCursor = freezed,}) {
  return _then(_UsersListResponse(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
