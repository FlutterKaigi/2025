// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_type_with_options_and_counts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypeWithOptionsAndCounts {

 TicketTypes get ticketType; int get soldCount; int get reservedCount; List<TicketOptionWithCount> get options;
/// Create a copy of TicketTypeWithOptionsAndCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeWithOptionsAndCountsCopyWith<TicketTypeWithOptionsAndCounts> get copyWith => _$TicketTypeWithOptionsAndCountsCopyWithImpl<TicketTypeWithOptionsAndCounts>(this as TicketTypeWithOptionsAndCounts, _$identity);

  /// Serializes this TicketTypeWithOptionsAndCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypeWithOptionsAndCounts&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,soldCount,reservedCount,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketTypeWithOptionsAndCounts(ticketType: $ticketType, soldCount: $soldCount, reservedCount: $reservedCount, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketTypeWithOptionsAndCountsCopyWith<$Res>  {
  factory $TicketTypeWithOptionsAndCountsCopyWith(TicketTypeWithOptionsAndCounts value, $Res Function(TicketTypeWithOptionsAndCounts) _then) = _$TicketTypeWithOptionsAndCountsCopyWithImpl;
@useResult
$Res call({
 TicketTypes ticketType, int soldCount, int reservedCount, List<TicketOptionWithCount> options
});


$TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketTypeWithOptionsAndCountsCopyWithImpl<$Res>
    implements $TicketTypeWithOptionsAndCountsCopyWith<$Res> {
  _$TicketTypeWithOptionsAndCountsCopyWithImpl(this._self, this._then);

  final TicketTypeWithOptionsAndCounts _self;
  final $Res Function(TicketTypeWithOptionsAndCounts) _then;

/// Create a copy of TicketTypeWithOptionsAndCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? soldCount = null,Object? reservedCount = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptionWithCount>,
  ));
}
/// Create a copy of TicketTypeWithOptionsAndCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<$Res> get ticketType {
  
  return $TicketTypesCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketTypeWithOptionsAndCounts].
extension TicketTypeWithOptionsAndCountsPatterns on TicketTypeWithOptionsAndCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsAndCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypeWithOptionsAndCounts value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypeWithOptionsAndCounts value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketTypes ticketType,  int soldCount,  int reservedCount,  List<TicketOptionWithCount> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts() when $default != null:
return $default(_that.ticketType,_that.soldCount,_that.reservedCount,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketTypes ticketType,  int soldCount,  int reservedCount,  List<TicketOptionWithCount> options)  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts():
return $default(_that.ticketType,_that.soldCount,_that.reservedCount,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketTypes ticketType,  int soldCount,  int reservedCount,  List<TicketOptionWithCount> options)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypeWithOptionsAndCounts() when $default != null:
return $default(_that.ticketType,_that.soldCount,_that.reservedCount,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypeWithOptionsAndCounts implements TicketTypeWithOptionsAndCounts {
  const _TicketTypeWithOptionsAndCounts({required this.ticketType, required this.soldCount, required this.reservedCount, required final  List<TicketOptionWithCount> options}): _options = options;
  factory _TicketTypeWithOptionsAndCounts.fromJson(Map<String, dynamic> json) => _$TicketTypeWithOptionsAndCountsFromJson(json);

@override final  TicketTypes ticketType;
@override final  int soldCount;
@override final  int reservedCount;
 final  List<TicketOptionWithCount> _options;
@override List<TicketOptionWithCount> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TicketTypeWithOptionsAndCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypeWithOptionsAndCountsCopyWith<_TicketTypeWithOptionsAndCounts> get copyWith => __$TicketTypeWithOptionsAndCountsCopyWithImpl<_TicketTypeWithOptionsAndCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypeWithOptionsAndCountsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypeWithOptionsAndCounts&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,soldCount,reservedCount,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketTypeWithOptionsAndCounts(ticketType: $ticketType, soldCount: $soldCount, reservedCount: $reservedCount, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeWithOptionsAndCountsCopyWith<$Res> implements $TicketTypeWithOptionsAndCountsCopyWith<$Res> {
  factory _$TicketTypeWithOptionsAndCountsCopyWith(_TicketTypeWithOptionsAndCounts value, $Res Function(_TicketTypeWithOptionsAndCounts) _then) = __$TicketTypeWithOptionsAndCountsCopyWithImpl;
@override @useResult
$Res call({
 TicketTypes ticketType, int soldCount, int reservedCount, List<TicketOptionWithCount> options
});


@override $TicketTypesCopyWith<$Res> get ticketType;

}
/// @nodoc
class __$TicketTypeWithOptionsAndCountsCopyWithImpl<$Res>
    implements _$TicketTypeWithOptionsAndCountsCopyWith<$Res> {
  __$TicketTypeWithOptionsAndCountsCopyWithImpl(this._self, this._then);

  final _TicketTypeWithOptionsAndCounts _self;
  final $Res Function(_TicketTypeWithOptionsAndCounts) _then;

/// Create a copy of TicketTypeWithOptionsAndCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? soldCount = null,Object? reservedCount = null,Object? options = null,}) {
  return _then(_TicketTypeWithOptionsAndCounts(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketTypes,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptionWithCount>,
  ));
}

/// Create a copy of TicketTypeWithOptionsAndCounts
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
mixin _$TicketOptionWithCount {

 TicketOptions get ticketOption; int get soldCount; int get reservedCount;
/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketOptionWithCountCopyWith<TicketOptionWithCount> get copyWith => _$TicketOptionWithCountCopyWithImpl<TicketOptionWithCount>(this as TicketOptionWithCount, _$identity);

  /// Serializes this TicketOptionWithCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketOptionWithCount&&(identical(other.ticketOption, ticketOption) || other.ticketOption == ticketOption)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketOption,soldCount,reservedCount);

@override
String toString() {
  return 'TicketOptionWithCount(ticketOption: $ticketOption, soldCount: $soldCount, reservedCount: $reservedCount)';
}


}

/// @nodoc
abstract mixin class $TicketOptionWithCountCopyWith<$Res>  {
  factory $TicketOptionWithCountCopyWith(TicketOptionWithCount value, $Res Function(TicketOptionWithCount) _then) = _$TicketOptionWithCountCopyWithImpl;
@useResult
$Res call({
 TicketOptions ticketOption, int soldCount, int reservedCount
});


$TicketOptionsCopyWith<$Res> get ticketOption;

}
/// @nodoc
class _$TicketOptionWithCountCopyWithImpl<$Res>
    implements $TicketOptionWithCountCopyWith<$Res> {
  _$TicketOptionWithCountCopyWithImpl(this._self, this._then);

  final TicketOptionWithCount _self;
  final $Res Function(TicketOptionWithCount) _then;

/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketOption = null,Object? soldCount = null,Object? reservedCount = null,}) {
  return _then(_self.copyWith(
ticketOption: null == ticketOption ? _self.ticketOption : ticketOption // ignore: cast_nullable_to_non_nullable
as TicketOptions,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketOptionsCopyWith<$Res> get ticketOption {
  
  return $TicketOptionsCopyWith<$Res>(_self.ticketOption, (value) {
    return _then(_self.copyWith(ticketOption: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketOptionWithCount].
extension TicketOptionWithCountPatterns on TicketOptionWithCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketOptionWithCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketOptionWithCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketOptionWithCount value)  $default,){
final _that = this;
switch (_that) {
case _TicketOptionWithCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketOptionWithCount value)?  $default,){
final _that = this;
switch (_that) {
case _TicketOptionWithCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketOptions ticketOption,  int soldCount,  int reservedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketOptionWithCount() when $default != null:
return $default(_that.ticketOption,_that.soldCount,_that.reservedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketOptions ticketOption,  int soldCount,  int reservedCount)  $default,) {final _that = this;
switch (_that) {
case _TicketOptionWithCount():
return $default(_that.ticketOption,_that.soldCount,_that.reservedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketOptions ticketOption,  int soldCount,  int reservedCount)?  $default,) {final _that = this;
switch (_that) {
case _TicketOptionWithCount() when $default != null:
return $default(_that.ticketOption,_that.soldCount,_that.reservedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketOptionWithCount implements TicketOptionWithCount {
  const _TicketOptionWithCount({required this.ticketOption, required this.soldCount, required this.reservedCount});
  factory _TicketOptionWithCount.fromJson(Map<String, dynamic> json) => _$TicketOptionWithCountFromJson(json);

@override final  TicketOptions ticketOption;
@override final  int soldCount;
@override final  int reservedCount;

/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketOptionWithCountCopyWith<_TicketOptionWithCount> get copyWith => __$TicketOptionWithCountCopyWithImpl<_TicketOptionWithCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketOptionWithCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketOptionWithCount&&(identical(other.ticketOption, ticketOption) || other.ticketOption == ticketOption)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketOption,soldCount,reservedCount);

@override
String toString() {
  return 'TicketOptionWithCount(ticketOption: $ticketOption, soldCount: $soldCount, reservedCount: $reservedCount)';
}


}

/// @nodoc
abstract mixin class _$TicketOptionWithCountCopyWith<$Res> implements $TicketOptionWithCountCopyWith<$Res> {
  factory _$TicketOptionWithCountCopyWith(_TicketOptionWithCount value, $Res Function(_TicketOptionWithCount) _then) = __$TicketOptionWithCountCopyWithImpl;
@override @useResult
$Res call({
 TicketOptions ticketOption, int soldCount, int reservedCount
});


@override $TicketOptionsCopyWith<$Res> get ticketOption;

}
/// @nodoc
class __$TicketOptionWithCountCopyWithImpl<$Res>
    implements _$TicketOptionWithCountCopyWith<$Res> {
  __$TicketOptionWithCountCopyWithImpl(this._self, this._then);

  final _TicketOptionWithCount _self;
  final $Res Function(_TicketOptionWithCount) _then;

/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketOption = null,Object? soldCount = null,Object? reservedCount = null,}) {
  return _then(_TicketOptionWithCount(
ticketOption: null == ticketOption ? _self.ticketOption : ticketOption // ignore: cast_nullable_to_non_nullable
as TicketOptions,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TicketOptionWithCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketOptionsCopyWith<$Res> get ticketOption {
  
  return $TicketOptionsCopyWith<$Res>(_self.ticketOption, (value) {
    return _then(_self.copyWith(ticketOption: value));
  });
}
}

// dart format on
