// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_type_with_options_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypeWithOptionsResponse {

 TicketType get ticketType; List<TicketOption> get options;
/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeWithOptionsResponseCopyWith<TicketTypeWithOptionsResponse> get copyWith => _$TicketTypeWithOptionsResponseCopyWithImpl<TicketTypeWithOptionsResponse>(this as TicketTypeWithOptionsResponse, _$identity);

  /// Serializes this TicketTypeWithOptionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypeWithOptionsResponse&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketTypeWithOptionsResponse(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketTypeWithOptionsResponseCopyWith<$Res>  {
  factory $TicketTypeWithOptionsResponseCopyWith(TicketTypeWithOptionsResponse value, $Res Function(TicketTypeWithOptionsResponse) _then) = _$TicketTypeWithOptionsResponseCopyWithImpl;
@useResult
$Res call({
 TicketType ticketType, List<TicketOption> options
});


$TicketTypeCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketTypeWithOptionsResponseCopyWithImpl<$Res>
    implements $TicketTypeWithOptionsResponseCopyWith<$Res> {
  _$TicketTypeWithOptionsResponseCopyWithImpl(this._self, this._then);

  final TicketTypeWithOptionsResponse _self;
  final $Res Function(TicketTypeWithOptionsResponse) _then;

/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,
  ));
}
/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketTypeWithOptionsResponse].
extension TicketTypeWithOptionsResponsePatterns on TicketTypeWithOptionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypeWithOptionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketType ticketType,  List<TicketOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse() when $default != null:
return $default(_that.ticketType,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketType ticketType,  List<TicketOption> options)  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse():
return $default(_that.ticketType,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketType ticketType,  List<TicketOption> options)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsResponse() when $default != null:
return $default(_that.ticketType,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypeWithOptionsResponse implements TicketTypeWithOptionsResponse {
  const _TicketTypeWithOptionsResponse({required this.ticketType, required final  List<TicketOption> options}): _options = options;
  factory _TicketTypeWithOptionsResponse.fromJson(Map<String, dynamic> json) => _$TicketTypeWithOptionsResponseFromJson(json);

@override final  TicketType ticketType;
 final  List<TicketOption> _options;
@override List<TicketOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypeWithOptionsResponseCopyWith<_TicketTypeWithOptionsResponse> get copyWith => __$TicketTypeWithOptionsResponseCopyWithImpl<_TicketTypeWithOptionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypeWithOptionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypeWithOptionsResponse&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketTypeWithOptionsResponse(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeWithOptionsResponseCopyWith<$Res> implements $TicketTypeWithOptionsResponseCopyWith<$Res> {
  factory _$TicketTypeWithOptionsResponseCopyWith(_TicketTypeWithOptionsResponse value, $Res Function(_TicketTypeWithOptionsResponse) _then) = __$TicketTypeWithOptionsResponseCopyWithImpl;
@override @useResult
$Res call({
 TicketType ticketType, List<TicketOption> options
});


@override $TicketTypeCopyWith<$Res> get ticketType;

}
/// @nodoc
class __$TicketTypeWithOptionsResponseCopyWithImpl<$Res>
    implements _$TicketTypeWithOptionsResponseCopyWith<$Res> {
  __$TicketTypeWithOptionsResponseCopyWithImpl(this._self, this._then);

  final _TicketTypeWithOptionsResponse _self;
  final $Res Function(_TicketTypeWithOptionsResponse) _then;

/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_TicketTypeWithOptionsResponse(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,
  ));
}

/// Create a copy of TicketTypeWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}

// dart format on
