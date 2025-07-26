// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketTypes {

 String get id; String get name; int get price; int? get maxQuantity; String? get description; bool get isActive;@DateTimeConverter() DateTime? get saleStartsAt;@DateTimeConverter() DateTime? get saleEndsAt; String? get url;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of TicketTypes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypesCopyWith<TicketTypes> get copyWith => _$TicketTypesCopyWithImpl<TicketTypes>(this as TicketTypes, _$identity);

  /// Serializes this TicketTypes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketTypes&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.saleStartsAt, saleStartsAt) || other.saleStartsAt == saleStartsAt)&&(identical(other.saleEndsAt, saleEndsAt) || other.saleEndsAt == saleEndsAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,maxQuantity,description,isActive,saleStartsAt,saleEndsAt,url,createdAt,updatedAt);

@override
String toString() {
  return 'TicketTypes(id: $id, name: $name, price: $price, maxQuantity: $maxQuantity, description: $description, isActive: $isActive, saleStartsAt: $saleStartsAt, saleEndsAt: $saleEndsAt, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TicketTypesCopyWith<$Res>  {
  factory $TicketTypesCopyWith(TicketTypes value, $Res Function(TicketTypes) _then) = _$TicketTypesCopyWithImpl;
@useResult
$Res call({
 String id, String name, int price, int? maxQuantity, String? description, bool isActive,@DateTimeConverter() DateTime? saleStartsAt,@DateTimeConverter() DateTime? saleEndsAt, String? url,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$TicketTypesCopyWithImpl<$Res>
    implements $TicketTypesCopyWith<$Res> {
  _$TicketTypesCopyWithImpl(this._self, this._then);

  final TicketTypes _self;
  final $Res Function(TicketTypes) _then;

/// Create a copy of TicketTypes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? maxQuantity = freezed,Object? description = freezed,Object? isActive = null,Object? saleStartsAt = freezed,Object? saleEndsAt = freezed,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,saleStartsAt: freezed == saleStartsAt ? _self.saleStartsAt : saleStartsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,saleEndsAt: freezed == saleEndsAt ? _self.saleEndsAt : saleEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketTypes].
extension TicketTypesPatterns on TicketTypes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketTypes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketTypes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketTypes value)  $default,){
final _that = this;
switch (_that) {
case _TicketTypes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketTypes value)?  $default,){
final _that = this;
switch (_that) {
case _TicketTypes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int price,  int? maxQuantity,  String? description,  bool isActive, @DateTimeConverter()  DateTime? saleStartsAt, @DateTimeConverter()  DateTime? saleEndsAt,  String? url, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketTypes() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.maxQuantity,_that.description,_that.isActive,_that.saleStartsAt,_that.saleEndsAt,_that.url,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int price,  int? maxQuantity,  String? description,  bool isActive, @DateTimeConverter()  DateTime? saleStartsAt, @DateTimeConverter()  DateTime? saleEndsAt,  String? url, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TicketTypes():
return $default(_that.id,_that.name,_that.price,_that.maxQuantity,_that.description,_that.isActive,_that.saleStartsAt,_that.saleEndsAt,_that.url,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int price,  int? maxQuantity,  String? description,  bool isActive, @DateTimeConverter()  DateTime? saleStartsAt, @DateTimeConverter()  DateTime? saleEndsAt,  String? url, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketTypes() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.maxQuantity,_that.description,_that.isActive,_that.saleStartsAt,_that.saleEndsAt,_that.url,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketTypes implements TicketTypes {
  const _TicketTypes({required this.id, required this.name, required this.price, this.maxQuantity, this.description, required this.isActive, @DateTimeConverter() this.saleStartsAt, @DateTimeConverter() this.saleEndsAt, this.url, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _TicketTypes.fromJson(Map<String, dynamic> json) => _$TicketTypesFromJson(json);

@override final  String id;
@override final  String name;
@override final  int price;
@override final  int? maxQuantity;
@override final  String? description;
@override final  bool isActive;
@override@DateTimeConverter() final  DateTime? saleStartsAt;
@override@DateTimeConverter() final  DateTime? saleEndsAt;
@override final  String? url;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of TicketTypes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketTypesCopyWith<_TicketTypes> get copyWith => __$TicketTypesCopyWithImpl<_TicketTypes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketTypesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketTypes&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.maxQuantity, maxQuantity) || other.maxQuantity == maxQuantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.saleStartsAt, saleStartsAt) || other.saleStartsAt == saleStartsAt)&&(identical(other.saleEndsAt, saleEndsAt) || other.saleEndsAt == saleEndsAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,maxQuantity,description,isActive,saleStartsAt,saleEndsAt,url,createdAt,updatedAt);

@override
String toString() {
  return 'TicketTypes(id: $id, name: $name, price: $price, maxQuantity: $maxQuantity, description: $description, isActive: $isActive, saleStartsAt: $saleStartsAt, saleEndsAt: $saleEndsAt, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TicketTypesCopyWith<$Res> implements $TicketTypesCopyWith<$Res> {
  factory _$TicketTypesCopyWith(_TicketTypes value, $Res Function(_TicketTypes) _then) = __$TicketTypesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int price, int? maxQuantity, String? description, bool isActive,@DateTimeConverter() DateTime? saleStartsAt,@DateTimeConverter() DateTime? saleEndsAt, String? url,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$TicketTypesCopyWithImpl<$Res>
    implements _$TicketTypesCopyWith<$Res> {
  __$TicketTypesCopyWithImpl(this._self, this._then);

  final _TicketTypes _self;
  final $Res Function(_TicketTypes) _then;

/// Create a copy of TicketTypes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? maxQuantity = freezed,Object? description = freezed,Object? isActive = null,Object? saleStartsAt = freezed,Object? saleEndsAt = freezed,Object? url = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TicketTypes(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,maxQuantity: freezed == maxQuantity ? _self.maxQuantity : maxQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,saleStartsAt: freezed == saleStartsAt ? _self.saleStartsAt : saleStartsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,saleEndsAt: freezed == saleEndsAt ? _self.saleEndsAt : saleEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
