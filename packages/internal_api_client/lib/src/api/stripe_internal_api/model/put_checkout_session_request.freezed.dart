// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_checkout_session_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PutCheckoutSessionRequest {

 String get successUrl; String get cancelUrl; String get userId; String get ticketTypeId; List<String> get ticketOptionIds;
/// Create a copy of PutCheckoutSessionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PutCheckoutSessionRequestCopyWith<PutCheckoutSessionRequest> get copyWith => _$PutCheckoutSessionRequestCopyWithImpl<PutCheckoutSessionRequest>(this as PutCheckoutSessionRequest, _$identity);

  /// Serializes this PutCheckoutSessionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PutCheckoutSessionRequest&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.ticketOptionIds, ticketOptionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successUrl,cancelUrl,userId,ticketTypeId,const DeepCollectionEquality().hash(ticketOptionIds));

@override
String toString() {
  return 'PutCheckoutSessionRequest(successUrl: $successUrl, cancelUrl: $cancelUrl, userId: $userId, ticketTypeId: $ticketTypeId, ticketOptionIds: $ticketOptionIds)';
}


}

/// @nodoc
abstract mixin class $PutCheckoutSessionRequestCopyWith<$Res>  {
  factory $PutCheckoutSessionRequestCopyWith(PutCheckoutSessionRequest value, $Res Function(PutCheckoutSessionRequest) _then) = _$PutCheckoutSessionRequestCopyWithImpl;
@useResult
$Res call({
 String successUrl, String cancelUrl, String userId, String ticketTypeId, List<String> ticketOptionIds
});




}
/// @nodoc
class _$PutCheckoutSessionRequestCopyWithImpl<$Res>
    implements $PutCheckoutSessionRequestCopyWith<$Res> {
  _$PutCheckoutSessionRequestCopyWithImpl(this._self, this._then);

  final PutCheckoutSessionRequest _self;
  final $Res Function(PutCheckoutSessionRequest) _then;

/// Create a copy of PutCheckoutSessionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? successUrl = null,Object? cancelUrl = null,Object? userId = null,Object? ticketTypeId = null,Object? ticketOptionIds = null,}) {
  return _then(_self.copyWith(
successUrl: null == successUrl ? _self.successUrl : successUrl // ignore: cast_nullable_to_non_nullable
as String,cancelUrl: null == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionIds: null == ticketOptionIds ? _self.ticketOptionIds : ticketOptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PutCheckoutSessionRequest].
extension PutCheckoutSessionRequestPatterns on PutCheckoutSessionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PutCheckoutSessionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PutCheckoutSessionRequest value)  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PutCheckoutSessionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String successUrl,  String cancelUrl,  String userId,  String ticketTypeId,  List<String> ticketOptionIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest() when $default != null:
return $default(_that.successUrl,_that.cancelUrl,_that.userId,_that.ticketTypeId,_that.ticketOptionIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String successUrl,  String cancelUrl,  String userId,  String ticketTypeId,  List<String> ticketOptionIds)  $default,) {final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest():
return $default(_that.successUrl,_that.cancelUrl,_that.userId,_that.ticketTypeId,_that.ticketOptionIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String successUrl,  String cancelUrl,  String userId,  String ticketTypeId,  List<String> ticketOptionIds)?  $default,) {final _that = this;
switch (_that) {
case _PutCheckoutSessionRequest() when $default != null:
return $default(_that.successUrl,_that.cancelUrl,_that.userId,_that.ticketTypeId,_that.ticketOptionIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PutCheckoutSessionRequest implements PutCheckoutSessionRequest {
  const _PutCheckoutSessionRequest({required this.successUrl, required this.cancelUrl, required this.userId, required this.ticketTypeId, required final  List<String> ticketOptionIds}): _ticketOptionIds = ticketOptionIds;
  factory _PutCheckoutSessionRequest.fromJson(Map<String, dynamic> json) => _$PutCheckoutSessionRequestFromJson(json);

@override final  String successUrl;
@override final  String cancelUrl;
@override final  String userId;
@override final  String ticketTypeId;
 final  List<String> _ticketOptionIds;
@override List<String> get ticketOptionIds {
  if (_ticketOptionIds is EqualUnmodifiableListView) return _ticketOptionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketOptionIds);
}


/// Create a copy of PutCheckoutSessionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PutCheckoutSessionRequestCopyWith<_PutCheckoutSessionRequest> get copyWith => __$PutCheckoutSessionRequestCopyWithImpl<_PutCheckoutSessionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PutCheckoutSessionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PutCheckoutSessionRequest&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._ticketOptionIds, _ticketOptionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successUrl,cancelUrl,userId,ticketTypeId,const DeepCollectionEquality().hash(_ticketOptionIds));

@override
String toString() {
  return 'PutCheckoutSessionRequest(successUrl: $successUrl, cancelUrl: $cancelUrl, userId: $userId, ticketTypeId: $ticketTypeId, ticketOptionIds: $ticketOptionIds)';
}


}

/// @nodoc
abstract mixin class _$PutCheckoutSessionRequestCopyWith<$Res> implements $PutCheckoutSessionRequestCopyWith<$Res> {
  factory _$PutCheckoutSessionRequestCopyWith(_PutCheckoutSessionRequest value, $Res Function(_PutCheckoutSessionRequest) _then) = __$PutCheckoutSessionRequestCopyWithImpl;
@override @useResult
$Res call({
 String successUrl, String cancelUrl, String userId, String ticketTypeId, List<String> ticketOptionIds
});




}
/// @nodoc
class __$PutCheckoutSessionRequestCopyWithImpl<$Res>
    implements _$PutCheckoutSessionRequestCopyWith<$Res> {
  __$PutCheckoutSessionRequestCopyWithImpl(this._self, this._then);

  final _PutCheckoutSessionRequest _self;
  final $Res Function(_PutCheckoutSessionRequest) _then;

/// Create a copy of PutCheckoutSessionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? successUrl = null,Object? cancelUrl = null,Object? userId = null,Object? ticketTypeId = null,Object? ticketOptionIds = null,}) {
  return _then(_PutCheckoutSessionRequest(
successUrl: null == successUrl ? _self.successUrl : successUrl // ignore: cast_nullable_to_non_nullable
as String,cancelUrl: null == cancelUrl ? _self.cancelUrl : cancelUrl // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,ticketOptionIds: null == ticketOptionIds ? _self._ticketOptionIds : ticketOptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
