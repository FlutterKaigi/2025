// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_refund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketRefundResponse {

@JsonKey(name: 'workflow_id') String get workflowId;
/// Create a copy of TicketRefundResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketRefundResponseCopyWith<TicketRefundResponse> get copyWith => _$TicketRefundResponseCopyWithImpl<TicketRefundResponse>(this as TicketRefundResponse, _$identity);

  /// Serializes this TicketRefundResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketRefundResponse&&(identical(other.workflowId, workflowId) || other.workflowId == workflowId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workflowId);

@override
String toString() {
  return 'TicketRefundResponse(workflowId: $workflowId)';
}


}

/// @nodoc
abstract mixin class $TicketRefundResponseCopyWith<$Res>  {
  factory $TicketRefundResponseCopyWith(TicketRefundResponse value, $Res Function(TicketRefundResponse) _then) = _$TicketRefundResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'workflow_id') String workflowId
});




}
/// @nodoc
class _$TicketRefundResponseCopyWithImpl<$Res>
    implements $TicketRefundResponseCopyWith<$Res> {
  _$TicketRefundResponseCopyWithImpl(this._self, this._then);

  final TicketRefundResponse _self;
  final $Res Function(TicketRefundResponse) _then;

/// Create a copy of TicketRefundResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workflowId = null,}) {
  return _then(_self.copyWith(
workflowId: null == workflowId ? _self.workflowId : workflowId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketRefundResponse].
extension TicketRefundResponsePatterns on TicketRefundResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketRefundResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketRefundResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketRefundResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketRefundResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketRefundResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketRefundResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'workflow_id')  String workflowId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketRefundResponse() when $default != null:
return $default(_that.workflowId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'workflow_id')  String workflowId)  $default,) {final _that = this;
switch (_that) {
case _TicketRefundResponse():
return $default(_that.workflowId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'workflow_id')  String workflowId)?  $default,) {final _that = this;
switch (_that) {
case _TicketRefundResponse() when $default != null:
return $default(_that.workflowId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketRefundResponse implements TicketRefundResponse {
  const _TicketRefundResponse({@JsonKey(name: 'workflow_id') required this.workflowId});
  factory _TicketRefundResponse.fromJson(Map<String, dynamic> json) => _$TicketRefundResponseFromJson(json);

@override@JsonKey(name: 'workflow_id') final  String workflowId;

/// Create a copy of TicketRefundResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketRefundResponseCopyWith<_TicketRefundResponse> get copyWith => __$TicketRefundResponseCopyWithImpl<_TicketRefundResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketRefundResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketRefundResponse&&(identical(other.workflowId, workflowId) || other.workflowId == workflowId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workflowId);

@override
String toString() {
  return 'TicketRefundResponse(workflowId: $workflowId)';
}


}

/// @nodoc
abstract mixin class _$TicketRefundResponseCopyWith<$Res> implements $TicketRefundResponseCopyWith<$Res> {
  factory _$TicketRefundResponseCopyWith(_TicketRefundResponse value, $Res Function(_TicketRefundResponse) _then) = __$TicketRefundResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'workflow_id') String workflowId
});




}
/// @nodoc
class __$TicketRefundResponseCopyWithImpl<$Res>
    implements _$TicketRefundResponseCopyWith<$Res> {
  __$TicketRefundResponseCopyWithImpl(this._self, this._then);

  final _TicketRefundResponse _self;
  final $Res Function(_TicketRefundResponse) _then;

/// Create a copy of TicketRefundResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workflowId = null,}) {
  return _then(_TicketRefundResponse(
workflowId: null == workflowId ? _self.workflowId : workflowId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
