// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_put_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRolePutRequest {

 List<Role> get roles;
/// Create a copy of UserRolePutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRolePutRequestCopyWith<UserRolePutRequest> get copyWith => _$UserRolePutRequestCopyWithImpl<UserRolePutRequest>(this as UserRolePutRequest, _$identity);

  /// Serializes this UserRolePutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRolePutRequest&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserRolePutRequest(roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserRolePutRequestCopyWith<$Res>  {
  factory $UserRolePutRequestCopyWith(UserRolePutRequest value, $Res Function(UserRolePutRequest) _then) = _$UserRolePutRequestCopyWithImpl;
@useResult
$Res call({
 List<Role> roles
});




}
/// @nodoc
class _$UserRolePutRequestCopyWithImpl<$Res>
    implements $UserRolePutRequestCopyWith<$Res> {
  _$UserRolePutRequestCopyWithImpl(this._self, this._then);

  final UserRolePutRequest _self;
  final $Res Function(UserRolePutRequest) _then;

/// Create a copy of UserRolePutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roles = null,}) {
  return _then(_self.copyWith(
roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRolePutRequest].
extension UserRolePutRequestPatterns on UserRolePutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRolePutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRolePutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRolePutRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserRolePutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRolePutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserRolePutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Role> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRolePutRequest() when $default != null:
return $default(_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Role> roles)  $default,) {final _that = this;
switch (_that) {
case _UserRolePutRequest():
return $default(_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Role> roles)?  $default,) {final _that = this;
switch (_that) {
case _UserRolePutRequest() when $default != null:
return $default(_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRolePutRequest implements UserRolePutRequest {
  const _UserRolePutRequest({required final  List<Role> roles}): _roles = roles;
  factory _UserRolePutRequest.fromJson(Map<String, dynamic> json) => _$UserRolePutRequestFromJson(json);

 final  List<Role> _roles;
@override List<Role> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserRolePutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRolePutRequestCopyWith<_UserRolePutRequest> get copyWith => __$UserRolePutRequestCopyWithImpl<_UserRolePutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRolePutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRolePutRequest&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserRolePutRequest(roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserRolePutRequestCopyWith<$Res> implements $UserRolePutRequestCopyWith<$Res> {
  factory _$UserRolePutRequestCopyWith(_UserRolePutRequest value, $Res Function(_UserRolePutRequest) _then) = __$UserRolePutRequestCopyWithImpl;
@override @useResult
$Res call({
 List<Role> roles
});




}
/// @nodoc
class __$UserRolePutRequestCopyWithImpl<$Res>
    implements _$UserRolePutRequestCopyWith<$Res> {
  __$UserRolePutRequestCopyWithImpl(this._self, this._then);

  final _UserRolePutRequest _self;
  final $Res Function(_UserRolePutRequest) _then;

/// Create a copy of UserRolePutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roles = null,}) {
  return _then(_UserRolePutRequest(
roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>,
  ));
}


}

// dart format on
