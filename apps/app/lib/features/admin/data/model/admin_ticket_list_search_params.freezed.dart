// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_ticket_list_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminTicketListSearchParams {

 String? get userId; String? get ticketTypeId; String? get status; bool? get hasEntryLog; String? get ticketOptionId;
/// Create a copy of AdminTicketListSearchParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminTicketListSearchParamsCopyWith<AdminTicketListSearchParams> get copyWith => _$AdminTicketListSearchParamsCopyWithImpl<AdminTicketListSearchParams>(this as AdminTicketListSearchParams, _$identity);

  /// Serializes this AdminTicketListSearchParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminTicketListSearchParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasEntryLog, hasEntryLog) || other.hasEntryLog == hasEntryLog)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,ticketTypeId,status,hasEntryLog,ticketOptionId);

@override
String toString() {
  return 'AdminTicketListSearchParams(userId: $userId, ticketTypeId: $ticketTypeId, status: $status, hasEntryLog: $hasEntryLog, ticketOptionId: $ticketOptionId)';
}


}

/// @nodoc
abstract mixin class $AdminTicketListSearchParamsCopyWith<$Res>  {
  factory $AdminTicketListSearchParamsCopyWith(AdminTicketListSearchParams value, $Res Function(AdminTicketListSearchParams) _then) = _$AdminTicketListSearchParamsCopyWithImpl;
@useResult
$Res call({
 String? userId, String? ticketTypeId, String? status, bool? hasEntryLog, String? ticketOptionId
});




}
/// @nodoc
class _$AdminTicketListSearchParamsCopyWithImpl<$Res>
    implements $AdminTicketListSearchParamsCopyWith<$Res> {
  _$AdminTicketListSearchParamsCopyWithImpl(this._self, this._then);

  final AdminTicketListSearchParams _self;
  final $Res Function(AdminTicketListSearchParams) _then;

/// Create a copy of AdminTicketListSearchParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? ticketTypeId = freezed,Object? status = freezed,Object? hasEntryLog = freezed,Object? ticketOptionId = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ticketTypeId: freezed == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasEntryLog: freezed == hasEntryLog ? _self.hasEntryLog : hasEntryLog // ignore: cast_nullable_to_non_nullable
as bool?,ticketOptionId: freezed == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminTicketListSearchParams].
extension AdminTicketListSearchParamsPatterns on AdminTicketListSearchParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminTicketListSearchParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminTicketListSearchParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminTicketListSearchParams value)  $default,){
final _that = this;
switch (_that) {
case _AdminTicketListSearchParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminTicketListSearchParams value)?  $default,){
final _that = this;
switch (_that) {
case _AdminTicketListSearchParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? ticketTypeId,  String? status,  bool? hasEntryLog,  String? ticketOptionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminTicketListSearchParams() when $default != null:
return $default(_that.userId,_that.ticketTypeId,_that.status,_that.hasEntryLog,_that.ticketOptionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? ticketTypeId,  String? status,  bool? hasEntryLog,  String? ticketOptionId)  $default,) {final _that = this;
switch (_that) {
case _AdminTicketListSearchParams():
return $default(_that.userId,_that.ticketTypeId,_that.status,_that.hasEntryLog,_that.ticketOptionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? ticketTypeId,  String? status,  bool? hasEntryLog,  String? ticketOptionId)?  $default,) {final _that = this;
switch (_that) {
case _AdminTicketListSearchParams() when $default != null:
return $default(_that.userId,_that.ticketTypeId,_that.status,_that.hasEntryLog,_that.ticketOptionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminTicketListSearchParams implements AdminTicketListSearchParams {
  const _AdminTicketListSearchParams({this.userId, this.ticketTypeId, this.status, this.hasEntryLog, this.ticketOptionId});
  factory _AdminTicketListSearchParams.fromJson(Map<String, dynamic> json) => _$AdminTicketListSearchParamsFromJson(json);

@override final  String? userId;
@override final  String? ticketTypeId;
@override final  String? status;
@override final  bool? hasEntryLog;
@override final  String? ticketOptionId;

/// Create a copy of AdminTicketListSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTicketListSearchParamsCopyWith<_AdminTicketListSearchParams> get copyWith => __$AdminTicketListSearchParamsCopyWithImpl<_AdminTicketListSearchParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminTicketListSearchParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTicketListSearchParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasEntryLog, hasEntryLog) || other.hasEntryLog == hasEntryLog)&&(identical(other.ticketOptionId, ticketOptionId) || other.ticketOptionId == ticketOptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,ticketTypeId,status,hasEntryLog,ticketOptionId);

@override
String toString() {
  return 'AdminTicketListSearchParams(userId: $userId, ticketTypeId: $ticketTypeId, status: $status, hasEntryLog: $hasEntryLog, ticketOptionId: $ticketOptionId)';
}


}

/// @nodoc
abstract mixin class _$AdminTicketListSearchParamsCopyWith<$Res> implements $AdminTicketListSearchParamsCopyWith<$Res> {
  factory _$AdminTicketListSearchParamsCopyWith(_AdminTicketListSearchParams value, $Res Function(_AdminTicketListSearchParams) _then) = __$AdminTicketListSearchParamsCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? ticketTypeId, String? status, bool? hasEntryLog, String? ticketOptionId
});




}
/// @nodoc
class __$AdminTicketListSearchParamsCopyWithImpl<$Res>
    implements _$AdminTicketListSearchParamsCopyWith<$Res> {
  __$AdminTicketListSearchParamsCopyWithImpl(this._self, this._then);

  final _AdminTicketListSearchParams _self;
  final $Res Function(_AdminTicketListSearchParams) _then;

/// Create a copy of AdminTicketListSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? ticketTypeId = freezed,Object? status = freezed,Object? hasEntryLog = freezed,Object? ticketOptionId = freezed,}) {
  return _then(_AdminTicketListSearchParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,ticketTypeId: freezed == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasEntryLog: freezed == hasEntryLog ? _self.hasEntryLog : hasEntryLog // ignore: cast_nullable_to_non_nullable
as bool?,ticketOptionId: freezed == ticketOptionId ? _self.ticketOptionId : ticketOptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
