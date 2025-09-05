// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_checkout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketCheckout {

 String get id; String get ticketTypeId; TicketCheckoutStatus get status; String get stripeCheckoutSessionId; String get stripeCheckoutUrl; DateTime get expiresAt; DateTime get createdAt; DateTime get updatedAt; String? get ticketCheckoutWorkflowId;
/// Create a copy of TicketCheckout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutCopyWith<TicketCheckout> get copyWith => _$TicketCheckoutCopyWithImpl<TicketCheckout>(this as TicketCheckout, _$identity);

  /// Serializes this TicketCheckout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckout&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripeCheckoutSessionId, stripeCheckoutSessionId) || other.stripeCheckoutSessionId == stripeCheckoutSessionId)&&(identical(other.stripeCheckoutUrl, stripeCheckoutUrl) || other.stripeCheckoutUrl == stripeCheckoutUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ticketCheckoutWorkflowId, ticketCheckoutWorkflowId) || other.ticketCheckoutWorkflowId == ticketCheckoutWorkflowId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,status,stripeCheckoutSessionId,stripeCheckoutUrl,expiresAt,createdAt,updatedAt,ticketCheckoutWorkflowId);

@override
String toString() {
  return 'TicketCheckout(id: $id, ticketTypeId: $ticketTypeId, status: $status, stripeCheckoutSessionId: $stripeCheckoutSessionId, stripeCheckoutUrl: $stripeCheckoutUrl, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, ticketCheckoutWorkflowId: $ticketCheckoutWorkflowId)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutCopyWith<$Res>  {
  factory $TicketCheckoutCopyWith(TicketCheckout value, $Res Function(TicketCheckout) _then) = _$TicketCheckoutCopyWithImpl;
@useResult
$Res call({
 String id, String ticketTypeId, TicketCheckoutStatus status, String stripeCheckoutSessionId, String stripeCheckoutUrl, DateTime expiresAt, DateTime createdAt, DateTime updatedAt, String? ticketCheckoutWorkflowId
});




}
/// @nodoc
class _$TicketCheckoutCopyWithImpl<$Res>
    implements $TicketCheckoutCopyWith<$Res> {
  _$TicketCheckoutCopyWithImpl(this._self, this._then);

  final TicketCheckout _self;
  final $Res Function(TicketCheckout) _then;

/// Create a copy of TicketCheckout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketTypeId = null,Object? status = null,Object? stripeCheckoutSessionId = null,Object? stripeCheckoutUrl = null,Object? expiresAt = null,Object? createdAt = null,Object? updatedAt = null,Object? ticketCheckoutWorkflowId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketCheckoutStatus,stripeCheckoutSessionId: null == stripeCheckoutSessionId ? _self.stripeCheckoutSessionId : stripeCheckoutSessionId // ignore: cast_nullable_to_non_nullable
as String,stripeCheckoutUrl: null == stripeCheckoutUrl ? _self.stripeCheckoutUrl : stripeCheckoutUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,ticketCheckoutWorkflowId: freezed == ticketCheckoutWorkflowId ? _self.ticketCheckoutWorkflowId : ticketCheckoutWorkflowId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketCheckout].
extension TicketCheckoutPatterns on TicketCheckout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckout value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckout value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  TicketCheckoutStatus status,  String stripeCheckoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt,  DateTime createdAt,  DateTime updatedAt,  String? ticketCheckoutWorkflowId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckout() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.status,_that.stripeCheckoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.ticketCheckoutWorkflowId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  TicketCheckoutStatus status,  String stripeCheckoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt,  DateTime createdAt,  DateTime updatedAt,  String? ticketCheckoutWorkflowId)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckout():
return $default(_that.id,_that.ticketTypeId,_that.status,_that.stripeCheckoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.ticketCheckoutWorkflowId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketTypeId,  TicketCheckoutStatus status,  String stripeCheckoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt,  DateTime createdAt,  DateTime updatedAt,  String? ticketCheckoutWorkflowId)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckout() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.status,_that.stripeCheckoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.ticketCheckoutWorkflowId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckout implements TicketCheckout {
  const _TicketCheckout({required this.id, required this.ticketTypeId, required this.status, required this.stripeCheckoutSessionId, required this.stripeCheckoutUrl, required this.expiresAt, required this.createdAt, required this.updatedAt, this.ticketCheckoutWorkflowId});
  factory _TicketCheckout.fromJson(Map<String, dynamic> json) => _$TicketCheckoutFromJson(json);

@override final  String id;
@override final  String ticketTypeId;
@override final  TicketCheckoutStatus status;
@override final  String stripeCheckoutSessionId;
@override final  String stripeCheckoutUrl;
@override final  DateTime expiresAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? ticketCheckoutWorkflowId;

/// Create a copy of TicketCheckout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutCopyWith<_TicketCheckout> get copyWith => __$TicketCheckoutCopyWithImpl<_TicketCheckout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckout&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripeCheckoutSessionId, stripeCheckoutSessionId) || other.stripeCheckoutSessionId == stripeCheckoutSessionId)&&(identical(other.stripeCheckoutUrl, stripeCheckoutUrl) || other.stripeCheckoutUrl == stripeCheckoutUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ticketCheckoutWorkflowId, ticketCheckoutWorkflowId) || other.ticketCheckoutWorkflowId == ticketCheckoutWorkflowId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,status,stripeCheckoutSessionId,stripeCheckoutUrl,expiresAt,createdAt,updatedAt,ticketCheckoutWorkflowId);

@override
String toString() {
  return 'TicketCheckout(id: $id, ticketTypeId: $ticketTypeId, status: $status, stripeCheckoutSessionId: $stripeCheckoutSessionId, stripeCheckoutUrl: $stripeCheckoutUrl, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, ticketCheckoutWorkflowId: $ticketCheckoutWorkflowId)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutCopyWith<$Res> implements $TicketCheckoutCopyWith<$Res> {
  factory _$TicketCheckoutCopyWith(_TicketCheckout value, $Res Function(_TicketCheckout) _then) = __$TicketCheckoutCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketTypeId, TicketCheckoutStatus status, String stripeCheckoutSessionId, String stripeCheckoutUrl, DateTime expiresAt, DateTime createdAt, DateTime updatedAt, String? ticketCheckoutWorkflowId
});




}
/// @nodoc
class __$TicketCheckoutCopyWithImpl<$Res>
    implements _$TicketCheckoutCopyWith<$Res> {
  __$TicketCheckoutCopyWithImpl(this._self, this._then);

  final _TicketCheckout _self;
  final $Res Function(_TicketCheckout) _then;

/// Create a copy of TicketCheckout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketTypeId = null,Object? status = null,Object? stripeCheckoutSessionId = null,Object? stripeCheckoutUrl = null,Object? expiresAt = null,Object? createdAt = null,Object? updatedAt = null,Object? ticketCheckoutWorkflowId = freezed,}) {
  return _then(_TicketCheckout(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketCheckoutStatus,stripeCheckoutSessionId: null == stripeCheckoutSessionId ? _self.stripeCheckoutSessionId : stripeCheckoutSessionId // ignore: cast_nullable_to_non_nullable
as String,stripeCheckoutUrl: null == stripeCheckoutUrl ? _self.stripeCheckoutUrl : stripeCheckoutUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,ticketCheckoutWorkflowId: freezed == ticketCheckoutWorkflowId ? _self.ticketCheckoutWorkflowId : ticketCheckoutWorkflowId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
