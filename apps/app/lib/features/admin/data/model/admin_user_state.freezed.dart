// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserState {

 UserAndUserRoles get user; List<TicketItem> get tickets;
/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserStateCopyWith<AdminUserState> get copyWith => _$AdminUserStateCopyWithImpl<AdminUserState>(this as AdminUserState, _$identity);

  /// Serializes this AdminUserState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.tickets, tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(tickets));

@override
String toString() {
  return 'AdminUserState(user: $user, tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class $AdminUserStateCopyWith<$Res>  {
  factory $AdminUserStateCopyWith(AdminUserState value, $Res Function(AdminUserState) _then) = _$AdminUserStateCopyWithImpl;
@useResult
$Res call({
 UserAndUserRoles user, List<TicketItem> tickets
});


$UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class _$AdminUserStateCopyWithImpl<$Res>
    implements $AdminUserStateCopyWith<$Res> {
  _$AdminUserStateCopyWithImpl(this._self, this._then);

  final AdminUserState _self;
  final $Res Function(AdminUserState) _then;

/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? tickets = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItem>,
  ));
}
/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminUserState].
extension AdminUserStatePatterns on AdminUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserState value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserAndUserRoles user,  List<TicketItem> tickets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserState() when $default != null:
return $default(_that.user,_that.tickets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserAndUserRoles user,  List<TicketItem> tickets)  $default,) {final _that = this;
switch (_that) {
case _AdminUserState():
return $default(_that.user,_that.tickets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserAndUserRoles user,  List<TicketItem> tickets)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserState() when $default != null:
return $default(_that.user,_that.tickets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserState implements AdminUserState {
  const _AdminUserState({required this.user, required final  List<TicketItem> tickets}): _tickets = tickets;
  factory _AdminUserState.fromJson(Map<String, dynamic> json) => _$AdminUserStateFromJson(json);

@override final  UserAndUserRoles user;
 final  List<TicketItem> _tickets;
@override List<TicketItem> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}


/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserStateCopyWith<_AdminUserState> get copyWith => __$AdminUserStateCopyWithImpl<_AdminUserState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._tickets, _tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_tickets));

@override
String toString() {
  return 'AdminUserState(user: $user, tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class _$AdminUserStateCopyWith<$Res> implements $AdminUserStateCopyWith<$Res> {
  factory _$AdminUserStateCopyWith(_AdminUserState value, $Res Function(_AdminUserState) _then) = __$AdminUserStateCopyWithImpl;
@override @useResult
$Res call({
 UserAndUserRoles user, List<TicketItem> tickets
});


@override $UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class __$AdminUserStateCopyWithImpl<$Res>
    implements _$AdminUserStateCopyWith<$Res> {
  __$AdminUserStateCopyWithImpl(this._self, this._then);

  final _AdminUserState _self;
  final $Res Function(_AdminUserState) _then;

/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? tickets = null,}) {
  return _then(_AdminUserState(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItem>,
  ));
}

/// Create a copy of AdminUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
