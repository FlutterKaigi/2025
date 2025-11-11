// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_status_websocket_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketStatusPayload {

 String get id; String get userId; String get ticketTypeId; TicketStatusType get status; String? get stripePaymentIntentId; String? get nameplateId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TicketStatusPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketStatusPayloadCopyWith<TicketStatusPayload> get copyWith => _$TicketStatusPayloadCopyWithImpl<TicketStatusPayload>(this as TicketStatusPayload, _$identity);

  /// Serializes this TicketStatusPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketStatusPayload&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.nameplateId, nameplateId) || other.nameplateId == nameplateId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,nameplateId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketStatusPayload(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, nameplateId: $nameplateId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketStatusPayloadCopyWith<$Res>  {
  factory $TicketStatusPayloadCopyWith(TicketStatusPayload value, $Res Function(TicketStatusPayload) _then) = _$TicketStatusPayloadCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketStatusType status, String? stripePaymentIntentId, String? nameplateId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TicketStatusPayloadCopyWithImpl<$Res>
    implements $TicketStatusPayloadCopyWith<$Res> {
  _$TicketStatusPayloadCopyWithImpl(this._self, this._then);

  final TicketStatusPayload _self;
  final $Res Function(TicketStatusPayload) _then;

/// Create a copy of TicketStatusPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? nameplateId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatusType,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,nameplateId: freezed == nameplateId ? _self.nameplateId : nameplateId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketStatusPayload].
extension TicketStatusPayloadPatterns on TicketStatusPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketStatusPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketStatusPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketStatusPayload value)  $default,){
final _that = this;
switch (_that) {
case _TicketStatusPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketStatusPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TicketStatusPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketStatusType status,  String? stripePaymentIntentId,  String? nameplateId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketStatusPayload() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.nameplateId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketStatusType status,  String? stripePaymentIntentId,  String? nameplateId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketStatusPayload():
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.nameplateId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String ticketTypeId,  TicketStatusType status,  String? stripePaymentIntentId,  String? nameplateId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketStatusPayload() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.nameplateId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketStatusPayload implements TicketStatusPayload {
  const _TicketStatusPayload({required this.id, required this.userId, required this.ticketTypeId, required this.status, this.stripePaymentIntentId, this.nameplateId, required this.createdAt, required this.updatedAt});
  factory _TicketStatusPayload.fromJson(Map<String, dynamic> json) => _$TicketStatusPayloadFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String ticketTypeId;
@override final  TicketStatusType status;
@override final  String? stripePaymentIntentId;
@override final  String? nameplateId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TicketStatusPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketStatusPayloadCopyWith<_TicketStatusPayload> get copyWith => __$TicketStatusPayloadCopyWithImpl<_TicketStatusPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketStatusPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketStatusPayload&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.nameplateId, nameplateId) || other.nameplateId == nameplateId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,nameplateId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketStatusPayload(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, nameplateId: $nameplateId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketStatusPayloadCopyWith<$Res> implements $TicketStatusPayloadCopyWith<$Res> {
  factory _$TicketStatusPayloadCopyWith(_TicketStatusPayload value, $Res Function(_TicketStatusPayload) _then) = __$TicketStatusPayloadCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketStatusType status, String? stripePaymentIntentId, String? nameplateId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TicketStatusPayloadCopyWithImpl<$Res>
    implements _$TicketStatusPayloadCopyWith<$Res> {
  __$TicketStatusPayloadCopyWithImpl(this._self, this._then);

  final _TicketStatusPayload _self;
  final $Res Function(_TicketStatusPayload) _then;

/// Create a copy of TicketStatusPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? nameplateId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketStatusPayload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatusType,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,nameplateId: freezed == nameplateId ? _self.nameplateId : nameplateId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
