// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntryLogs {

 String get ticketPurchaseId;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of EntryLogs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryLogsCopyWith<EntryLogs> get copyWith => _$EntryLogsCopyWithImpl<EntryLogs>(this as EntryLogs, _$identity);

  /// Serializes this EntryLogs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryLogs&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId,createdAt);

@override
String toString() {
  return 'EntryLogs(ticketPurchaseId: $ticketPurchaseId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EntryLogsCopyWith<$Res>  {
  factory $EntryLogsCopyWith(EntryLogs value, $Res Function(EntryLogs) _then) = _$EntryLogsCopyWithImpl;
@useResult
$Res call({
 String ticketPurchaseId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$EntryLogsCopyWithImpl<$Res>
    implements $EntryLogsCopyWith<$Res> {
  _$EntryLogsCopyWithImpl(this._self, this._then);

  final EntryLogs _self;
  final $Res Function(EntryLogs) _then;

/// Create a copy of EntryLogs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketPurchaseId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EntryLogs].
extension EntryLogsPatterns on EntryLogs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryLogs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryLogs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryLogs value)  $default,){
final _that = this;
switch (_that) {
case _EntryLogs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryLogs value)?  $default,){
final _that = this;
switch (_that) {
case _EntryLogs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticketPurchaseId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryLogs() when $default != null:
return $default(_that.ticketPurchaseId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticketPurchaseId, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _EntryLogs():
return $default(_that.ticketPurchaseId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticketPurchaseId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _EntryLogs() when $default != null:
return $default(_that.ticketPurchaseId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntryLogs implements EntryLogs {
  const _EntryLogs({required this.ticketPurchaseId, @RequiredDateTimeConverter() required this.createdAt});
  factory _EntryLogs.fromJson(Map<String, dynamic> json) => _$EntryLogsFromJson(json);

@override final  String ticketPurchaseId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of EntryLogs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryLogsCopyWith<_EntryLogs> get copyWith => __$EntryLogsCopyWithImpl<_EntryLogs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryLogsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryLogs&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId,createdAt);

@override
String toString() {
  return 'EntryLogs(ticketPurchaseId: $ticketPurchaseId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EntryLogsCopyWith<$Res> implements $EntryLogsCopyWith<$Res> {
  factory _$EntryLogsCopyWith(_EntryLogs value, $Res Function(_EntryLogs) _then) = __$EntryLogsCopyWithImpl;
@override @useResult
$Res call({
 String ticketPurchaseId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$EntryLogsCopyWithImpl<$Res>
    implements _$EntryLogsCopyWith<$Res> {
  __$EntryLogsCopyWithImpl(this._self, this._then);

  final _EntryLogs _self;
  final $Res Function(_EntryLogs) _then;

/// Create a copy of EntryLogs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketPurchaseId = null,Object? createdAt = null,}) {
  return _then(_EntryLogs(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
