// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketOptions {

 String get id; String get ticketTypeId; String get name; DateTime get createdAt; DateTime get updatedAt; String? get description;
/// Create a copy of TicketOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketOptionsCopyWith<TicketOptions> get copyWith => _$TicketOptionsCopyWithImpl<TicketOptions>(this as TicketOptions, _$identity);

  /// Serializes this TicketOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,name,createdAt,updatedAt,description);

@override
String toString() {
  return 'TicketOptions(id: $id, ticketTypeId: $ticketTypeId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class $TicketOptionsCopyWith<$Res>  {
  factory $TicketOptionsCopyWith(TicketOptions value, $Res Function(TicketOptions) _then) = _$TicketOptionsCopyWithImpl;
@useResult
$Res call({
 String id, String ticketTypeId, String name, DateTime createdAt, DateTime updatedAt, String? description
});




}
/// @nodoc
class _$TicketOptionsCopyWithImpl<$Res>
    implements $TicketOptionsCopyWith<$Res> {
  _$TicketOptionsCopyWithImpl(this._self, this._then);

  final TicketOptions _self;
  final $Res Function(TicketOptions) _then;

/// Create a copy of TicketOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketTypeId = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketOptions].
extension TicketOptionsPatterns on TicketOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketOptions value)  $default,){
final _that = this;
switch (_that) {
case _TicketOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketOptions value)?  $default,){
final _that = this;
switch (_that) {
case _TicketOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  String name,  DateTime createdAt,  DateTime updatedAt,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketOptions() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.name,_that.createdAt,_that.updatedAt,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  String name,  DateTime createdAt,  DateTime updatedAt,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TicketOptions():
return $default(_that.id,_that.ticketTypeId,_that.name,_that.createdAt,_that.updatedAt,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketTypeId,  String name,  DateTime createdAt,  DateTime updatedAt,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TicketOptions() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.name,_that.createdAt,_that.updatedAt,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketOptions implements TicketOptions {
  const _TicketOptions({required this.id, required this.ticketTypeId, required this.name, required this.createdAt, required this.updatedAt, this.description});
  factory _TicketOptions.fromJson(Map<String, dynamic> json) => _$TicketOptionsFromJson(json);

@override final  String id;
@override final  String ticketTypeId;
@override final  String name;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? description;

/// Create a copy of TicketOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketOptionsCopyWith<_TicketOptions> get copyWith => __$TicketOptionsCopyWithImpl<_TicketOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,name,createdAt,updatedAt,description);

@override
String toString() {
  return 'TicketOptions(id: $id, ticketTypeId: $ticketTypeId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TicketOptionsCopyWith<$Res> implements $TicketOptionsCopyWith<$Res> {
  factory _$TicketOptionsCopyWith(_TicketOptions value, $Res Function(_TicketOptions) _then) = __$TicketOptionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketTypeId, String name, DateTime createdAt, DateTime updatedAt, String? description
});




}
/// @nodoc
class __$TicketOptionsCopyWithImpl<$Res>
    implements _$TicketOptionsCopyWith<$Res> {
  __$TicketOptionsCopyWithImpl(this._self, this._then);

  final _TicketOptions _self;
  final $Res Function(_TicketOptions) _then;

/// Create a copy of TicketOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketTypeId = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_TicketOptions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
