// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sns_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSnsLinks {

 String get id; String get userId; SnsType get snsType; String get value;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of UserSnsLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSnsLinksCopyWith<UserSnsLinks> get copyWith => _$UserSnsLinksCopyWithImpl<UserSnsLinks>(this as UserSnsLinks, _$identity);

  /// Serializes this UserSnsLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSnsLinks&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,snsType,value,createdAt,updatedAt);

@override
String toString() {
  return 'UserSnsLinks(id: $id, userId: $userId, snsType: $snsType, value: $value, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserSnsLinksCopyWith<$Res>  {
  factory $UserSnsLinksCopyWith(UserSnsLinks value, $Res Function(UserSnsLinks) _then) = _$UserSnsLinksCopyWithImpl;
@useResult
$Res call({
 String id, String userId, SnsType snsType, String value,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$UserSnsLinksCopyWithImpl<$Res>
    implements $UserSnsLinksCopyWith<$Res> {
  _$UserSnsLinksCopyWithImpl(this._self, this._then);

  final UserSnsLinks _self;
  final $Res Function(UserSnsLinks) _then;

/// Create a copy of UserSnsLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? snsType = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as SnsType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSnsLinks].
extension UserSnsLinksPatterns on UserSnsLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSnsLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSnsLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSnsLinks value)  $default,){
final _that = this;
switch (_that) {
case _UserSnsLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSnsLinks value)?  $default,){
final _that = this;
switch (_that) {
case _UserSnsLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  SnsType snsType,  String value, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSnsLinks() when $default != null:
return $default(_that.id,_that.userId,_that.snsType,_that.value,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  SnsType snsType,  String value, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserSnsLinks():
return $default(_that.id,_that.userId,_that.snsType,_that.value,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  SnsType snsType,  String value, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserSnsLinks() when $default != null:
return $default(_that.id,_that.userId,_that.snsType,_that.value,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSnsLinks implements UserSnsLinks {
  const _UserSnsLinks({required this.id, required this.userId, required this.snsType, required this.value, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _UserSnsLinks.fromJson(Map<String, dynamic> json) => _$UserSnsLinksFromJson(json);

@override final  String id;
@override final  String userId;
@override final  SnsType snsType;
@override final  String value;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of UserSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSnsLinksCopyWith<_UserSnsLinks> get copyWith => __$UserSnsLinksCopyWithImpl<_UserSnsLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSnsLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSnsLinks&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,snsType,value,createdAt,updatedAt);

@override
String toString() {
  return 'UserSnsLinks(id: $id, userId: $userId, snsType: $snsType, value: $value, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserSnsLinksCopyWith<$Res> implements $UserSnsLinksCopyWith<$Res> {
  factory _$UserSnsLinksCopyWith(_UserSnsLinks value, $Res Function(_UserSnsLinks) _then) = __$UserSnsLinksCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, SnsType snsType, String value,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$UserSnsLinksCopyWithImpl<$Res>
    implements _$UserSnsLinksCopyWith<$Res> {
  __$UserSnsLinksCopyWithImpl(this._self, this._then);

  final _UserSnsLinks _self;
  final $Res Function(_UserSnsLinks) _then;

/// Create a copy of UserSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? snsType = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserSnsLinks(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as SnsType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
