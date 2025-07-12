// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketPurchases {

 String get id; String get userId; String get ticketTypeId; TicketPurchaseStatus get status; String? get stripePaymentIntentId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TicketPurchases
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchasesCopyWith<TicketPurchases> get copyWith => _$TicketPurchasesCopyWithImpl<TicketPurchases>(this as TicketPurchases, _$identity);

  /// Serializes this TicketPurchases to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchases&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketPurchases(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketPurchasesCopyWith<$Res>  {
  factory $TicketPurchasesCopyWith(TicketPurchases value, $Res Function(TicketPurchases) _then) = _$TicketPurchasesCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketPurchaseStatus status, String? stripePaymentIntentId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TicketPurchasesCopyWithImpl<$Res>
    implements $TicketPurchasesCopyWith<$Res> {
  _$TicketPurchasesCopyWithImpl(this._self, this._then);

  final TicketPurchases _self;
  final $Res Function(TicketPurchases) _then;

/// Create a copy of TicketPurchases
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketPurchaseStatus,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketPurchases].
extension TicketPurchasesPatterns on TicketPurchases {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchases value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchases() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchases value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchases():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchases value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchases() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketPurchaseStatus status,  String? stripePaymentIntentId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchases() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String ticketTypeId,  TicketPurchaseStatus status,  String? stripePaymentIntentId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchases():
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String ticketTypeId,  TicketPurchaseStatus status,  String? stripePaymentIntentId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchases() when $default != null:
return $default(_that.id,_that.userId,_that.ticketTypeId,_that.status,_that.stripePaymentIntentId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketPurchases implements TicketPurchases {
  const _TicketPurchases({required this.id, required this.userId, required this.ticketTypeId, required this.status, this.stripePaymentIntentId, required this.createdAt, required this.updatedAt});
  factory _TicketPurchases.fromJson(Map<String, dynamic> json) => _$TicketPurchasesFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String ticketTypeId;
@override final  TicketPurchaseStatus status;
@override final  String? stripePaymentIntentId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TicketPurchases
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchasesCopyWith<_TicketPurchases> get copyWith => __$TicketPurchasesCopyWithImpl<_TicketPurchases>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchasesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchases&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePaymentIntentId, stripePaymentIntentId) || other.stripePaymentIntentId == stripePaymentIntentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,ticketTypeId,status,stripePaymentIntentId,createdAt,updatedAt);

@override
String toString() {
  return 'TicketPurchases(id: $id, userId: $userId, ticketTypeId: $ticketTypeId, status: $status, stripePaymentIntentId: $stripePaymentIntentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchasesCopyWith<$Res> implements $TicketPurchasesCopyWith<$Res> {
  factory _$TicketPurchasesCopyWith(_TicketPurchases value, $Res Function(_TicketPurchases) _then) = __$TicketPurchasesCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String ticketTypeId, TicketPurchaseStatus status, String? stripePaymentIntentId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TicketPurchasesCopyWithImpl<$Res>
    implements _$TicketPurchasesCopyWith<$Res> {
  __$TicketPurchasesCopyWithImpl(this._self, this._then);

  final _TicketPurchases _self;
  final $Res Function(_TicketPurchases) _then;

/// Create a copy of TicketPurchases
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? ticketTypeId = null,Object? status = null,Object? stripePaymentIntentId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketPurchases(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketPurchaseStatus,stripePaymentIntentId: freezed == stripePaymentIntentId ? _self.stripePaymentIntentId : stripePaymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TicketPurchaseOptions {

 String get id; String get ticketPurchaseId; String get ticketOptionId; String? get optionValue; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TicketPurchaseOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseOptionsCopyWith<TicketPurchaseOptions> get copyWith => _$TicketPurchaseOptionsCopyWithImpl<TicketPurchaseOptions>(this as TicketPurchaseOptions, _$identity);

  /// Serializes this TicketPurchaseOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId)&&(identical(other.optionValue, optionValue) || other.optionValue == optionValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketPurchaseId,ticketOptionId,optionValue,createdAt,updatedAt);

@override
String toString() {
  return 'TicketPurchaseOptions(id: $id, ticketPurchaseId: $ticketPurchaseId, ticketOptionId: $ticketOptionId, optionValue: $optionValue, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseOptionsCopyWith<$Res>  {
  factory $TicketPurchaseOptionsCopyWith(TicketPurchaseOptions value, $Res Function(TicketPurchaseOptions) _then) = _$TicketPurchaseOptionsCopyWithImpl;
@useResult
$Res call({
 String id, String ticketPurchaseId, String ticketOptionId, String? optionValue, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TicketPurchaseOptionsCopyWithImpl<$Res>
    implements $TicketPurchaseOptionsCopyWith<$Res> {
  _$TicketPurchaseOptionsCopyWithImpl(this._self, this._then);

  final TicketPurchaseOptions _self;
  final $Res Function(TicketPurchaseOptions) _then;

/// Create a copy of TicketPurchaseOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketPurchaseId = null,Object? ticketOptionId = null,Object? optionValue = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionId: null == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String,optionValue: freezed == optionValue ? _self.optionValue : optionValue // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketPurchaseOptions].
extension TicketPurchaseOptionsPatterns on TicketPurchaseOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchaseOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchaseOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchaseOptions value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchaseOptions value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketPurchaseId,  String ticketOptionId,  String? optionValue,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchaseOptions() when $default != null:
return $default(_that.id,_that.ticketPurchaseId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketPurchaseId,  String ticketOptionId,  String? optionValue,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseOptions():
return $default(_that.id,_that.ticketPurchaseId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketPurchaseId,  String ticketOptionId,  String? optionValue,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseOptions() when $default != null:
return $default(_that.id,_that.ticketPurchaseId,_that.ticketOptionId,_that.optionValue,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketPurchaseOptions implements TicketPurchaseOptions {
  const _TicketPurchaseOptions({required this.id, required this.ticketPurchaseId, required this.ticketOptionId, this.optionValue, required this.createdAt, required this.updatedAt});
  factory _TicketPurchaseOptions.fromJson(Map<String, dynamic> json) => _$TicketPurchaseOptionsFromJson(json);

@override final  String id;
@override final  String ticketPurchaseId;
@override final  String ticketOptionId;
@override final  String? optionValue;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TicketPurchaseOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchaseOptionsCopyWith<_TicketPurchaseOptions> get copyWith => __$TicketPurchaseOptionsCopyWithImpl<_TicketPurchaseOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchaseOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId)&&(identical(other.optionValue, optionValue) || other.optionValue == optionValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketPurchaseId,ticketOptionId,optionValue,createdAt,updatedAt);

@override
String toString() {
  return 'TicketPurchaseOptions(id: $id, ticketPurchaseId: $ticketPurchaseId, ticketOptionId: $ticketOptionId, optionValue: $optionValue, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchaseOptionsCopyWith<$Res> implements $TicketPurchaseOptionsCopyWith<$Res> {
  factory _$TicketPurchaseOptionsCopyWith(_TicketPurchaseOptions value, $Res Function(_TicketPurchaseOptions) _then) = __$TicketPurchaseOptionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketPurchaseId, String ticketOptionId, String? optionValue, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TicketPurchaseOptionsCopyWithImpl<$Res>
    implements _$TicketPurchaseOptionsCopyWith<$Res> {
  __$TicketPurchaseOptionsCopyWithImpl(this._self, this._then);

  final _TicketPurchaseOptions _self;
  final $Res Function(_TicketPurchaseOptions) _then;

/// Create a copy of TicketPurchaseOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketPurchaseId = null,Object? ticketOptionId = null,Object? optionValue = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketPurchaseOptions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionId: null == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String,optionValue: freezed == optionValue ? _self.optionValue : optionValue // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
