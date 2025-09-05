// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketPurchase {

 String get id; String get ticketTypeId; TicketPurchaseStatus get status; DateTime get createdAt; DateTime get updatedAt; String? get stripePaymentIntentId;
/// Create a copy of TicketPurchase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseCopyWith<TicketPurchase> get copyWith => _$TicketPurchaseCopyWithImpl<TicketPurchase>(this as TicketPurchase, _$identity);

  /// Serializes this TicketPurchase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchase&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,status,createdAt,updatedAt,stripePaymentIntentId);

@override
String toString() {
  return 'TicketPurchase(id: $id, ticketTypeId: $ticketTypeId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, stripePaymentIntentId: $stripePaymentIntentId)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseCopyWith<$Res>  {
  factory $TicketPurchaseCopyWith(TicketPurchase value, $Res Function(TicketPurchase) _then) = _$TicketPurchaseCopyWithImpl;
@useResult
$Res call({
 String id, String ticketTypeId, TicketPurchaseStatus status, DateTime createdAt, DateTime updatedAt, String? stripePaymentIntentId
});




}
/// @nodoc
class _$TicketPurchaseCopyWithImpl<$Res>
    implements $TicketPurchaseCopyWith<$Res> {
  _$TicketPurchaseCopyWithImpl(this._self, this._then);

  final TicketPurchase _self;
  final $Res Function(TicketPurchase) _then;

/// Create a copy of TicketPurchase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketTypeId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? stripePaymentIntentId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketPurchaseStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketPurchase].
extension TicketPurchasePatterns on TicketPurchase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchase value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchase value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  TicketPurchaseStatus status,  DateTime createdAt,  DateTime updatedAt,  String? stripePaymentIntentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchase() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.status,_that.createdAt,_that.updatedAt,_that.stripePaymentIntentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  TicketPurchaseStatus status,  DateTime createdAt,  DateTime updatedAt,  String? stripePaymentIntentId)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchase():
return $default(_that.id,_that.ticketTypeId,_that.status,_that.createdAt,_that.updatedAt,_that.stripePaymentIntentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketTypeId,  TicketPurchaseStatus status,  DateTime createdAt,  DateTime updatedAt,  String? stripePaymentIntentId)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchase() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.status,_that.createdAt,_that.updatedAt,_that.stripePaymentIntentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketPurchase implements TicketPurchase {
  const _TicketPurchase({required this.id, required this.ticketTypeId, required this.status, required this.createdAt, required this.updatedAt, this.stripePaymentIntentId});
  factory _TicketPurchase.fromJson(Map<String, dynamic> json) => _$TicketPurchaseFromJson(json);

@override final  String id;
@override final  String ticketTypeId;
@override final  TicketPurchaseStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? stripePaymentIntentId;

/// Create a copy of TicketPurchase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchaseCopyWith<_TicketPurchase> get copyWith => __$TicketPurchaseCopyWithImpl<_TicketPurchase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchase&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,status,createdAt,updatedAt,stripePaymentIntentId);

@override
String toString() {
  return 'TicketPurchase(id: $id, ticketTypeId: $ticketTypeId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, stripePaymentIntentId: $stripePaymentIntentId)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchaseCopyWith<$Res> implements $TicketPurchaseCopyWith<$Res> {
  factory _$TicketPurchaseCopyWith(_TicketPurchase value, $Res Function(_TicketPurchase) _then) = __$TicketPurchaseCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketTypeId, TicketPurchaseStatus status, DateTime createdAt, DateTime updatedAt, String? stripePaymentIntentId
});




}
/// @nodoc
class __$TicketPurchaseCopyWithImpl<$Res>
    implements _$TicketPurchaseCopyWith<$Res> {
  __$TicketPurchaseCopyWithImpl(this._self, this._then);

  final _TicketPurchase _self;
  final $Res Function(_TicketPurchase) _then;

/// Create a copy of TicketPurchase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketTypeId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? stripePaymentIntentId = freezed,}) {
  return _then(_TicketPurchase(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketPurchaseStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
