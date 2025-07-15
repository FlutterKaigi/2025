// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_checkout_session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketCheckoutSessionResponse {

 TicketCheckoutSessions get session;
/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutSessionResponseCopyWith<TicketCheckoutSessionResponse> get copyWith => _$TicketCheckoutSessionResponseCopyWithImpl<TicketCheckoutSessionResponse>(this as TicketCheckoutSessionResponse, _$identity);

  /// Serializes this TicketCheckoutSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutSessionResponse&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'TicketCheckoutSessionResponse(session: $session)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutSessionResponseCopyWith<$Res>  {
  factory $TicketCheckoutSessionResponseCopyWith(TicketCheckoutSessionResponse value, $Res Function(TicketCheckoutSessionResponse) _then) = _$TicketCheckoutSessionResponseCopyWithImpl;
@useResult
$Res call({
 TicketCheckoutSessions session
});


$TicketCheckoutSessionsCopyWith<$Res> get session;

}
/// @nodoc
class _$TicketCheckoutSessionResponseCopyWithImpl<$Res>
    implements $TicketCheckoutSessionResponseCopyWith<$Res> {
  _$TicketCheckoutSessionResponseCopyWithImpl(this._self, this._then);

  final TicketCheckoutSessionResponse _self;
  final $Res Function(TicketCheckoutSessionResponse) _then;

/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions,
  ));
}
/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res> get session {
  
  return $TicketCheckoutSessionsCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketCheckoutSessionResponse].
extension TicketCheckoutSessionResponsePatterns on TicketCheckoutSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckoutSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckoutSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckoutSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketCheckoutSessions session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse() when $default != null:
return $default(_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketCheckoutSessions session)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse():
return $default(_that.session);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketCheckoutSessions session)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutSessionResponse() when $default != null:
return $default(_that.session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutSessionResponse implements TicketCheckoutSessionResponse {
  const _TicketCheckoutSessionResponse({required this.session});
  factory _TicketCheckoutSessionResponse.fromJson(Map<String, dynamic> json) => _$TicketCheckoutSessionResponseFromJson(json);

@override final  TicketCheckoutSessions session;

/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutSessionResponseCopyWith<_TicketCheckoutSessionResponse> get copyWith => __$TicketCheckoutSessionResponseCopyWithImpl<_TicketCheckoutSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutSessionResponse&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'TicketCheckoutSessionResponse(session: $session)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutSessionResponseCopyWith<$Res> implements $TicketCheckoutSessionResponseCopyWith<$Res> {
  factory _$TicketCheckoutSessionResponseCopyWith(_TicketCheckoutSessionResponse value, $Res Function(_TicketCheckoutSessionResponse) _then) = __$TicketCheckoutSessionResponseCopyWithImpl;
@override @useResult
$Res call({
 TicketCheckoutSessions session
});


@override $TicketCheckoutSessionsCopyWith<$Res> get session;

}
/// @nodoc
class __$TicketCheckoutSessionResponseCopyWithImpl<$Res>
    implements _$TicketCheckoutSessionResponseCopyWith<$Res> {
  __$TicketCheckoutSessionResponseCopyWithImpl(this._self, this._then);

  final _TicketCheckoutSessionResponse _self;
  final $Res Function(_TicketCheckoutSessionResponse) _then;

/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_TicketCheckoutSessionResponse(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions,
  ));
}

/// Create a copy of TicketCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res> get session {
  
  return $TicketCheckoutSessionsCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
