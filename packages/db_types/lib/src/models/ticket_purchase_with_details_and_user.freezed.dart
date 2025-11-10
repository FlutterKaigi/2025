// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchase_with_details_and_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketPurchaseWithDetailsAndUser {

 TicketPurchases? get purchase; TicketCheckoutSessions? get checkoutSession; String get ticketTypeId; List<TicketOptions> get options; EntryLogs? get entryLog; UserAndUserRoles get user;
/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseWithDetailsAndUserCopyWith<TicketPurchaseWithDetailsAndUser> get copyWith => _$TicketPurchaseWithDetailsAndUserCopyWithImpl<TicketPurchaseWithDetailsAndUser>(this as TicketPurchaseWithDetailsAndUser, _$identity);

  /// Serializes this TicketPurchaseWithDetailsAndUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseWithDetailsAndUser&&(identical(other.purchase, purchase) || other.purchase == purchase)&&(identical(other.checkoutSession, checkoutSession) || other.checkoutSession == checkoutSession)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purchase,checkoutSession,ticketTypeId,const DeepCollectionEquality().hash(options),entryLog,user);

@override
String toString() {
  return 'TicketPurchaseWithDetailsAndUser(purchase: $purchase, checkoutSession: $checkoutSession, ticketTypeId: $ticketTypeId, options: $options, entryLog: $entryLog, user: $user)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseWithDetailsAndUserCopyWith<$Res>  {
  factory $TicketPurchaseWithDetailsAndUserCopyWith(TicketPurchaseWithDetailsAndUser value, $Res Function(TicketPurchaseWithDetailsAndUser) _then) = _$TicketPurchaseWithDetailsAndUserCopyWithImpl;
@useResult
$Res call({
 TicketPurchases? purchase, TicketCheckoutSessions? checkoutSession, String ticketTypeId, List<TicketOptions> options, EntryLogs? entryLog, UserAndUserRoles user
});


$TicketPurchasesCopyWith<$Res>? get purchase;$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession;$EntryLogsCopyWith<$Res>? get entryLog;$UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class _$TicketPurchaseWithDetailsAndUserCopyWithImpl<$Res>
    implements $TicketPurchaseWithDetailsAndUserCopyWith<$Res> {
  _$TicketPurchaseWithDetailsAndUserCopyWithImpl(this._self, this._then);

  final TicketPurchaseWithDetailsAndUser _self;
  final $Res Function(TicketPurchaseWithDetailsAndUser) _then;

/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchase = freezed,Object? checkoutSession = freezed,Object? ticketTypeId = null,Object? options = null,Object? entryLog = freezed,Object? user = null,}) {
  return _then(_self.copyWith(
purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchases?,checkoutSession: freezed == checkoutSession ? _self.checkoutSession : checkoutSession // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions?,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,entryLog: freezed == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLogs?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,
  ));
}
/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchasesCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $TicketPurchasesCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession {
    if (_self.checkoutSession == null) {
    return null;
  }

  return $TicketCheckoutSessionsCopyWith<$Res>(_self.checkoutSession!, (value) {
    return _then(_self.copyWith(checkoutSession: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogsCopyWith<$Res>? get entryLog {
    if (_self.entryLog == null) {
    return null;
  }

  return $EntryLogsCopyWith<$Res>(_self.entryLog!, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketPurchaseWithDetailsAndUser].
extension TicketPurchaseWithDetailsAndUserPatterns on TicketPurchaseWithDetailsAndUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchaseWithDetailsAndUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchaseWithDetailsAndUser value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchaseWithDetailsAndUser value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog,  UserAndUserRoles user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser() when $default != null:
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog,  UserAndUserRoles user)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser():
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog,  UserAndUserRoles user)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetailsAndUser() when $default != null:
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketPurchaseWithDetailsAndUser implements TicketPurchaseWithDetailsAndUser {
  const _TicketPurchaseWithDetailsAndUser({this.purchase, this.checkoutSession, required this.ticketTypeId, required final  List<TicketOptions> options, this.entryLog, required this.user}): _options = options;
  factory _TicketPurchaseWithDetailsAndUser.fromJson(Map<String, dynamic> json) => _$TicketPurchaseWithDetailsAndUserFromJson(json);

@override final  TicketPurchases? purchase;
@override final  TicketCheckoutSessions? checkoutSession;
@override final  String ticketTypeId;
 final  List<TicketOptions> _options;
@override List<TicketOptions> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  EntryLogs? entryLog;
@override final  UserAndUserRoles user;

/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchaseWithDetailsAndUserCopyWith<_TicketPurchaseWithDetailsAndUser> get copyWith => __$TicketPurchaseWithDetailsAndUserCopyWithImpl<_TicketPurchaseWithDetailsAndUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseWithDetailsAndUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchaseWithDetailsAndUser&&(identical(other.purchase, purchase) || other.purchase == purchase)&&(identical(other.checkoutSession, checkoutSession) || other.checkoutSession == checkoutSession)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purchase,checkoutSession,ticketTypeId,const DeepCollectionEquality().hash(_options),entryLog,user);

@override
String toString() {
  return 'TicketPurchaseWithDetailsAndUser(purchase: $purchase, checkoutSession: $checkoutSession, ticketTypeId: $ticketTypeId, options: $options, entryLog: $entryLog, user: $user)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchaseWithDetailsAndUserCopyWith<$Res> implements $TicketPurchaseWithDetailsAndUserCopyWith<$Res> {
  factory _$TicketPurchaseWithDetailsAndUserCopyWith(_TicketPurchaseWithDetailsAndUser value, $Res Function(_TicketPurchaseWithDetailsAndUser) _then) = __$TicketPurchaseWithDetailsAndUserCopyWithImpl;
@override @useResult
$Res call({
 TicketPurchases? purchase, TicketCheckoutSessions? checkoutSession, String ticketTypeId, List<TicketOptions> options, EntryLogs? entryLog, UserAndUserRoles user
});


@override $TicketPurchasesCopyWith<$Res>? get purchase;@override $TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession;@override $EntryLogsCopyWith<$Res>? get entryLog;@override $UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class __$TicketPurchaseWithDetailsAndUserCopyWithImpl<$Res>
    implements _$TicketPurchaseWithDetailsAndUserCopyWith<$Res> {
  __$TicketPurchaseWithDetailsAndUserCopyWithImpl(this._self, this._then);

  final _TicketPurchaseWithDetailsAndUser _self;
  final $Res Function(_TicketPurchaseWithDetailsAndUser) _then;

/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchase = freezed,Object? checkoutSession = freezed,Object? ticketTypeId = null,Object? options = null,Object? entryLog = freezed,Object? user = null,}) {
  return _then(_TicketPurchaseWithDetailsAndUser(
purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchases?,checkoutSession: freezed == checkoutSession ? _self.checkoutSession : checkoutSession // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions?,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,entryLog: freezed == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLogs?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,
  ));
}

/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchasesCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $TicketPurchasesCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession {
    if (_self.checkoutSession == null) {
    return null;
  }

  return $TicketCheckoutSessionsCopyWith<$Res>(_self.checkoutSession!, (value) {
    return _then(_self.copyWith(checkoutSession: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogsCopyWith<$Res>? get entryLog {
    if (_self.entryLog == null) {
    return null;
  }

  return $EntryLogsCopyWith<$Res>(_self.entryLog!, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}/// Create a copy of TicketPurchaseWithDetailsAndUser
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
