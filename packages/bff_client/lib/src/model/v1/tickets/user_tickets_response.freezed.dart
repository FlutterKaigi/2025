// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tickets_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTicketsResponse {

 List<TicketPurchases> get tickets; List<TicketCheckoutSessions> get ticketCheckouts;
/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTicketsResponseCopyWith<UserTicketsResponse> get copyWith => _$UserTicketsResponseCopyWithImpl<UserTicketsResponse>(this as UserTicketsResponse, _$identity);

  /// Serializes this UserTicketsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTicketsResponse&&const DeepCollectionEquality().equals(other.tickets, tickets)&&const DeepCollectionEquality().equals(other.ticketCheckouts, ticketCheckouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets),const DeepCollectionEquality().hash(ticketCheckouts));

@override
String toString() {
  return 'UserTicketsResponse(tickets: $tickets, ticketCheckouts: $ticketCheckouts)';
}


}

/// @nodoc
abstract mixin class $UserTicketsResponseCopyWith<$Res>  {
  factory $UserTicketsResponseCopyWith(UserTicketsResponse value, $Res Function(UserTicketsResponse) _then) = _$UserTicketsResponseCopyWithImpl;
@useResult
$Res call({
 List<TicketPurchases> tickets, List<TicketCheckoutSessions> ticketCheckouts
});




}
/// @nodoc
class _$UserTicketsResponseCopyWithImpl<$Res>
    implements $UserTicketsResponseCopyWith<$Res> {
  _$UserTicketsResponseCopyWithImpl(this._self, this._then);

  final UserTicketsResponse _self;
  final $Res Function(UserTicketsResponse) _then;

/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,Object? ticketCheckouts = null,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketPurchases>,ticketCheckouts: null == ticketCheckouts ? _self.ticketCheckouts : ticketCheckouts // ignore: cast_nullable_to_non_nullable
as List<TicketCheckoutSessions>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTicketsResponse].
extension UserTicketsResponsePatterns on UserTicketsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTicketsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTicketsResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserTicketsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTicketsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketPurchases> tickets,  List<TicketCheckoutSessions> ticketCheckouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
return $default(_that.tickets,_that.ticketCheckouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketPurchases> tickets,  List<TicketCheckoutSessions> ticketCheckouts)  $default,) {final _that = this;
switch (_that) {
case _UserTicketsResponse():
return $default(_that.tickets,_that.ticketCheckouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketPurchases> tickets,  List<TicketCheckoutSessions> ticketCheckouts)?  $default,) {final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
return $default(_that.tickets,_that.ticketCheckouts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTicketsResponse implements UserTicketsResponse {
  const _UserTicketsResponse({required final  List<TicketPurchases> tickets, required final  List<TicketCheckoutSessions> ticketCheckouts}): _tickets = tickets,_ticketCheckouts = ticketCheckouts;
  factory _UserTicketsResponse.fromJson(Map<String, dynamic> json) => _$UserTicketsResponseFromJson(json);

 final  List<TicketPurchases> _tickets;
@override List<TicketPurchases> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

 final  List<TicketCheckoutSessions> _ticketCheckouts;
@override List<TicketCheckoutSessions> get ticketCheckouts {
  if (_ticketCheckouts is EqualUnmodifiableListView) return _ticketCheckouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketCheckouts);
}


/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTicketsResponseCopyWith<_UserTicketsResponse> get copyWith => __$UserTicketsResponseCopyWithImpl<_UserTicketsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTicketsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTicketsResponse&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&const DeepCollectionEquality().equals(other._ticketCheckouts, _ticketCheckouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets),const DeepCollectionEquality().hash(_ticketCheckouts));

@override
String toString() {
  return 'UserTicketsResponse(tickets: $tickets, ticketCheckouts: $ticketCheckouts)';
}


}

/// @nodoc
abstract mixin class _$UserTicketsResponseCopyWith<$Res> implements $UserTicketsResponseCopyWith<$Res> {
  factory _$UserTicketsResponseCopyWith(_UserTicketsResponse value, $Res Function(_UserTicketsResponse) _then) = __$UserTicketsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TicketPurchases> tickets, List<TicketCheckoutSessions> ticketCheckouts
});




}
/// @nodoc
class __$UserTicketsResponseCopyWithImpl<$Res>
    implements _$UserTicketsResponseCopyWith<$Res> {
  __$UserTicketsResponseCopyWithImpl(this._self, this._then);

  final _UserTicketsResponse _self;
  final $Res Function(_UserTicketsResponse) _then;

/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,Object? ticketCheckouts = null,}) {
  return _then(_UserTicketsResponse(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketPurchases>,ticketCheckouts: null == ticketCheckouts ? _self._ticketCheckouts : ticketCheckouts // ignore: cast_nullable_to_non_nullable
as List<TicketCheckoutSessions>,
  ));
}


}

// dart format on
