// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserListState {

 List<UserAndUserRoles> get users; bool get hasMore;
/// Create a copy of AdminUserListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserListStateCopyWith<AdminUserListState> get copyWith => _$AdminUserListStateCopyWithImpl<AdminUserListState>(this as AdminUserListState, _$identity);

  /// Serializes this AdminUserListState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserListState&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),hasMore);

@override
String toString() {
  return 'AdminUserListState(users: $users, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $AdminUserListStateCopyWith<$Res>  {
  factory $AdminUserListStateCopyWith(AdminUserListState value, $Res Function(AdminUserListState) _then) = _$AdminUserListStateCopyWithImpl;
@useResult
$Res call({
 List<UserAndUserRoles> users, bool hasMore
});




}
/// @nodoc
class _$AdminUserListStateCopyWithImpl<$Res>
    implements $AdminUserListStateCopyWith<$Res> {
  _$AdminUserListStateCopyWithImpl(this._self, this._then);

  final AdminUserListState _self;
  final $Res Function(AdminUserListState) _then;

/// Create a copy of AdminUserListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserListState].
extension AdminUserListStatePatterns on AdminUserListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserListState value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserListState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserAndUserRoles> users,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserListState() when $default != null:
return $default(_that.users,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserAndUserRoles> users,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _AdminUserListState():
return $default(_that.users,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserAndUserRoles> users,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserListState() when $default != null:
return $default(_that.users,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserListState implements AdminUserListState {
  const _AdminUserListState({required final  List<UserAndUserRoles> users, required this.hasMore}): _users = users;
  factory _AdminUserListState.fromJson(Map<String, dynamic> json) => _$AdminUserListStateFromJson(json);

 final  List<UserAndUserRoles> _users;
@override List<UserAndUserRoles> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  bool hasMore;

/// Create a copy of AdminUserListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserListStateCopyWith<_AdminUserListState> get copyWith => __$AdminUserListStateCopyWithImpl<_AdminUserListState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserListStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserListState&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),hasMore);

@override
String toString() {
  return 'AdminUserListState(users: $users, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$AdminUserListStateCopyWith<$Res> implements $AdminUserListStateCopyWith<$Res> {
  factory _$AdminUserListStateCopyWith(_AdminUserListState value, $Res Function(_AdminUserListState) _then) = __$AdminUserListStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserAndUserRoles> users, bool hasMore
});




}
/// @nodoc
class __$AdminUserListStateCopyWithImpl<$Res>
    implements _$AdminUserListStateCopyWith<$Res> {
  __$AdminUserListStateCopyWithImpl(this._self, this._then);

  final _AdminUserListState _self;
  final $Res Function(_AdminUserListState) _then;

/// Create a copy of AdminUserListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? hasMore = null,}) {
  return _then(_AdminUserListState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserAndUserRoles>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
