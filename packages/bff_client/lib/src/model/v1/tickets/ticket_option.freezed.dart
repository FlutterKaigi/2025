// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketOption {

 String get id; String get ticketTypeId; String get name; String? get description; int? get maxQuantity;
/// Create a copy of TicketOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketOptionCopyWith<TicketOption> get copyWith => _$TicketOptionCopyWithImpl<TicketOption>(this as TicketOption, _$identity);

  /// Serializes this TicketOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketOption&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,name,description,maxQuantity);

@override
String toString() {
  return 'TicketOption(id: $id, ticketTypeId: $ticketTypeId, name: $name, description: $description, maxQuantity: $maxQuantity)';
}


}

/// @nodoc
abstract mixin class $TicketOptionCopyWith<$Res>  {
  factory $TicketOptionCopyWith(TicketOption value, $Res Function(TicketOption) _then) = _$TicketOptionCopyWithImpl;
@useResult
$Res call({
 String id, String ticketTypeId, String name, String? description, int? maxQuantity
});




}
/// @nodoc
class _$TicketOptionCopyWithImpl<$Res>
    implements $TicketOptionCopyWith<$Res> {
  _$TicketOptionCopyWithImpl(this._self, this._then);

  final TicketOption _self;
  final $Res Function(TicketOption) _then;

/// Create a copy of TicketOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketTypeId = null,Object? name = null,Object? description = freezed,Object? maxQuantity = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketOption].
extension TicketOptionPatterns on TicketOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketOption value)  $default,){
final _that = this;
switch (_that) {
case _TicketOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketOption value)?  $default,){
final _that = this;
switch (_that) {
case _TicketOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  String name,  String? description,  int? maxQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketOption() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.name,_that.description,_that.maxQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketTypeId,  String name,  String? description,  int? maxQuantity)  $default,) {final _that = this;
switch (_that) {
case _TicketOption():
return $default(_that.id,_that.ticketTypeId,_that.name,_that.description,_that.maxQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketTypeId,  String name,  String? description,  int? maxQuantity)?  $default,) {final _that = this;
switch (_that) {
case _TicketOption() when $default != null:
return $default(_that.id,_that.ticketTypeId,_that.name,_that.description,_that.maxQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketOption implements TicketOption {
  const _TicketOption({required this.id, required this.ticketTypeId, required this.name, this.description, this.maxQuantity});
  factory _TicketOption.fromJson(Map<String, dynamic> json) => _$TicketOptionFromJson(json);

@override final  String id;
@override final  String ticketTypeId;
@override final  String name;
@override final  String? description;
@override final  int? maxQuantity;

/// Create a copy of TicketOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketOptionCopyWith<_TicketOption> get copyWith => __$TicketOptionCopyWithImpl<_TicketOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketOption&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketTypeId,name,description,maxQuantity);

@override
String toString() {
  return 'TicketOption(id: $id, ticketTypeId: $ticketTypeId, name: $name, description: $description, maxQuantity: $maxQuantity)';
}


}

/// @nodoc
abstract mixin class _$TicketOptionCopyWith<$Res> implements $TicketOptionCopyWith<$Res> {
  factory _$TicketOptionCopyWith(_TicketOption value, $Res Function(_TicketOption) _then) = __$TicketOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketTypeId, String name, String? description, int? maxQuantity
});




}
/// @nodoc
class __$TicketOptionCopyWithImpl<$Res>
    implements _$TicketOptionCopyWith<$Res> {
  __$TicketOptionCopyWithImpl(this._self, this._then);

  final _TicketOption _self;
  final $Res Function(_TicketOption) _then;

/// Create a copy of TicketOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketTypeId = null,Object? name = null,Object? description = freezed,Object? maxQuantity = freezed,}) {
  return _then(_TicketOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
