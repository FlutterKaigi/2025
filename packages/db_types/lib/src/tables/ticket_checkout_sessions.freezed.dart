// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_checkout_sessions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketCheckoutSessions {

 String get id; String get userId; String get ticketTypeId; TicketCheckoutStatus get status; String? get stripePaymentIntentId; String? get stripeCheckoutSessionId; int get totalAmount;@RequiredDateTimeConverter() DateTime get expiresAt;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of TicketCheckoutSessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<TicketCheckoutSessions> get copyWith => _$TicketCheckoutSessionsCopyWithImpl<TicketCheckoutSessions>(this as TicketCheckoutSessions, _$identity);

  /// Serializes this TicketCheckoutSessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.stripeCheckoutSessionId, stripeCheckoutSessionId) || other.stripeCheckoutSessionId == stripeCheckoutSessionId)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,stripeCheckoutSessionId,totalAmount,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'TicketCheckoutSessions(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, stripeCheckoutSessionId: $stripeCheckoutSessionId, totalAmount: $totalAmount, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutSessionsCopyWith<$Res>  {
  factory $TicketCheckoutSessionsCopyWith(TicketCheckoutSessions value, $Res Function(TicketCheckoutSessions) _then) = _$TicketCheckoutSessionsCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketCheckoutStatus status, String? stripePaymentIntentId, String? stripeCheckoutSessionId, int totalAmount,@RequiredDateTimeConverter() DateTime expiresAt,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$TicketCheckoutSessionsCopyWithImpl<$Res>
    implements $TicketCheckoutSessionsCopyWith<$Res> {
  _$TicketCheckoutSessionsCopyWithImpl(this._self, this._then);

  final TicketCheckoutSessions _self;
  final $Res Function(TicketCheckoutSessions) _then;

/// Create a copy of TicketCheckoutSessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? stripeCheckoutSessionId = freezed,Object? totalAmount = null,Object? expiresAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketCheckoutStatus,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,stripeCheckoutSessionId: freezed == stripeCheckoutSessionId ? _self.stripeCheckoutSessionId : stripeCheckoutSessionId // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketCheckoutSessions].
extension TicketCheckoutSessionsPatterns on TicketCheckoutSessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckoutSessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckoutSessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckoutSessions value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutSessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckoutSessions value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutSessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketCheckoutStatus status,  String? stripePaymentIntentId,  String? stripeCheckoutSessionId,  int totalAmount, @RequiredDateTimeConverter()  DateTime expiresAt, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutSessions() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.stripeCheckoutSessionId,_that.totalAmount,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketCheckoutStatus status,  String? stripePaymentIntentId,  String? stripeCheckoutSessionId,  int totalAmount, @RequiredDateTimeConverter()  DateTime expiresAt, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutSessions():
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.stripeCheckoutSessionId,_that.totalAmount,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String ticketTypeId,  TicketCheckoutStatus status,  String? stripePaymentIntentId,  String? stripeCheckoutSessionId,  int totalAmount, @RequiredDateTimeConverter()  DateTime expiresAt, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutSessions() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.stripeCheckoutSessionId,_that.totalAmount,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutSessions implements TicketCheckoutSessions {
  const _TicketCheckoutSessions({required this.id, required this.userId, required this.ticketTypeId, required this.status, this.stripePaymentIntentId, this.stripeCheckoutSessionId, required this.totalAmount, @RequiredDateTimeConverter() required this.expiresAt, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _TicketCheckoutSessions.fromJson(Map<String, dynamic> json) => _$TicketCheckoutSessionsFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String ticketTypeId;
@override final  TicketCheckoutStatus status;
@override final  String? stripePaymentIntentId;
@override final  String? stripeCheckoutSessionId;
@override final  int totalAmount;
@override@RequiredDateTimeConverter() final  DateTime expiresAt;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of TicketCheckoutSessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutSessionsCopyWith<_TicketCheckoutSessions> get copyWith => __$TicketCheckoutSessionsCopyWithImpl<_TicketCheckoutSessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutSessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.stripeCheckoutSessionId, stripeCheckoutSessionId) || other.stripeCheckoutSessionId == stripeCheckoutSessionId)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,stripeCheckoutSessionId,totalAmount,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'TicketCheckoutSessions(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, stripeCheckoutSessionId: $stripeCheckoutSessionId, totalAmount: $totalAmount, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutSessionsCopyWith<$Res> implements $TicketCheckoutSessionsCopyWith<$Res> {
  factory _$TicketCheckoutSessionsCopyWith(_TicketCheckoutSessions value, $Res Function(_TicketCheckoutSessions) _then) = __$TicketCheckoutSessionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketCheckoutStatus status, String? stripePaymentIntentId, String? stripeCheckoutSessionId, int totalAmount,@RequiredDateTimeConverter() DateTime expiresAt,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$TicketCheckoutSessionsCopyWithImpl<$Res>
    implements _$TicketCheckoutSessionsCopyWith<$Res> {
  __$TicketCheckoutSessionsCopyWithImpl(this._self, this._then);

  final _TicketCheckoutSessions _self;
  final $Res Function(_TicketCheckoutSessions) _then;

/// Create a copy of TicketCheckoutSessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? stripeCheckoutSessionId = freezed,Object? totalAmount = null,Object? expiresAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketCheckoutSessions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketCheckoutStatus,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,stripeCheckoutSessionId: freezed == stripeCheckoutSessionId ? _self.stripeCheckoutSessionId : stripeCheckoutSessionId // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TicketCheckoutOptions {

 String get id; String get checkoutSessionId; String get ticketOptionId; String? get optionValue;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of TicketCheckoutOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutOptionsCopyWith<TicketCheckoutOptions> get copyWith => _$TicketCheckoutOptionsCopyWithImpl<TicketCheckoutOptions>(this as TicketCheckoutOptions, _$identity);

  /// Serializes this TicketCheckoutOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId)&&(identical(other.optionValue, optionValue) || other.optionValue == optionValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,checkoutSessionId,ticketOptionId,optionValue,createdAt,updatedAt);

@override
String toString() {
  return 'TicketCheckoutOptions(id: $id, checkoutSessionId: $checkoutSessionId, ticketOptionId: $ticketOptionId, optionValue: $optionValue, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutOptionsCopyWith<$Res>  {
  factory $TicketCheckoutOptionsCopyWith(TicketCheckoutOptions value, $Res Function(TicketCheckoutOptions) _then) = _$TicketCheckoutOptionsCopyWithImpl;
@useResult
$Res call({
 String id, String checkoutSessionId, String ticketOptionId, String? optionValue,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$TicketCheckoutOptionsCopyWithImpl<$Res>
    implements $TicketCheckoutOptionsCopyWith<$Res> {
  _$TicketCheckoutOptionsCopyWithImpl(this._self, this._then);

  final TicketCheckoutOptions _self;
  final $Res Function(TicketCheckoutOptions) _then;

/// Create a copy of TicketCheckoutOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? checkoutSessionId = null,Object? ticketOptionId = null,Object? optionValue = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionId: null == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String,optionValue: freezed == optionValue ? _self.optionValue : optionValue // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketCheckoutOptions].
extension TicketCheckoutOptionsPatterns on TicketCheckoutOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckoutOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckoutOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckoutOptions value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckoutOptions value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String checkoutSessionId,  String ticketOptionId,  String? optionValue, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutOptions() when $default != null:
return $default(_that.id,_that.checkoutSessionId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String checkoutSessionId,  String ticketOptionId,  String? optionValue, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutOptions():
return $default(_that.id,_that.checkoutSessionId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String checkoutSessionId,  String ticketOptionId,  String? optionValue, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutOptions() when $default != null:
return $default(_that.id,_that.checkoutSessionId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutOptions implements TicketCheckoutOptions {
  const _TicketCheckoutOptions({required this.id, required this.checkoutSessionId, required this.ticketOptionId, this.optionValue, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _TicketCheckoutOptions.fromJson(Map<String, dynamic> json) => _$TicketCheckoutOptionsFromJson(json);

@override final  String id;
@override final  String checkoutSessionId;
@override final  String ticketOptionId;
@override final  String? optionValue;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of TicketCheckoutOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutOptionsCopyWith<_TicketCheckoutOptions> get copyWith => __$TicketCheckoutOptionsCopyWithImpl<_TicketCheckoutOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId)&&(identical(other.optionValue, optionValue) || other.optionValue == optionValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,checkoutSessionId,ticketOptionId,optionValue,createdAt,updatedAt);

@override
String toString() {
  return 'TicketCheckoutOptions(id: $id, checkoutSessionId: $checkoutSessionId, ticketOptionId: $ticketOptionId, optionValue: $optionValue, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutOptionsCopyWith<$Res> implements $TicketCheckoutOptionsCopyWith<$Res> {
  factory _$TicketCheckoutOptionsCopyWith(_TicketCheckoutOptions value, $Res Function(_TicketCheckoutOptions) _then) = __$TicketCheckoutOptionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String checkoutSessionId, String ticketOptionId, String? optionValue,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$TicketCheckoutOptionsCopyWithImpl<$Res>
    implements _$TicketCheckoutOptionsCopyWith<$Res> {
  __$TicketCheckoutOptionsCopyWithImpl(this._self, this._then);

  final _TicketCheckoutOptions _self;
  final $Res Function(_TicketCheckoutOptions) _then;

/// Create a copy of TicketCheckoutOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? checkoutSessionId = null,Object? ticketOptionId = null,Object? optionValue = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketCheckoutOptions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionId: null == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String,optionValue: freezed == optionValue ? _self.optionValue : optionValue // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
