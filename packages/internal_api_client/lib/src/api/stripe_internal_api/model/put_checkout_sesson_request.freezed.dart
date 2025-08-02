// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_checkout_sesson_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PutCheckoutSessonRequest {

 String get successUrl; String get cancelUrl; String get userId; String get ticketTypeId; List<String> get ticketOptionIds;
/// Create a copy of PutCheckoutSessonRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PutCheckoutSessonRequestCopyWith<PutCheckoutSessonRequest> get copyWith => _$PutCheckoutSessonRequestCopyWithImpl<PutCheckoutSessonRequest>(this as PutCheckoutSessonRequest, _$identity);

  /// Serializes this PutCheckoutSessonRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PutCheckoutSessonRequest&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.ticketOptionIds, ticketOptionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successUrl,cancelUrl,userId,ticketTypeId,const DeepCollectionEquality().hash(ticketOptionIds));

@override
String toString() {
  return 'PutCheckoutSessonRequest(successUrl: $successUrl, cancelUrl: $cancelUrl, userId: $userId, ticketTypeId: $ticketTypeId, ticketOptionIds: $ticketOptionIds)';
}


}

/// @nodoc
abstract mixin class $PutCheckoutSessonRequestCopyWith<$Res>  {
  factory $PutCheckoutSessonRequestCopyWith(PutCheckoutSessonRequest value, $Res Function(PutCheckoutSessonRequest) _then) = _$PutCheckoutSessonRequestCopyWithImpl;
@useResult
$Res call({
 String successUrl, String cancelUrl, String userId, String ticketTypeId, List<String> ticketOptionIds
});




}
/// @nodoc
class _$PutCheckoutSessonRequestCopyWithImpl<$Res>
    implements $PutCheckoutSessonRequestCopyWith<$Res> {
  _$PutCheckoutSessonRequestCopyWithImpl(this._self, this._then);

  final PutCheckoutSessonRequest _self;
  final $Res Function(PutCheckoutSessonRequest) _then;

/// Create a copy of PutCheckoutSessonRequest
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


/// Adds pattern-matching-related methods to [PutCheckoutSessonRequest].
extension PutCheckoutSessonRequestPatterns on PutCheckoutSessonRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PutCheckoutSessonRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PutCheckoutSessonRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PutCheckoutSessonRequest value)  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessonRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PutCheckoutSessonRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessonRequest() when $default != null:
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
case _PutCheckoutSessonRequest() when $default != null:
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
case _PutCheckoutSessonRequest():
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
case _PutCheckoutSessonRequest() when $default != null:
return $default(_that.successUrl,_that.cancelUrl,_that.userId,_that.ticketTypeId,_that.ticketOptionIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PutCheckoutSessonRequest implements PutCheckoutSessonRequest {
  const _PutCheckoutSessonRequest({required this.successUrl, required this.cancelUrl, required this.userId, required this.ticketTypeId, required final  List<String> ticketOptionIds}): _ticketOptionIds = ticketOptionIds;
  factory _PutCheckoutSessonRequest.fromJson(Map<String, dynamic> json) => _$PutCheckoutSessonRequestFromJson(json);

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


/// Create a copy of PutCheckoutSessonRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PutCheckoutSessonRequestCopyWith<_PutCheckoutSessonRequest> get copyWith => __$PutCheckoutSessonRequestCopyWithImpl<_PutCheckoutSessonRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PutCheckoutSessonRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PutCheckoutSessonRequest&&(identical(other.successUrl, successUrl) || other.successUrl == successUrl)&&(identical(other.cancelUrl, cancelUrl) || other.cancelUrl == cancelUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._ticketOptionIds, _ticketOptionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,successUrl,cancelUrl,userId,ticketTypeId,const DeepCollectionEquality().hash(_ticketOptionIds));

@override
String toString() {
  return 'PutCheckoutSessonRequest(successUrl: $successUrl, cancelUrl: $cancelUrl, userId: $userId, ticketTypeId: $ticketTypeId, ticketOptionIds: $ticketOptionIds)';
}


}

/// @nodoc
abstract mixin class _$PutCheckoutSessonRequestCopyWith<$Res> implements $PutCheckoutSessonRequestCopyWith<$Res> {
  factory _$PutCheckoutSessonRequestCopyWith(_PutCheckoutSessonRequest value, $Res Function(_PutCheckoutSessonRequest) _then) = __$PutCheckoutSessonRequestCopyWithImpl;
@override @useResult
$Res call({
 String successUrl, String cancelUrl, String userId, String ticketTypeId, List<String> ticketOptionIds
});




}
/// @nodoc
class __$PutCheckoutSessonRequestCopyWithImpl<$Res>
    implements _$PutCheckoutSessonRequestCopyWith<$Res> {
  __$PutCheckoutSessonRequestCopyWithImpl(this._self, this._then);

  final _PutCheckoutSessonRequest _self;
  final $Res Function(_PutCheckoutSessonRequest) _then;

/// Create a copy of PutCheckoutSessonRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? successUrl = null,Object? cancelUrl = null,Object? userId = null,Object? ticketTypeId = null,Object? ticketOptionIds = null,}) {
  return _then(_PutCheckoutSessonRequest(
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
