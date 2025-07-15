// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_type_with_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypeWithOptions {

@JsonKey(name: 'ticket_type') TicketTypes get ticketType; List<TicketOptions> get options;
/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeWithOptionsCopyWith<TicketTypeWithOptions> get copyWith => _$TicketTypeWithOptionsCopyWithImpl<TicketTypeWithOptions>(this as TicketTypeWithOptions, _$identity);

  /// Serializes this TicketTypeWithOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypeWithOptions&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketTypeWithOptions(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketTypeWithOptionsCopyWith<$Res>  {
  factory $TicketTypeWithOptionsCopyWith(TicketTypeWithOptions value, $Res Function(TicketTypeWithOptions) _then) = _$TicketTypeWithOptionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ticket_type') TicketTypes ticketType, List<TicketOptions> options
});


$TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketTypeWithOptionsCopyWithImpl<$Res>
    implements $TicketTypeWithOptionsCopyWith<$Res> {
  _$TicketTypeWithOptionsCopyWithImpl(this._self, this._then);

  final TicketTypeWithOptions _self;
  final $Res Function(TicketTypeWithOptions) _then;

/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,
  ));
}
/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<$Res> get ticketType {
  
  return $TicketTypesCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketTypeWithOptions].
extension TicketTypeWithOptionsPatterns on TicketTypeWithOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypeWithOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypeWithOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypeWithOptions value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypeWithOptions value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ticket_type')  TicketTypes ticketType,  List<TicketOptions> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypeWithOptions() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ticket_type')  TicketTypes ticketType,  List<TicketOptions> options)  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptions():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ticket_type')  TicketTypes ticketType,  List<TicketOptions> options)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptions() when $default != null:
return $default(_that.ticketType,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypeWithOptions implements TicketTypeWithOptions {
  const _TicketTypeWithOptions({@JsonKey(name: 'ticket_type') required this.ticketType, required final  List<TicketOptions> options}): _options = options;
  factory _TicketTypeWithOptions.fromJson(Map<String, dynamic> json) => _$TicketTypeWithOptionsFromJson(json);

@override@JsonKey(name: 'ticket_type') final  TicketTypes ticketType;
 final  List<TicketOptions> _options;
@override List<TicketOptions> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypeWithOptionsCopyWith<_TicketTypeWithOptions> get copyWith => __$TicketTypeWithOptionsCopyWithImpl<_TicketTypeWithOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypeWithOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypeWithOptions&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketTypeWithOptions(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeWithOptionsCopyWith<$Res> implements $TicketTypeWithOptionsCopyWith<$Res> {
  factory _$TicketTypeWithOptionsCopyWith(_TicketTypeWithOptions value, $Res Function(_TicketTypeWithOptions) _then) = __$TicketTypeWithOptionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ticket_type') TicketTypes ticketType, List<TicketOptions> options
});


@override $TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class __$TicketTypeWithOptionsCopyWithImpl<$Res>
    implements _$TicketTypeWithOptionsCopyWith<$Res> {
  __$TicketTypeWithOptionsCopyWithImpl(this._self, this._then);

  final _TicketTypeWithOptions _self;
  final $Res Function(_TicketTypeWithOptions) _then;

/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_TicketTypeWithOptions(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,
  ));
}

/// Create a copy of TicketTypeWithOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<$Res> get ticketType {
  
  return $TicketTypesCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}

// dart format on
