// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketType {

 String get id; String get name; int get price; bool get isActive; String get stripePriceId; int? get maxQuantity; String? get description;
/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<TicketType> get copyWith => _$TicketTypeCopyWithImpl<TicketType>(this as TicketType, _$identity);

  /// Serializes this TicketType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.stripePriceId, stripePriceId) || other.stripePriceId == stripePriceId)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isActive,stripePriceId,maxQuantity,description);

@override
String toString() {
  return 'TicketType(id: $id, name: $name, price: $price, isActive: $isActive, stripePriceId: $stripePriceId, maxQuantity: $maxQuantity, description: $description)';
}


}

/// @nodoc
abstract mixin class $TicketTypeCopyWith<$Res>  {
  factory $TicketTypeCopyWith(TicketType value, $Res Function(TicketType) _then) = _$TicketTypeCopyWithImpl;
@useResult
$Res call({
 String id, String name, int price, bool isActive, String stripePriceId, int? maxQuantity, String? description
});




}
/// @nodoc
class _$TicketTypeCopyWithImpl<$Res>
    implements $TicketTypeCopyWith<$Res> {
  _$TicketTypeCopyWithImpl(this._self, this._then);

  final TicketType _self;
  final $Res Function(TicketType) _then;

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isActive = null,Object? stripePriceId = null,Object? maxQuantity = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,stripePriceId: null == stripePriceId ? _self.stripePriceId : stripePriceId // ignore: cast_nullable_to_non_nullable
as String,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketType].
extension TicketTypePatterns on TicketType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketType value)  $default,){
final _that = this;
switch (_that) {
case _TicketType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketType value)?  $default,){
final _that = this;
switch (_that) {
case _TicketType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int price,  bool isActive,  String stripePriceId,  int? maxQuantity,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketType() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isActive,_that.stripePriceId,_that.maxQuantity,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int price,  bool isActive,  String stripePriceId,  int? maxQuantity,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TicketType():
return $default(_that.id,_that.name,_that.price,_that.isActive,_that.stripePriceId,_that.maxQuantity,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int price,  bool isActive,  String stripePriceId,  int? maxQuantity,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TicketType() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.isActive,_that.stripePriceId,_that.maxQuantity,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketType implements TicketType {
  const _TicketType({required this.id, required this.name, required this.price, required this.isActive, required this.stripePriceId, this.maxQuantity, this.description});
  factory _TicketType.fromJson(Map<String, dynamic> json) => _$TicketTypeFromJson(json);

@override final  String id;
@override final  String name;
@override final  int price;
@override final  bool isActive;
@override final  String stripePriceId;
@override final  int? maxQuantity;
@override final  String? description;

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypeCopyWith<_TicketType> get copyWith => __$TicketTypeCopyWithImpl<_TicketType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.stripePriceId, stripePriceId) || other.stripePriceId == stripePriceId)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,isActive,stripePriceId,maxQuantity,description);

@override
String toString() {
  return 'TicketType(id: $id, name: $name, price: $price, isActive: $isActive, stripePriceId: $stripePriceId, maxQuantity: $maxQuantity, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeCopyWith<$Res> implements $TicketTypeCopyWith<$Res> {
  factory _$TicketTypeCopyWith(_TicketType value, $Res Function(_TicketType) _then) = __$TicketTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int price, bool isActive, String stripePriceId, int? maxQuantity, String? description
});




}
/// @nodoc
class __$TicketTypeCopyWithImpl<$Res>
    implements _$TicketTypeCopyWith<$Res> {
  __$TicketTypeCopyWithImpl(this._self, this._then);

  final _TicketType _self;
  final $Res Function(_TicketType) _then;

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? isActive = null,Object? stripePriceId = null,Object? maxQuantity = freezed,Object? description = freezed,}) {
  return _then(_TicketType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,stripePriceId: null == stripePriceId ? _self.stripePriceId : stripePriceId // ignore: cast_nullable_to_non_nullable
as String,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
