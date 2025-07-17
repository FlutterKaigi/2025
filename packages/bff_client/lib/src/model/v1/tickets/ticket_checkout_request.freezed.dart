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

 String get ticketTypeId; List<TicketOptionRequest> get options;
/// Create a copy of TicketCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutRequestCopyWith<TicketCheckoutRequest> get copyWith => _$TicketCheckoutRequestCopyWithImpl<TicketCheckoutRequest>(this as TicketCheckoutRequest, _$identity);

  /// Serializes this TicketCheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutRequest&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketTypeId,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketCheckoutRequest(ticketTypeId: $ticketTypeId, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutRequestCopyWith<$Res>  {
  factory $TicketCheckoutRequestCopyWith(TicketCheckoutRequest value, $Res Function(TicketCheckoutRequest) _then) = _$TicketCheckoutRequestCopyWithImpl;
@useResult
$Res call({
 String ticketTypeId, List<TicketOptionRequest> options
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
@pragma('vm:prefer-inline') @override $Res call({Object? ticketTypeId = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptionRequest>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticketTypeId,  List<TicketOptionRequest> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
return $default(_that.ticketTypeId,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticketTypeId,  List<TicketOptionRequest> options)  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest():
return $default(_that.ticketTypeId,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticketTypeId,  List<TicketOptionRequest> options)?  $default,) {final _that = this;
switch (_that) {
case _TicketCheckoutRequest() when $default != null:
return $default(_that.ticketTypeId,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketCheckoutRequest implements TicketCheckoutRequest {
  const _TicketCheckoutRequest({required this.ticketTypeId, required final  List<TicketOptionRequest> options}): _options = options;
  factory _TicketCheckoutRequest.fromJson(Map<String, dynamic> json) => _$TicketCheckoutRequestFromJson(json);

@override final  String ticketTypeId;
 final  List<TicketOptionRequest> _options;
@override List<TicketOptionRequest> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketCheckoutRequest&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketTypeId,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketCheckoutRequest(ticketTypeId: $ticketTypeId, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TicketCheckoutRequestCopyWith<$Res> implements $TicketCheckoutRequestCopyWith<$Res> {
  factory _$TicketCheckoutRequestCopyWith(_TicketCheckoutRequest value, $Res Function(_TicketCheckoutRequest) _then) = __$TicketCheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
 String ticketTypeId, List<TicketOptionRequest> options
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
@override @pragma('vm:prefer-inline') $Res call({Object? ticketTypeId = null,Object? options = null,}) {
  return _then(_TicketCheckoutRequest(
ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptionRequest>,
  ));
}


}


/// @nodoc
mixin _$TicketOptionRequest {

 String get optionId; String get value;
/// Create a copy of TicketOptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketOptionRequestCopyWith<TicketOptionRequest> get copyWith => _$TicketOptionRequestCopyWithImpl<TicketOptionRequest>(this as TicketOptionRequest, _$identity);

  /// Serializes this TicketOptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketOptionRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,value);

@override
String toString() {
  return 'TicketOptionRequest(optionId: $optionId, value: $value)';
}


}

/// @nodoc
abstract mixin class $TicketOptionRequestCopyWith<$Res>  {
  factory $TicketOptionRequestCopyWith(TicketOptionRequest value, $Res Function(TicketOptionRequest) _then) = _$TicketOptionRequestCopyWithImpl;
@useResult
$Res call({
 String optionId, String value
});




}
/// @nodoc
class _$TicketOptionRequestCopyWithImpl<$Res>
    implements $TicketOptionRequestCopyWith<$Res> {
  _$TicketOptionRequestCopyWithImpl(this._self, this._then);

  final TicketOptionRequest _self;
  final $Res Function(TicketOptionRequest) _then;

/// Create a copy of TicketOptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? optionId = null,Object? value = null,}) {
  return _then(_self.copyWith(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketOptionRequest].
extension TicketOptionRequestPatterns on TicketOptionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketOptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketOptionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketOptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _TicketOptionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketOptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TicketOptionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String optionId,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketOptionRequest() when $default != null:
return $default(_that.optionId,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String optionId,  String value)  $default,) {final _that = this;
switch (_that) {
case _TicketOptionRequest():
return $default(_that.optionId,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String optionId,  String value)?  $default,) {final _that = this;
switch (_that) {
case _TicketOptionRequest() when $default != null:
return $default(_that.optionId,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketOptionRequest implements TicketOptionRequest {
  const _TicketOptionRequest({required this.optionId, required this.value});
  factory _TicketOptionRequest.fromJson(Map<String, dynamic> json) => _$TicketOptionRequestFromJson(json);

@override final  String optionId;
@override final  String value;

/// Create a copy of TicketOptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketOptionRequestCopyWith<_TicketOptionRequest> get copyWith => __$TicketOptionRequestCopyWithImpl<_TicketOptionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketOptionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketOptionRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,value);

@override
String toString() {
  return 'TicketOptionRequest(optionId: $optionId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$TicketOptionRequestCopyWith<$Res> implements $TicketOptionRequestCopyWith<$Res> {
  factory _$TicketOptionRequestCopyWith(_TicketOptionRequest value, $Res Function(_TicketOptionRequest) _then) = __$TicketOptionRequestCopyWithImpl;
@override @useResult
$Res call({
 String optionId, String value
});




}
/// @nodoc
class __$TicketOptionRequestCopyWithImpl<$Res>
    implements _$TicketOptionRequestCopyWith<$Res> {
  __$TicketOptionRequestCopyWithImpl(this._self, this._then);

  final _TicketOptionRequest _self;
  final $Res Function(_TicketOptionRequest) _then;

/// Create a copy of TicketOptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? optionId = null,Object? value = null,}) {
  return _then(_TicketOptionRequest(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
