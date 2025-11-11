// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_websocket_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserWebsocketPayload _$UserWebsocketPayloadFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'PROFILE_SHARE':
          return UserWebsocketProfileSharePayload.fromJson(
            json
          );
                case 'TICKET_STATUS':
          return UserWebsocketTicketStatusPayload.fromJson(
            json
          );
                case 'ENTRY_LOG':
          return UserWebsocketEntryLogPayload.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'UserWebsocketPayload',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$UserWebsocketPayload {



  /// Serializes this UserWebsocketPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketPayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserWebsocketPayload()';
}


}

/// @nodoc
class $UserWebsocketPayloadCopyWith<$Res>  {
$UserWebsocketPayloadCopyWith(UserWebsocketPayload _, $Res Function(UserWebsocketPayload) __);
}


/// Adds pattern-matching-related methods to [UserWebsocketPayload].
extension UserWebsocketPayloadPatterns on UserWebsocketPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserWebsocketProfileSharePayload value)?  profileShare,TResult Function( UserWebsocketTicketStatusPayload value)?  ticketStatus,TResult Function( UserWebsocketEntryLogPayload value)?  entryLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that);case UserWebsocketTicketStatusPayload() when ticketStatus != null:
return ticketStatus(_that);case UserWebsocketEntryLogPayload() when entryLog != null:
return entryLog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserWebsocketProfileSharePayload value)  profileShare,required TResult Function( UserWebsocketTicketStatusPayload value)  ticketStatus,required TResult Function( UserWebsocketEntryLogPayload value)  entryLog,}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload():
return profileShare(_that);case UserWebsocketTicketStatusPayload():
return ticketStatus(_that);case UserWebsocketEntryLogPayload():
return entryLog(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserWebsocketProfileSharePayload value)?  profileShare,TResult? Function( UserWebsocketTicketStatusPayload value)?  ticketStatus,TResult? Function( UserWebsocketEntryLogPayload value)?  entryLog,}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that);case UserWebsocketTicketStatusPayload() when ticketStatus != null:
return ticketStatus(_that);case UserWebsocketEntryLogPayload() when entryLog != null:
return entryLog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProfileShareWebsocketPayload profileShare)?  profileShare,TResult Function( TicketStatusPayload ticketStatus)?  ticketStatus,TResult Function( EntryLogWebsocketPayload entryLog)?  entryLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that.profileShare);case UserWebsocketTicketStatusPayload() when ticketStatus != null:
return ticketStatus(_that.ticketStatus);case UserWebsocketEntryLogPayload() when entryLog != null:
return entryLog(_that.entryLog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProfileShareWebsocketPayload profileShare)  profileShare,required TResult Function( TicketStatusPayload ticketStatus)  ticketStatus,required TResult Function( EntryLogWebsocketPayload entryLog)  entryLog,}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload():
return profileShare(_that.profileShare);case UserWebsocketTicketStatusPayload():
return ticketStatus(_that.ticketStatus);case UserWebsocketEntryLogPayload():
return entryLog(_that.entryLog);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProfileShareWebsocketPayload profileShare)?  profileShare,TResult? Function( TicketStatusPayload ticketStatus)?  ticketStatus,TResult? Function( EntryLogWebsocketPayload entryLog)?  entryLog,}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that.profileShare);case UserWebsocketTicketStatusPayload() when ticketStatus != null:
return ticketStatus(_that.ticketStatus);case UserWebsocketEntryLogPayload() when entryLog != null:
return entryLog(_that.entryLog);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UserWebsocketProfileSharePayload implements UserWebsocketPayload {
  const UserWebsocketProfileSharePayload({required this.profileShare, final  String? $type}): $type = $type ?? 'PROFILE_SHARE';
  factory UserWebsocketProfileSharePayload.fromJson(Map<String, dynamic> json) => _$UserWebsocketProfileSharePayloadFromJson(json);

 final  ProfileShareWebsocketPayload profileShare;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketProfileSharePayloadCopyWith<UserWebsocketProfileSharePayload> get copyWith => _$UserWebsocketProfileSharePayloadCopyWithImpl<UserWebsocketProfileSharePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWebsocketProfileSharePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketProfileSharePayload&&(identical(other.profileShare, profileShare) || other.profileShare == profileShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileShare);

@override
String toString() {
  return 'UserWebsocketPayload.profileShare(profileShare: $profileShare)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketProfileSharePayloadCopyWith<$Res> implements $UserWebsocketPayloadCopyWith<$Res> {
  factory $UserWebsocketProfileSharePayloadCopyWith(UserWebsocketProfileSharePayload value, $Res Function(UserWebsocketProfileSharePayload) _then) = _$UserWebsocketProfileSharePayloadCopyWithImpl;
@useResult
$Res call({
 ProfileShareWebsocketPayload profileShare
});


$ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare;

}
/// @nodoc
class _$UserWebsocketProfileSharePayloadCopyWithImpl<$Res>
    implements $UserWebsocketProfileSharePayloadCopyWith<$Res> {
  _$UserWebsocketProfileSharePayloadCopyWithImpl(this._self, this._then);

  final UserWebsocketProfileSharePayload _self;
  final $Res Function(UserWebsocketProfileSharePayload) _then;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileShare = null,}) {
  return _then(UserWebsocketProfileSharePayload(
profileShare: null == profileShare ? _self.profileShare : profileShare // ignore: cast_nullable_to_non_nullable
as ProfileShareWebsocketPayload,
  ));
}

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare {
  
  return $ProfileShareWebsocketPayloadCopyWith<$Res>(_self.profileShare, (value) {
    return _then(_self.copyWith(profileShare: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UserWebsocketTicketStatusPayload implements UserWebsocketPayload {
  const UserWebsocketTicketStatusPayload({required this.ticketStatus, final  String? $type}): $type = $type ?? 'TICKET_STATUS';
  factory UserWebsocketTicketStatusPayload.fromJson(Map<String, dynamic> json) => _$UserWebsocketTicketStatusPayloadFromJson(json);

 final  TicketStatusPayload ticketStatus;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketTicketStatusPayloadCopyWith<UserWebsocketTicketStatusPayload> get copyWith => _$UserWebsocketTicketStatusPayloadCopyWithImpl<UserWebsocketTicketStatusPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWebsocketTicketStatusPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketTicketStatusPayload&&(identical(other.ticketStatus, ticketStatus) || other.ticketStatus == ticketStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketStatus);

@override
String toString() {
  return 'UserWebsocketPayload.ticketStatus(ticketStatus: $ticketStatus)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketTicketStatusPayloadCopyWith<$Res> implements $UserWebsocketPayloadCopyWith<$Res> {
  factory $UserWebsocketTicketStatusPayloadCopyWith(UserWebsocketTicketStatusPayload value, $Res Function(UserWebsocketTicketStatusPayload) _then) = _$UserWebsocketTicketStatusPayloadCopyWithImpl;
@useResult
$Res call({
 TicketStatusPayload ticketStatus
});


$TicketStatusPayloadCopyWith<$Res> get ticketStatus;

}
/// @nodoc
class _$UserWebsocketTicketStatusPayloadCopyWithImpl<$Res>
    implements $UserWebsocketTicketStatusPayloadCopyWith<$Res> {
  _$UserWebsocketTicketStatusPayloadCopyWithImpl(this._self, this._then);

  final UserWebsocketTicketStatusPayload _self;
  final $Res Function(UserWebsocketTicketStatusPayload) _then;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticketStatus = null,}) {
  return _then(UserWebsocketTicketStatusPayload(
ticketStatus: null == ticketStatus ? _self.ticketStatus : ticketStatus // ignore: cast_nullable_to_non_nullable
as TicketStatusPayload,
  ));
}

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketStatusPayloadCopyWith<$Res> get ticketStatus {
  
  return $TicketStatusPayloadCopyWith<$Res>(_self.ticketStatus, (value) {
    return _then(_self.copyWith(ticketStatus: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UserWebsocketEntryLogPayload implements UserWebsocketPayload {
  const UserWebsocketEntryLogPayload({required this.entryLog, final  String? $type}): $type = $type ?? 'ENTRY_LOG';
  factory UserWebsocketEntryLogPayload.fromJson(Map<String, dynamic> json) => _$UserWebsocketEntryLogPayloadFromJson(json);

 final  EntryLogWebsocketPayload entryLog;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketEntryLogPayloadCopyWith<UserWebsocketEntryLogPayload> get copyWith => _$UserWebsocketEntryLogPayloadCopyWithImpl<UserWebsocketEntryLogPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWebsocketEntryLogPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketEntryLogPayload&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryLog);

@override
String toString() {
  return 'UserWebsocketPayload.entryLog(entryLog: $entryLog)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketEntryLogPayloadCopyWith<$Res> implements $UserWebsocketPayloadCopyWith<$Res> {
  factory $UserWebsocketEntryLogPayloadCopyWith(UserWebsocketEntryLogPayload value, $Res Function(UserWebsocketEntryLogPayload) _then) = _$UserWebsocketEntryLogPayloadCopyWithImpl;
@useResult
$Res call({
 EntryLogWebsocketPayload entryLog
});


$EntryLogWebsocketPayloadCopyWith<$Res> get entryLog;

}
/// @nodoc
class _$UserWebsocketEntryLogPayloadCopyWithImpl<$Res>
    implements $UserWebsocketEntryLogPayloadCopyWith<$Res> {
  _$UserWebsocketEntryLogPayloadCopyWithImpl(this._self, this._then);

  final UserWebsocketEntryLogPayload _self;
  final $Res Function(UserWebsocketEntryLogPayload) _then;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entryLog = null,}) {
  return _then(UserWebsocketEntryLogPayload(
entryLog: null == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLogWebsocketPayload,
  ));
}

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogWebsocketPayloadCopyWith<$Res> get entryLog {
  
  return $EntryLogWebsocketPayloadCopyWith<$Res>(_self.entryLog, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}
}

// dart format on
