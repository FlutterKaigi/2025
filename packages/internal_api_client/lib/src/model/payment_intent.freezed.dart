// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentIntent {

 String get id; String get clientSecret; int get amount; String get currency; String get status; String? get customerId; Map<String, dynamic>? get metadata;
/// Create a copy of PaymentIntent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentIntentCopyWith<PaymentIntent> get copyWith => _$PaymentIntentCopyWithImpl<PaymentIntent>(this as PaymentIntent, _$identity);

  /// Serializes this PaymentIntent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentIntent&&(identical(other.id, id) || other.id == id)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientSecret,amount,currency,status,customerId,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PaymentIntent(id: $id, clientSecret: $clientSecret, amount: $amount, currency: $currency, status: $status, customerId: $customerId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PaymentIntentCopyWith<$Res>  {
  factory $PaymentIntentCopyWith(PaymentIntent value, $Res Function(PaymentIntent) _then) = _$PaymentIntentCopyWithImpl;
@useResult
$Res call({
 String id, String clientSecret, int amount, String currency, String status, String? customerId, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$PaymentIntentCopyWithImpl<$Res>
    implements $PaymentIntentCopyWith<$Res> {
  _$PaymentIntentCopyWithImpl(this._self, this._then);

  final PaymentIntent _self;
  final $Res Function(PaymentIntent) _then;

/// Create a copy of PaymentIntent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientSecret = null,Object? amount = null,Object? currency = null,Object? status = null,Object? customerId = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentIntent].
extension PaymentIntentPatterns on PaymentIntent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentIntent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentIntent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentIntent value)  $default,){
final _that = this;
switch (_that) {
case _PaymentIntent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentIntent value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentIntent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientSecret,  int amount,  String currency,  String status,  String? customerId,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentIntent() when $default != null:
return $default(_that.id,_that.clientSecret,_that.amount,_that.currency,_that.status,_that.customerId,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientSecret,  int amount,  String currency,  String status,  String? customerId,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _PaymentIntent():
return $default(_that.id,_that.clientSecret,_that.amount,_that.currency,_that.status,_that.customerId,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientSecret,  int amount,  String currency,  String status,  String? customerId,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _PaymentIntent() when $default != null:
return $default(_that.id,_that.clientSecret,_that.amount,_that.currency,_that.status,_that.customerId,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentIntent implements PaymentIntent {
  const _PaymentIntent({required this.id, required this.clientSecret, required this.amount, required this.currency, required this.status, this.customerId, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _PaymentIntent.fromJson(Map<String, dynamic> json) => _$PaymentIntentFromJson(json);

@override final  String id;
@override final  String clientSecret;
@override final  int amount;
@override final  String currency;
@override final  String status;
@override final  String? customerId;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PaymentIntent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentIntentCopyWith<_PaymentIntent> get copyWith => __$PaymentIntentCopyWithImpl<_PaymentIntent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentIntentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentIntent&&(identical(other.id, id) || other.id == id)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientSecret,amount,currency,status,customerId,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PaymentIntent(id: $id, clientSecret: $clientSecret, amount: $amount, currency: $currency, status: $status, customerId: $customerId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PaymentIntentCopyWith<$Res> implements $PaymentIntentCopyWith<$Res> {
  factory _$PaymentIntentCopyWith(_PaymentIntent value, $Res Function(_PaymentIntent) _then) = __$PaymentIntentCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientSecret, int amount, String currency, String status, String? customerId, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$PaymentIntentCopyWithImpl<$Res>
    implements _$PaymentIntentCopyWith<$Res> {
  __$PaymentIntentCopyWithImpl(this._self, this._then);

  final _PaymentIntent _self;
  final $Res Function(_PaymentIntent) _then;

/// Create a copy of PaymentIntent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientSecret = null,Object? amount = null,Object? currency = null,Object? status = null,Object? customerId = freezed,Object? metadata = freezed,}) {
  return _then(_PaymentIntent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
