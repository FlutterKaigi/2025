// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_webhook_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StripeWebhookLogs {

 int get id; String get stripeEventId; String get eventType; String? get paymentIntentId; bool get processed; String? get errorMessage; Map<String, dynamic> get rawData;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of StripeWebhookLogs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StripeWebhookLogsCopyWith<StripeWebhookLogs> get copyWith => _$StripeWebhookLogsCopyWithImpl<StripeWebhookLogs>(this as StripeWebhookLogs, _$identity);

  /// Serializes this StripeWebhookLogs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StripeWebhookLogs&&(identical(other.id, id) || other.id == id)&&(identical(other.stripeEventId, stripeEventId) || other.stripeEventId == stripeEventId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.rawData, rawData)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stripeEventId,eventType,paymentIntentId,processed,errorMessage,const DeepCollectionEquality().hash(rawData),createdAt);

@override
String toString() {
  return 'StripeWebhookLogs(id: $id, stripeEventId: $stripeEventId, eventType: $eventType, paymentIntentId: $paymentIntentId, processed: $processed, errorMessage: $errorMessage, rawData: $rawData, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StripeWebhookLogsCopyWith<$Res>  {
  factory $StripeWebhookLogsCopyWith(StripeWebhookLogs value, $Res Function(StripeWebhookLogs) _then) = _$StripeWebhookLogsCopyWithImpl;
@useResult
$Res call({
 int id, String stripeEventId, String eventType, String? paymentIntentId, bool processed, String? errorMessage, Map<String, dynamic> rawData,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$StripeWebhookLogsCopyWithImpl<$Res>
    implements $StripeWebhookLogsCopyWith<$Res> {
  _$StripeWebhookLogsCopyWithImpl(this._self, this._then);

  final StripeWebhookLogs _self;
  final $Res Function(StripeWebhookLogs) _then;

/// Create a copy of StripeWebhookLogs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? stripeEventId = null,Object? eventType = null,Object? paymentIntentId = freezed,Object? processed = null,Object? errorMessage = freezed,Object? rawData = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,stripeEventId: null == stripeEventId ? _self.stripeEventId : stripeEventId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,rawData: null == rawData ? _self.rawData : rawData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StripeWebhookLogs].
extension StripeWebhookLogsPatterns on StripeWebhookLogs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StripeWebhookLogs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StripeWebhookLogs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StripeWebhookLogs value)  $default,){
final _that = this;
switch (_that) {
case _StripeWebhookLogs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StripeWebhookLogs value)?  $default,){
final _that = this;
switch (_that) {
case _StripeWebhookLogs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String stripeEventId,  String eventType,  String? paymentIntentId,  bool processed,  String? errorMessage,  Map<String, dynamic> rawData, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StripeWebhookLogs() when $default != null:
return $default(_that.id,_that.stripeEventId,_that.eventType,_that.paymentIntentId,_that.processed,_that.errorMessage,_that.rawData,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String stripeEventId,  String eventType,  String? paymentIntentId,  bool processed,  String? errorMessage,  Map<String, dynamic> rawData, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StripeWebhookLogs():
return $default(_that.id,_that.stripeEventId,_that.eventType,_that.paymentIntentId,_that.processed,_that.errorMessage,_that.rawData,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String stripeEventId,  String eventType,  String? paymentIntentId,  bool processed,  String? errorMessage,  Map<String, dynamic> rawData, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StripeWebhookLogs() when $default != null:
return $default(_that.id,_that.stripeEventId,_that.eventType,_that.paymentIntentId,_that.processed,_that.errorMessage,_that.rawData,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StripeWebhookLogs implements StripeWebhookLogs {
  const _StripeWebhookLogs({required this.id, required this.stripeEventId, required this.eventType, this.paymentIntentId, required this.processed, this.errorMessage, required final  Map<String, dynamic> rawData, @RequiredDateTimeConverter() required this.createdAt}): _rawData = rawData;
  factory _StripeWebhookLogs.fromJson(Map<String, dynamic> json) => _$StripeWebhookLogsFromJson(json);

@override final  int id;
@override final  String stripeEventId;
@override final  String eventType;
@override final  String? paymentIntentId;
@override final  bool processed;
@override final  String? errorMessage;
 final  Map<String, dynamic> _rawData;
@override Map<String, dynamic> get rawData {
  if (_rawData is EqualUnmodifiableMapView) return _rawData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rawData);
}

@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of StripeWebhookLogs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StripeWebhookLogsCopyWith<_StripeWebhookLogs> get copyWith => __$StripeWebhookLogsCopyWithImpl<_StripeWebhookLogs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StripeWebhookLogsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StripeWebhookLogs&&(identical(other.id, id) || other.id == id)&&(identical(other.stripeEventId, stripeEventId) || other.stripeEventId == stripeEventId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.paymentIntentId, paymentIntentId) || other.paymentIntentId == paymentIntentId)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._rawData, _rawData)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stripeEventId,eventType,paymentIntentId,processed,errorMessage,const DeepCollectionEquality().hash(_rawData),createdAt);

@override
String toString() {
  return 'StripeWebhookLogs(id: $id, stripeEventId: $stripeEventId, eventType: $eventType, paymentIntentId: $paymentIntentId, processed: $processed, errorMessage: $errorMessage, rawData: $rawData, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StripeWebhookLogsCopyWith<$Res> implements $StripeWebhookLogsCopyWith<$Res> {
  factory _$StripeWebhookLogsCopyWith(_StripeWebhookLogs value, $Res Function(_StripeWebhookLogs) _then) = __$StripeWebhookLogsCopyWithImpl;
@override @useResult
$Res call({
 int id, String stripeEventId, String eventType, String? paymentIntentId, bool processed, String? errorMessage, Map<String, dynamic> rawData,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$StripeWebhookLogsCopyWithImpl<$Res>
    implements _$StripeWebhookLogsCopyWith<$Res> {
  __$StripeWebhookLogsCopyWithImpl(this._self, this._then);

  final _StripeWebhookLogs _self;
  final $Res Function(_StripeWebhookLogs) _then;

/// Create a copy of StripeWebhookLogs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? stripeEventId = null,Object? eventType = null,Object? paymentIntentId = freezed,Object? processed = null,Object? errorMessage = freezed,Object? rawData = null,Object? createdAt = null,}) {
  return _then(_StripeWebhookLogs(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,stripeEventId: null == stripeEventId ? _self.stripeEventId : stripeEventId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,paymentIntentId: freezed == paymentIntentId ? _self.paymentIntentId : paymentIntentId // ignore: cast_nullable_to_non_nullable
as String?,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,rawData: null == rawData ? _self._rawData : rawData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
