// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_refund_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketRefundRequest {

@JsonKey(name: 'ticket_purchase_id') String get ticketPurchaseId;@JsonKey(name: 'actor_id') String get actorId;@JsonKey(name: 'actor_name') String get actorName;
/// Create a copy of TicketRefundRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketRefundRequestCopyWith<TicketRefundRequest> get copyWith => _$TicketRefundRequestCopyWithImpl<TicketRefundRequest>(this as TicketRefundRequest, _$identity);

  /// Serializes this TicketRefundRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketRefundRequest&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorName, actorName) || other.actorName == actorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId,actorId,actorName);

@override
String toString() {
  return 'TicketRefundRequest(ticketPurchaseId: $ticketPurchaseId, actorId: $actorId, actorName: $actorName)';
}


}

/// @nodoc
abstract mixin class $TicketRefundRequestCopyWith<$Res>  {
  factory $TicketRefundRequestCopyWith(TicketRefundRequest value, $Res Function(TicketRefundRequest) _then) = _$TicketRefundRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ticket_purchase_id') String ticketPurchaseId,@JsonKey(name: 'actor_id') String actorId,@JsonKey(name: 'actor_name') String actorName
});




}
/// @nodoc
class _$TicketRefundRequestCopyWithImpl<$Res>
    implements $TicketRefundRequestCopyWith<$Res> {
  _$TicketRefundRequestCopyWithImpl(this._self, this._then);

  final TicketRefundRequest _self;
  final $Res Function(TicketRefundRequest) _then;

/// Create a copy of TicketRefundRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketPurchaseId = null,Object? actorId = null,Object? actorName = null,}) {
  return _then(_self.copyWith(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketRefundRequest].
extension TicketRefundRequestPatterns on TicketRefundRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketRefundRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketRefundRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketRefundRequest value)  $default,){
final _that = this;
switch (_that) {
case _TicketRefundRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketRefundRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TicketRefundRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ticket_purchase_id')  String ticketPurchaseId, @JsonKey(name: 'actor_id')  String actorId, @JsonKey(name: 'actor_name')  String actorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketRefundRequest() when $default != null:
return $default(_that.ticketPurchaseId,_that.actorId,_that.actorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ticket_purchase_id')  String ticketPurchaseId, @JsonKey(name: 'actor_id')  String actorId, @JsonKey(name: 'actor_name')  String actorName)  $default,) {final _that = this;
switch (_that) {
case _TicketRefundRequest():
return $default(_that.ticketPurchaseId,_that.actorId,_that.actorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ticket_purchase_id')  String ticketPurchaseId, @JsonKey(name: 'actor_id')  String actorId, @JsonKey(name: 'actor_name')  String actorName)?  $default,) {final _that = this;
switch (_that) {
case _TicketRefundRequest() when $default != null:
return $default(_that.ticketPurchaseId,_that.actorId,_that.actorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketRefundRequest implements TicketRefundRequest {
  const _TicketRefundRequest({@JsonKey(name: 'ticket_purchase_id') required this.ticketPurchaseId, @JsonKey(name: 'actor_id') required this.actorId, @JsonKey(name: 'actor_name') required this.actorName});
  factory _TicketRefundRequest.fromJson(Map<String, dynamic> json) => _$TicketRefundRequestFromJson(json);

@override@JsonKey(name: 'ticket_purchase_id') final  String ticketPurchaseId;
@override@JsonKey(name: 'actor_id') final  String actorId;
@override@JsonKey(name: 'actor_name') final  String actorName;

/// Create a copy of TicketRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketRefundRequestCopyWith<_TicketRefundRequest> get copyWith => __$TicketRefundRequestCopyWithImpl<_TicketRefundRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketRefundRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketRefundRequest&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorName, actorName) || other.actorName == actorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId,actorId,actorName);

@override
String toString() {
  return 'TicketRefundRequest(ticketPurchaseId: $ticketPurchaseId, actorId: $actorId, actorName: $actorName)';
}


}

/// @nodoc
abstract mixin class _$TicketRefundRequestCopyWith<$Res> implements $TicketRefundRequestCopyWith<$Res> {
  factory _$TicketRefundRequestCopyWith(_TicketRefundRequest value, $Res Function(_TicketRefundRequest) _then) = __$TicketRefundRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ticket_purchase_id') String ticketPurchaseId,@JsonKey(name: 'actor_id') String actorId,@JsonKey(name: 'actor_name') String actorName
});




}
/// @nodoc
class __$TicketRefundRequestCopyWithImpl<$Res>
    implements _$TicketRefundRequestCopyWith<$Res> {
  __$TicketRefundRequestCopyWithImpl(this._self, this._then);

  final _TicketRefundRequest _self;
  final $Res Function(_TicketRefundRequest) _then;

/// Create a copy of TicketRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketPurchaseId = null,Object? actorId = null,Object? actorName = null,}) {
  return _then(_TicketRefundRequest(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
