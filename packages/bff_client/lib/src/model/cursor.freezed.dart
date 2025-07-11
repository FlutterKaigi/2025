// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cursor {

 CursorType get type; String get id;
/// Create a copy of Cursor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorCopyWith<Cursor> get copyWith => _$CursorCopyWithImpl<Cursor>(this as Cursor, _$identity);

  /// Serializes this Cursor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cursor&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'Cursor(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $CursorCopyWith<$Res>  {
  factory $CursorCopyWith(Cursor value, $Res Function(Cursor) _then) = _$CursorCopyWithImpl;
@useResult
$Res call({
 CursorType type, String id
});




}
/// @nodoc
class _$CursorCopyWithImpl<$Res>
    implements $CursorCopyWith<$Res> {
  _$CursorCopyWithImpl(this._self, this._then);

  final Cursor _self;
  final $Res Function(Cursor) _then;

/// Create a copy of Cursor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CursorType,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Cursor].
extension CursorPatterns on Cursor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cursor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cursor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cursor value)  $default,){
final _that = this;
switch (_that) {
case _Cursor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cursor value)?  $default,){
final _that = this;
switch (_that) {
case _Cursor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CursorType type,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cursor() when $default != null:
return $default(_that.type,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CursorType type,  String id)  $default,) {final _that = this;
switch (_that) {
case _Cursor():
return $default(_that.type,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CursorType type,  String id)?  $default,) {final _that = this;
switch (_that) {
case _Cursor() when $default != null:
return $default(_that.type,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cursor extends Cursor {
  const _Cursor({required this.type, required this.id}): super._();
  factory _Cursor.fromJson(Map<String, dynamic> json) => _$CursorFromJson(json);

@override final  CursorType type;
@override final  String id;

/// Create a copy of Cursor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorCopyWith<_Cursor> get copyWith => __$CursorCopyWithImpl<_Cursor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cursor&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'Cursor(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CursorCopyWith<$Res> implements $CursorCopyWith<$Res> {
  factory _$CursorCopyWith(_Cursor value, $Res Function(_Cursor) _then) = __$CursorCopyWithImpl;
@override @useResult
$Res call({
 CursorType type, String id
});




}
/// @nodoc
class __$CursorCopyWithImpl<$Res>
    implements _$CursorCopyWith<$Res> {
  __$CursorCopyWithImpl(this._self, this._then);

  final _Cursor _self;
  final $Res Function(_Cursor) _then;

/// Create a copy of Cursor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,}) {
  return _then(_Cursor(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CursorType,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
