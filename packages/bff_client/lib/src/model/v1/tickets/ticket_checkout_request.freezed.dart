// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_checkout_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketCheckoutRequest {

 String get ticketTypeId; List<String> get optionIds; String get successUrl; String get cancelUrl;
/// Create a copy of TicketCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutRequestCopyWith<TicketCheckoutRequest> get copyWith => _$TicketCheckoutRequestCopyWithImpl<TicketCheckoutRequest>(this as TicketCheckoutRequest, _$identity);

  /// Serializes this TicketCheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutRequest&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.optionIds, optionIds)&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketTypeId,const DeepCollectionEquality().hash(optionIds),successUrl,cancelUrl);

@override
String toString() {
  return 'TicketCheckoutRequest(ticketTypeId: $ticketTypeId, optionIds: $optionIds, successUrl: $successUrl, cancelUrl: $cancelUrl)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutRequestCopyWith<$Res>  {
  factory $TicketCheckoutRequestCopyWith(TicketCheckoutRequest value, $Res Function(TicketCheckoutRequest) _then) = _$TicketCheckoutRequestCopyWithImpl;
@useResult
$Res call({
 String ticketTypeId, List<String> optionIds, String successUrl, String cancelUrl
});




}
/// @nodoc
class _$TicketCheckoutRequestCopyWithImpl<$Res>
    implements $TicketCheckoutRequestCopyWith<$Res> {
  _$TicketCheckoutRequestCopyWithImpl(this._self, this._then);

  final TicketCheckoutRequest _self;
  final $Res Function(TicketCheckoutRequest) _then;

/// Create a copy of TicketCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketTypeId = null,Object? optionIds = null,Object? successUrl = null,Object? cancelUrl = null,}) {
  return _then(_self.copyWith(
ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,optionIds: null == optionIds ? _self.optionIds : optionIds // ignore: cast_nullable_to_non_nullable
as List<String>,successUrl: null == successUrl ? _self.successUrl : successUrl // ignore: cast_nullable_to_non_nullable
as String,cancelUrl: null == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketCheckoutRequest].
extension TicketCheckoutRequestPatterns on TicketCheckoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketCheckoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketCheckoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketCheckoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticketTypeId,  List<String> optionIds,  String successUrl,  String cancelUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
return $default(_that.ticketTypeId,_that.optionIds,_that.successUrl,_that.cancelUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticketTypeId,  List<String> optionIds,  String successUrl,  String cancelUrl)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest():
return $default(_that.ticketTypeId,_that.optionIds,_that.successUrl,_that.cancelUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticketTypeId,  List<String> optionIds,  String successUrl,  String cancelUrl)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
return $default(_that.ticketTypeId,_that.optionIds,_that.successUrl,_that.cancelUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutRequest implements TicketCheckoutRequest {
  const _TicketCheckoutRequest({required this.ticketTypeId, required final  List<String> optionIds, required this.successUrl, required this.cancelUrl}): _optionIds = optionIds;
  factory _TicketCheckoutRequest.fromJson(Map<String, dynamic> json) => _$TicketCheckoutRequestFromJson(json);

@override final  String ticketTypeId;
 final  List<String> _optionIds;
@override List<String> get optionIds {
  if (_optionIds is EqualUnmodifiableListView) return _optionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionIds);
}

@override final  String successUrl;
@override final  String cancelUrl;

/// Create a copy of TicketCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCheckoutRequestCopyWith<_TicketCheckoutRequest> get copyWith => __$TicketCheckoutRequestCopyWithImpl<_TicketCheckoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutRequest&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._optionIds, _optionIds)&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketTypeId,const DeepCollectionEquality().hash(_optionIds),successUrl,cancelUrl);

@override
String toString() {
  return 'TicketCheckoutRequest(ticketTypeId: $ticketTypeId, optionIds: $optionIds, successUrl: $successUrl, cancelUrl: $cancelUrl)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutRequestCopyWith<$Res> implements $TicketCheckoutRequestCopyWith<$Res> {
  factory _$TicketCheckoutRequestCopyWith(_TicketCheckoutRequest value, $Res Function(_TicketCheckoutRequest) _then) = __$TicketCheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
 String ticketTypeId, List<String> optionIds, String successUrl, String cancelUrl
});




}
/// @nodoc
class __$TicketCheckoutRequestCopyWithImpl<$Res>
    implements _$TicketCheckoutRequestCopyWith<$Res> {
  __$TicketCheckoutRequestCopyWithImpl(this._self, this._then);

  final _TicketCheckoutRequest _self;
  final $Res Function(_TicketCheckoutRequest) _then;

/// Create a copy of TicketCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketTypeId = null,Object? optionIds = null,Object? successUrl = null,Object? cancelUrl = null,}) {
  return _then(_TicketCheckoutRequest(
ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,optionIds: null == optionIds ? _self._optionIds : optionIds // ignore: cast_nullable_to_non_nullable
as List<String>,successUrl: null == successUrl ? _self.successUrl : successUrl // ignore: cast_nullable_to_non_nullable
as String,cancelUrl: null == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
