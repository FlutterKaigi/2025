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

 String get id; String get name; int get price; TicketStatus get status; String get stripePriceId; bool get isEntryAllowed; String? get description;
/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<TicketType> get copyWith => _$TicketTypeCopyWithImpl<TicketType>(this as TicketType, _$identity);

  /// Serializes this TicketType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePriceId, stripePriceId) || other.stripePriceId == stripePriceId)&&(identical(other.isEntryAllowed, isEntryAllowed) || other.isEntryAllowed == isEntryAllowed)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,status,stripePriceId,isEntryAllowed,description);

@override
String toString() {
  return 'TicketType(id: $id, name: $name, price: $price, status: $status, stripePriceId: $stripePriceId, isEntryAllowed: $isEntryAllowed, description: $description)';
}


}

/// @nodoc
abstract mixin class $TicketTypeCopyWith<$Res>  {
  factory $TicketTypeCopyWith(TicketType value, $Res Function(TicketType) _then) = _$TicketTypeCopyWithImpl;
@useResult
$Res call({
 String id, String name, int price, TicketStatus status, String stripePriceId, bool isEntryAllowed, String? description
});


$TicketStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$TicketTypeCopyWithImpl<$Res>
    implements $TicketTypeCopyWith<$Res> {
  _$TicketTypeCopyWithImpl(this._self, this._then);

  final TicketType _self;
  final $Res Function(TicketType) _then;

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? status = null,Object? stripePriceId = null,Object? isEntryAllowed = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatus,stripePriceId: null == stripePriceId ? _self.stripePriceId : stripePriceId // ignore: cast_nullable_to_non_nullable
as String,isEntryAllowed: null == isEntryAllowed ? _self.isEntryAllowed : isEntryAllowed // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketStatusCopyWith<$Res> get status {
  
  return $TicketStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int price,  TicketStatus status,  String stripePriceId,  bool isEntryAllowed,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketType() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.status,_that.stripePriceId,_that.isEntryAllowed,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int price,  TicketStatus status,  String stripePriceId,  bool isEntryAllowed,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TicketType():
return $default(_that.id,_that.name,_that.price,_that.status,_that.stripePriceId,_that.isEntryAllowed,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int price,  TicketStatus status,  String stripePriceId,  bool isEntryAllowed,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TicketType() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.status,_that.stripePriceId,_that.isEntryAllowed,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketType implements TicketType {
  const _TicketType({required this.id, required this.name, required this.price, required this.status, required this.stripePriceId, required this.isEntryAllowed, this.description});
  factory _TicketType.fromJson(Map<String, dynamic> json) => _$TicketTypeFromJson(json);

@override final  String id;
@override final  String name;
@override final  int price;
@override final  TicketStatus status;
@override final  String stripePriceId;
@override final  bool isEntryAllowed;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePriceId, stripePriceId) || other.stripePriceId == stripePriceId)&&(identical(other.isEntryAllowed, isEntryAllowed) || other.isEntryAllowed == isEntryAllowed)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,status,stripePriceId,isEntryAllowed,description);

@override
String toString() {
  return 'TicketType(id: $id, name: $name, price: $price, status: $status, stripePriceId: $stripePriceId, isEntryAllowed: $isEntryAllowed, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TicketTypeCopyWith<$Res> implements $TicketTypeCopyWith<$Res> {
  factory _$TicketTypeCopyWith(_TicketType value, $Res Function(_TicketType) _then) = __$TicketTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int price, TicketStatus status, String stripePriceId, bool isEntryAllowed, String? description
});


@override $TicketStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$TicketTypeCopyWithImpl<$Res>
    implements _$TicketTypeCopyWith<$Res> {
  __$TicketTypeCopyWithImpl(this._self, this._then);

  final _TicketType _self;
  final $Res Function(_TicketType) _then;

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? status = null,Object? stripePriceId = null,Object? isEntryAllowed = null,Object? description = freezed,}) {
  return _then(_TicketType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatus,stripePriceId: null == stripePriceId ? _self.stripePriceId : stripePriceId // ignore: cast_nullable_to_non_nullable
as String,isEntryAllowed: null == isEntryAllowed ? _self.isEntryAllowed : isEntryAllowed // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TicketType
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketStatusCopyWith<$Res> get status {
  
  return $TicketStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

TicketStatus _$TicketStatusFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'selling':
          return TicketStatusSelling.fromJson(
            json
          );
                case 'soldOut':
          return TicketStatusSoldOut.fromJson(
            json
          );
                case 'notSelling':
          return TicketStatusNotSelling.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'TicketStatus',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$TicketStatus {



  /// Serializes this TicketStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketStatus);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketStatus()';
}


}

/// @nodoc
class $TicketStatusCopyWith<$Res>  {
$TicketStatusCopyWith(TicketStatus _, $Res Function(TicketStatus) __);
}


/// Adds pattern-matching-related methods to [TicketStatus].
extension TicketStatusPatterns on TicketStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TicketStatusSelling value)?  selling,TResult Function( TicketStatusSoldOut value)?  soldOut,TResult Function( TicketStatusNotSelling value)?  notSelling,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TicketStatusSelling() when selling != null:
return selling(_that);case TicketStatusSoldOut() when soldOut != null:
return soldOut(_that);case TicketStatusNotSelling() when notSelling != null:
return notSelling(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TicketStatusSelling value)  selling,required TResult Function( TicketStatusSoldOut value)  soldOut,required TResult Function( TicketStatusNotSelling value)  notSelling,}){
final _that = this;
switch (_that) {
case TicketStatusSelling():
return selling(_that);case TicketStatusSoldOut():
return soldOut(_that);case TicketStatusNotSelling():
return notSelling(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TicketStatusSelling value)?  selling,TResult? Function( TicketStatusSoldOut value)?  soldOut,TResult? Function( TicketStatusNotSelling value)?  notSelling,}){
final _that = this;
switch (_that) {
case TicketStatusSelling() when selling != null:
return selling(_that);case TicketStatusSoldOut() when soldOut != null:
return soldOut(_that);case TicketStatusNotSelling() when notSelling != null:
return notSelling(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isFewRemaining)?  selling,TResult Function()?  soldOut,TResult Function()?  notSelling,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TicketStatusSelling() when selling != null:
return selling(_that.isFewRemaining);case TicketStatusSoldOut() when soldOut != null:
return soldOut();case TicketStatusNotSelling() when notSelling != null:
return notSelling();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isFewRemaining)  selling,required TResult Function()  soldOut,required TResult Function()  notSelling,}) {final _that = this;
switch (_that) {
case TicketStatusSelling():
return selling(_that.isFewRemaining);case TicketStatusSoldOut():
return soldOut();case TicketStatusNotSelling():
return notSelling();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isFewRemaining)?  selling,TResult? Function()?  soldOut,TResult? Function()?  notSelling,}) {final _that = this;
switch (_that) {
case TicketStatusSelling() when selling != null:
return selling(_that.isFewRemaining);case TicketStatusSoldOut() when soldOut != null:
return soldOut();case TicketStatusNotSelling() when notSelling != null:
return notSelling();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TicketStatusSelling implements TicketStatus {
  const TicketStatusSelling({required this.isFewRemaining, final  String? $type}): $type = $type ?? 'selling';
  factory TicketStatusSelling.fromJson(Map<String, dynamic> json) => _$TicketStatusSellingFromJson(json);

/// 残り少ないかどうか
 final  bool isFewRemaining;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TicketStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketStatusSellingCopyWith<TicketStatusSelling> get copyWith => _$TicketStatusSellingCopyWithImpl<TicketStatusSelling>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketStatusSellingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketStatusSelling&&(identical(other.isFewRemaining, isFewRemaining) || other.isFewRemaining == isFewRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFewRemaining);

@override
String toString() {
  return 'TicketStatus.selling(isFewRemaining: $isFewRemaining)';
}


}

/// @nodoc
abstract mixin class $TicketStatusSellingCopyWith<$Res> implements $TicketStatusCopyWith<$Res> {
  factory $TicketStatusSellingCopyWith(TicketStatusSelling value, $Res Function(TicketStatusSelling) _then) = _$TicketStatusSellingCopyWithImpl;
@useResult
$Res call({
 bool isFewRemaining
});




}
/// @nodoc
class _$TicketStatusSellingCopyWithImpl<$Res>
    implements $TicketStatusSellingCopyWith<$Res> {
  _$TicketStatusSellingCopyWithImpl(this._self, this._then);

  final TicketStatusSelling _self;
  final $Res Function(TicketStatusSelling) _then;

/// Create a copy of TicketStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isFewRemaining = null,}) {
  return _then(TicketStatusSelling(
isFewRemaining: null == isFewRemaining ? _self.isFewRemaining : isFewRemaining // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TicketStatusSoldOut implements TicketStatus {
  const TicketStatusSoldOut({final  String? $type}): $type = $type ?? 'soldOut';
  factory TicketStatusSoldOut.fromJson(Map<String, dynamic> json) => _$TicketStatusSoldOutFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$TicketStatusSoldOutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketStatusSoldOut);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketStatus.soldOut()';
}


}




/// @nodoc
@JsonSerializable()

class TicketStatusNotSelling implements TicketStatus {
  const TicketStatusNotSelling({final  String? $type}): $type = $type ?? 'notSelling';
  factory TicketStatusNotSelling.fromJson(Map<String, dynamic> json) => _$TicketStatusNotSellingFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$TicketStatusNotSellingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketStatusNotSelling);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketStatus.notSelling()';
}


}




// dart format on
