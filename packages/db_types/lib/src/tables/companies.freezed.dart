// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Companies {

 int get id;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of Companies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompaniesCopyWith<Companies> get copyWith => _$CompaniesCopyWithImpl<Companies>(this as Companies, _$identity);

  /// Serializes this Companies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Companies&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt);

@override
String toString() {
  return 'Companies(id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompaniesCopyWith<$Res>  {
  factory $CompaniesCopyWith(Companies value, $Res Function(Companies) _then) = _$CompaniesCopyWithImpl;
@useResult
$Res call({
 int id,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$CompaniesCopyWithImpl<$Res>
    implements $CompaniesCopyWith<$Res> {
  _$CompaniesCopyWithImpl(this._self, this._then);

  final Companies _self;
  final $Res Function(Companies) _then;

/// Create a copy of Companies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Companies].
extension CompaniesPatterns on Companies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Companies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Companies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Companies value)  $default,){
final _that = this;
switch (_that) {
case _Companies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Companies value)?  $default,){
final _that = this;
switch (_that) {
case _Companies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Companies() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Companies():
return $default(_that.id,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Companies() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Companies implements Companies {
  const _Companies({required this.id, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _Companies.fromJson(Map<String, dynamic> json) => _$CompaniesFromJson(json);

@override final  int id;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of Companies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompaniesCopyWith<_Companies> get copyWith => __$CompaniesCopyWithImpl<_Companies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompaniesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Companies&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt);

@override
String toString() {
  return 'Companies(id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompaniesCopyWith<$Res> implements $CompaniesCopyWith<$Res> {
  factory _$CompaniesCopyWith(_Companies value, $Res Function(_Companies) _then) = __$CompaniesCopyWithImpl;
@override @useResult
$Res call({
 int id,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$CompaniesCopyWithImpl<$Res>
    implements _$CompaniesCopyWith<$Res> {
  __$CompaniesCopyWithImpl(this._self, this._then);

  final _Companies _self;
  final $Res Function(_Companies) _then;

/// Create a copy of Companies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Companies(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
