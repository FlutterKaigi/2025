// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_types_with_options_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypeWithOptionsItem {

 TicketTypes get ticketType; List<TicketOptions> get options;
/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeWithOptionsItemCopyWith<TicketTypeWithOptionsItem> get copyWith => _$TicketTypeWithOptionsItemCopyWithImpl<TicketTypeWithOptionsItem>(this as TicketTypeWithOptionsItem, _$identity);

  /// Serializes this TicketTypeWithOptionsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypeWithOptionsItem&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketTypeWithOptionsItem(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketTypeWithOptionsItemCopyWith<$Res>  {
  factory $TicketTypeWithOptionsItemCopyWith(TicketTypeWithOptionsItem value, $Res Function(TicketTypeWithOptionsItem) _then) = _$TicketTypeWithOptionsItemCopyWithImpl;
@useResult
$Res call({
 TicketTypes ticketType, List<TicketOptions> options
});


$TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketTypeWithOptionsItemCopyWithImpl<$Res>
    implements $TicketTypeWithOptionsItemCopyWith<$Res> {
  _$TicketTypeWithOptionsItemCopyWithImpl(this._self, this._then);

  final TicketTypeWithOptionsItem _self;
  final $Res Function(TicketTypeWithOptionsItem) _then;

/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,
  ));
}
/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<$Res> get ticketType {
  
  return $TicketTypesCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketTypeWithOptionsItem].
extension TicketTypeWithOptionsItemPatterns on TicketTypeWithOptionsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsItem value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypeWithOptionsItem value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketTypes ticketType,  List<TicketOptions> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketTypes ticketType,  List<TicketOptions> options)  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketTypes ticketType,  List<TicketOptions> options)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsItem() when $default != null:
return $default(_that.ticketType,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypeWithOptionsItem implements TicketTypeWithOptionsItem {
  const _TicketTypeWithOptionsItem({required this.ticketType, required final  List<TicketOptions> options}): _options = options;
  factory _TicketTypeWithOptionsItem.fromJson(Map<String, dynamic> json) => _$TicketTypeWithOptionsItemFromJson(json);

@override final  TicketTypes ticketType;
 final  List<TicketOptions> _options;
@override List<TicketOptions> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypeWithOptionsItemCopyWith<_TicketTypeWithOptionsItem> get copyWith => __$TicketTypeWithOptionsItemCopyWithImpl<_TicketTypeWithOptionsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypeWithOptionsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypeWithOptionsItem&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketTypeWithOptionsItem(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeWithOptionsItemCopyWith<$Res> implements $TicketTypeWithOptionsItemCopyWith<$Res> {
  factory _$TicketTypeWithOptionsItemCopyWith(_TicketTypeWithOptionsItem value, $Res Function(_TicketTypeWithOptionsItem) _then) = __$TicketTypeWithOptionsItemCopyWithImpl;
@override @useResult
$Res call({
 TicketTypes ticketType, List<TicketOptions> options
});


@override $TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class __$TicketTypeWithOptionsItemCopyWithImpl<$Res>
    implements _$TicketTypeWithOptionsItemCopyWith<$Res> {
  __$TicketTypeWithOptionsItemCopyWithImpl(this._self, this._then);

  final _TicketTypeWithOptionsItem _self;
  final $Res Function(_TicketTypeWithOptionsItem) _then;

/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_TicketTypeWithOptionsItem(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,
  ));
}

/// Create a copy of TicketTypeWithOptionsItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<$Res> get ticketType {
  
  return $TicketTypesCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// @nodoc
mixin _$TicketTypesWithOptionsResponse {

 List<TicketTypeWithOptionsItem> get ticketTypes;
/// Create a copy of TicketTypesWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypesWithOptionsResponseCopyWith<TicketTypesWithOptionsResponse> get copyWith => _$TicketTypesWithOptionsResponseCopyWithImpl<TicketTypesWithOptionsResponse>(this as TicketTypesWithOptionsResponse, _$identity);

  /// Serializes this TicketTypesWithOptionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypesWithOptionsResponse&&const DeepCollectionEquality().equals(other.ticketTypes, ticketTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ticketTypes));

@override
String toString() {
  return 'TicketTypesWithOptionsResponse(ticketTypes: $ticketTypes)';
}


}

/// @nodoc
abstract mixin class $TicketTypesWithOptionsResponseCopyWith<$Res>  {
  factory $TicketTypesWithOptionsResponseCopyWith(TicketTypesWithOptionsResponse value, $Res Function(TicketTypesWithOptionsResponse) _then) = _$TicketTypesWithOptionsResponseCopyWithImpl;
@useResult
$Res call({
 List<TicketTypeWithOptionsItem> ticketTypes
});




}
/// @nodoc
class _$TicketTypesWithOptionsResponseCopyWithImpl<$Res>
    implements $TicketTypesWithOptionsResponseCopyWith<$Res> {
  _$TicketTypesWithOptionsResponseCopyWithImpl(this._self, this._then);

  final TicketTypesWithOptionsResponse _self;
  final $Res Function(TicketTypesWithOptionsResponse) _then;

/// Create a copy of TicketTypesWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketTypes = null,}) {
  return _then(_self.copyWith(
ticketTypes: null == ticketTypes ? _self.ticketTypes : ticketTypes // ignore: cast_nullable_to_non_nullable
as List<TicketTypeWithOptionsItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketTypesWithOptionsResponse].
extension TicketTypesWithOptionsResponsePatterns on TicketTypesWithOptionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypesWithOptionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypesWithOptionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypesWithOptionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketTypeWithOptionsItem> ticketTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketTypeWithOptionsItem> ticketTypes)  $default,) {final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketTypeWithOptionsItem> ticketTypes)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypesWithOptionsResponse() when $default != null:
return $default(_that.ticketTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypesWithOptionsResponse implements TicketTypesWithOptionsResponse {
  const _TicketTypesWithOptionsResponse({required final  List<TicketTypeWithOptionsItem> ticketTypes}): _ticketTypes = ticketTypes;
  factory _TicketTypesWithOptionsResponse.fromJson(Map<String, dynamic> json) => _$TicketTypesWithOptionsResponseFromJson(json);

 final  List<TicketTypeWithOptionsItem> _ticketTypes;
@override List<TicketTypeWithOptionsItem> get ticketTypes {
  if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketTypes);
}


/// Create a copy of TicketTypesWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypesWithOptionsResponseCopyWith<_TicketTypesWithOptionsResponse> get copyWith => __$TicketTypesWithOptionsResponseCopyWithImpl<_TicketTypesWithOptionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypesWithOptionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypesWithOptionsResponse&&const DeepCollectionEquality().equals(other._ticketTypes, _ticketTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ticketTypes));

@override
String toString() {
  return 'TicketTypesWithOptionsResponse(ticketTypes: $ticketTypes)';
}


}

/// @nodoc
abstract mixin class _$TicketTypesWithOptionsResponseCopyWith<$Res> implements $TicketTypesWithOptionsResponseCopyWith<$Res> {
  factory _$TicketTypesWithOptionsResponseCopyWith(_TicketTypesWithOptionsResponse value, $Res Function(_TicketTypesWithOptionsResponse) _then) = __$TicketTypesWithOptionsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TicketTypeWithOptionsItem> ticketTypes
});




}
/// @nodoc
class __$TicketTypesWithOptionsResponseCopyWithImpl<$Res>
    implements _$TicketTypesWithOptionsResponseCopyWith<$Res> {
  __$TicketTypesWithOptionsResponseCopyWithImpl(this._self, this._then);

  final _TicketTypesWithOptionsResponse _self;
  final $Res Function(_TicketTypesWithOptionsResponse) _then;

/// Create a copy of TicketTypesWithOptionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketTypes = null,}) {
  return _then(_TicketTypesWithOptionsResponse(
ticketTypes: null == ticketTypes ? _self._ticketTypes : ticketTypes // ignore: cast_nullable_to_non_nullable
as List<TicketTypeWithOptionsItem>,
  ));
}


}

// dart format on
