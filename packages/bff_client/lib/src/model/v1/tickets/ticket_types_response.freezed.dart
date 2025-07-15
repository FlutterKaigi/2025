// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_types_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypesResponse {

 List<TicketTypes> get ticketTypes;
/// Create a copy of TicketTypesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypesResponseCopyWith<TicketTypesResponse> get copyWith => _$TicketTypesResponseCopyWithImpl<TicketTypesResponse>(this as TicketTypesResponse, _$identity);

  /// Serializes this TicketTypesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypesResponse&&const DeepCollectionEquality().equals(other.ticketTypes, ticketTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ticketTypes));

@override
String toString() {
  return 'TicketTypesResponse(ticketTypes: $ticketTypes)';
}


}

/// @nodoc
abstract mixin class $TicketTypesResponseCopyWith<$Res>  {
  factory $TicketTypesResponseCopyWith(TicketTypesResponse value, $Res Function(TicketTypesResponse) _then) = _$TicketTypesResponseCopyWithImpl;
@useResult
$Res call({
 List<TicketTypes> ticketTypes
});




}
/// @nodoc
class _$TicketTypesResponseCopyWithImpl<$Res>
    implements $TicketTypesResponseCopyWith<$Res> {
  _$TicketTypesResponseCopyWithImpl(this._self, this._then);

  final TicketTypesResponse _self;
  final $Res Function(TicketTypesResponse) _then;

/// Create a copy of TicketTypesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketTypes = null,}) {
  return _then(_self.copyWith(
ticketTypes: null == ticketTypes ? _self.ticketTypes : ticketTypes // ignore: cast_nullable_to_non_nullable
as List<TicketTypes>,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketTypesResponse].
extension TicketTypesResponsePatterns on TicketTypesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypesResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketTypes> ticketTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypesResponse() when $default != null:
return $default(_that.ticketTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketTypes> ticketTypes)  $default,) {final _that = this;
switch (_that) {
case _TicketTypesResponse():
return $default(_that.ticketTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketTypes> ticketTypes)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypesResponse() when $default != null:
return $default(_that.ticketTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypesResponse implements TicketTypesResponse {
  const _TicketTypesResponse({required final  List<TicketTypes> ticketTypes}): _ticketTypes = ticketTypes;
  factory _TicketTypesResponse.fromJson(Map<String, dynamic> json) => _$TicketTypesResponseFromJson(json);

 final  List<TicketTypes> _ticketTypes;
@override List<TicketTypes> get ticketTypes {
  if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketTypes);
}


/// Create a copy of TicketTypesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypesResponseCopyWith<_TicketTypesResponse> get copyWith => __$TicketTypesResponseCopyWithImpl<_TicketTypesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypesResponse&&const DeepCollectionEquality().equals(other._ticketTypes, _ticketTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ticketTypes));

@override
String toString() {
  return 'TicketTypesResponse(ticketTypes: $ticketTypes)';
}


}

/// @nodoc
abstract mixin class _$TicketTypesResponseCopyWith<$Res> implements $TicketTypesResponseCopyWith<$Res> {
  factory _$TicketTypesResponseCopyWith(_TicketTypesResponse value, $Res Function(_TicketTypesResponse) _then) = __$TicketTypesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TicketTypes> ticketTypes
});




}
/// @nodoc
class __$TicketTypesResponseCopyWithImpl<$Res>
    implements _$TicketTypesResponseCopyWith<$Res> {
  __$TicketTypesResponseCopyWithImpl(this._self, this._then);

  final _TicketTypesResponse _self;
  final $Res Function(_TicketTypesResponse) _then;

/// Create a copy of TicketTypesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketTypes = null,}) {
  return _then(_TicketTypesResponse(
ticketTypes: null == ticketTypes ? _self._ticketTypes : ticketTypes // ignore: cast_nullable_to_non_nullable
as List<TicketTypes>,
  ));
}


}

// dart format on
