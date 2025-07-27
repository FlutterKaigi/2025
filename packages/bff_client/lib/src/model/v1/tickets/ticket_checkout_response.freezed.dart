// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_checkout_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketCheckoutResponse {

 String get checkoutSessionId; String get stripeCheckoutUrl; DateTime get expiresAt;
/// Create a copy of TicketCheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutResponseCopyWith<TicketCheckoutResponse> get copyWith => _$TicketCheckoutResponseCopyWithImpl<TicketCheckoutResponse>(this as TicketCheckoutResponse, _$identity);

  /// Serializes this TicketCheckoutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutResponse&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.stripeCheckoutUrl, stripeCheckoutUrl) || other.stripeCheckoutUrl == stripeCheckoutUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkoutSessionId,stripeCheckoutUrl,expiresAt);

@override
String toString() {
  return 'TicketCheckoutResponse(checkoutSessionId: $checkoutSessionId, stripeCheckoutUrl: $stripeCheckoutUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutResponseCopyWith<$Res>  {
  factory $TicketCheckoutResponseCopyWith(TicketCheckoutResponse value, $Res Function(TicketCheckoutResponse) _then) = _$TicketCheckoutResponseCopyWithImpl;
@useResult
$Res call({
 String checkoutSessionId, String stripeCheckoutUrl, DateTime expiresAt
});




}
/// @nodoc
class _$TicketCheckoutResponseCopyWithImpl<$Res>
    implements $TicketCheckoutResponseCopyWith<$Res> {
  _$TicketCheckoutResponseCopyWithImpl(this._self, this._then);

  final TicketCheckoutResponse _self;
  final $Res Function(TicketCheckoutResponse) _then;

/// Create a copy of TicketCheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkoutSessionId = null,Object? stripeCheckoutUrl = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,stripeCheckoutUrl: null == stripeCheckoutUrl ? _self.stripeCheckoutUrl : stripeCheckoutUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketCheckoutResponse].
extension TicketCheckoutResponsePatterns on TicketCheckoutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckoutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckoutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckoutResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckoutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String checkoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutResponse() when $default != null:
return $default(_that.checkoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String checkoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutResponse():
return $default(_that.checkoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String checkoutSessionId,  String stripeCheckoutUrl,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutResponse() when $default != null:
return $default(_that.checkoutSessionId,_that.stripeCheckoutUrl,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutResponse implements TicketCheckoutResponse {
  const _TicketCheckoutResponse({required this.checkoutSessionId, required this.stripeCheckoutUrl, required this.expiresAt});
  factory _TicketCheckoutResponse.fromJson(Map<String, dynamic> json) => _$TicketCheckoutResponseFromJson(json);

@override final  String checkoutSessionId;
@override final  String stripeCheckoutUrl;
@override final  DateTime expiresAt;

/// Create a copy of TicketCheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutResponseCopyWith<_TicketCheckoutResponse> get copyWith => __$TicketCheckoutResponseCopyWithImpl<_TicketCheckoutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutResponse&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.stripeCheckoutUrl, stripeCheckoutUrl) || other.stripeCheckoutUrl == stripeCheckoutUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkoutSessionId,stripeCheckoutUrl,expiresAt);

@override
String toString() {
  return 'TicketCheckoutResponse(checkoutSessionId: $checkoutSessionId, stripeCheckoutUrl: $stripeCheckoutUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutResponseCopyWith<$Res> implements $TicketCheckoutResponseCopyWith<$Res> {
  factory _$TicketCheckoutResponseCopyWith(_TicketCheckoutResponse value, $Res Function(_TicketCheckoutResponse) _then) = __$TicketCheckoutResponseCopyWithImpl;
@override @useResult
$Res call({
 String checkoutSessionId, String stripeCheckoutUrl, DateTime expiresAt
});




}
/// @nodoc
class __$TicketCheckoutResponseCopyWithImpl<$Res>
    implements _$TicketCheckoutResponseCopyWith<$Res> {
  __$TicketCheckoutResponseCopyWithImpl(this._self, this._then);

  final _TicketCheckoutResponse _self;
  final $Res Function(_TicketCheckoutResponse) _then;

/// Create a copy of TicketCheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkoutSessionId = null,Object? stripeCheckoutUrl = null,Object? expiresAt = null,}) {
  return _then(_TicketCheckoutResponse(
checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,stripeCheckoutUrl: null == stripeCheckoutUrl ? _self.stripeCheckoutUrl : stripeCheckoutUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
