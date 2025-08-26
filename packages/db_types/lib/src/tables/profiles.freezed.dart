// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profiles {

 String get id; String get name; String get comment; bool get isAdult; String? get avatarKey;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilesCopyWith<Profiles> get copyWith => _$ProfilesCopyWithImpl<Profiles>(this as Profiles, _$identity);

  /// Serializes this Profiles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profiles&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,comment,isAdult,avatarKey,createdAt,updatedAt);

@override
String toString() {
  return 'Profiles(id: $id, name: $name, comment: $comment, isAdult: $isAdult, avatarKey: $avatarKey, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfilesCopyWith<$Res>  {
  factory $ProfilesCopyWith(Profiles value, $Res Function(Profiles) _then) = _$ProfilesCopyWithImpl;
@useResult
$Res call({
 String id, String name, String comment, bool isAdult, String? avatarKey,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$ProfilesCopyWithImpl<$Res>
    implements $ProfilesCopyWith<$Res> {
  _$ProfilesCopyWithImpl(this._self, this._then);

  final Profiles _self;
  final $Res Function(Profiles) _then;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? comment = null,Object? isAdult = null,Object? avatarKey = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,avatarKey: freezed == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Profiles].
extension ProfilesPatterns on Profiles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profiles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profiles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profiles value)  $default,){
final _that = this;
switch (_that) {
case _Profiles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profiles value)?  $default,){
final _that = this;
switch (_that) {
case _Profiles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String comment,  bool isAdult,  String? avatarKey, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profiles() when $default != null:
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String comment,  bool isAdult,  String? avatarKey, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Profiles():
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String comment,  bool isAdult,  String? avatarKey, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Profiles() when $default != null:
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profiles implements Profiles {
  const _Profiles({required this.id, required this.name, required this.comment, required this.isAdult, this.avatarKey, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _Profiles.fromJson(Map<String, dynamic> json) => _$ProfilesFromJson(json);

@override final  String id;
@override final  String name;
@override final  String comment;
@override final  bool isAdult;
@override final  String? avatarKey;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilesCopyWith<_Profiles> get copyWith => __$ProfilesCopyWithImpl<_Profiles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfilesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profiles&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,comment,isAdult,avatarKey,createdAt,updatedAt);

@override
String toString() {
  return 'Profiles(id: $id, name: $name, comment: $comment, isAdult: $isAdult, avatarKey: $avatarKey, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfilesCopyWith<$Res> implements $ProfilesCopyWith<$Res> {
  factory _$ProfilesCopyWith(_Profiles value, $Res Function(_Profiles) _then) = __$ProfilesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String comment, bool isAdult, String? avatarKey,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$ProfilesCopyWithImpl<$Res>
    implements _$ProfilesCopyWith<$Res> {
  __$ProfilesCopyWithImpl(this._self, this._then);

  final _Profiles _self;
  final $Res Function(_Profiles) _then;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? comment = null,Object? isAdult = null,Object? avatarKey = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Profiles(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,avatarKey: freezed == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SnsAccount {

 SnsType get type; Uri get link;
/// Create a copy of SnsAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnsAccountCopyWith<SnsAccount> get copyWith => _$SnsAccountCopyWithImpl<SnsAccount>(this as SnsAccount, _$identity);

  /// Serializes this SnsAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnsAccount&&(identical(other.type, type) || other.type == type)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,link);

@override
String toString() {
  return 'SnsAccount(type: $type, link: $link)';
}


}

/// @nodoc
abstract mixin class $SnsAccountCopyWith<$Res>  {
  factory $SnsAccountCopyWith(SnsAccount value, $Res Function(SnsAccount) _then) = _$SnsAccountCopyWithImpl;
@useResult
$Res call({
 SnsType type, Uri link
});




}
/// @nodoc
class _$SnsAccountCopyWithImpl<$Res>
    implements $SnsAccountCopyWith<$Res> {
  _$SnsAccountCopyWithImpl(this._self, this._then);

  final SnsAccount _self;
  final $Res Function(SnsAccount) _then;

/// Create a copy of SnsAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? link = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnsType,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}


/// Adds pattern-matching-related methods to [SnsAccount].
extension SnsAccountPatterns on SnsAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnsAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnsAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnsAccount value)  $default,){
final _that = this;
switch (_that) {
case _SnsAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnsAccount value)?  $default,){
final _that = this;
switch (_that) {
case _SnsAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnsType type,  Uri link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnsAccount() when $default != null:
return $default(_that.type,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnsType type,  Uri link)  $default,) {final _that = this;
switch (_that) {
case _SnsAccount():
return $default(_that.type,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnsType type,  Uri link)?  $default,) {final _that = this;
switch (_that) {
case _SnsAccount() when $default != null:
return $default(_that.type,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnsAccount implements SnsAccount {
  const _SnsAccount({required this.type, required this.link});
  factory _SnsAccount.fromJson(Map<String, dynamic> json) => _$SnsAccountFromJson(json);

@override final  SnsType type;
@override final  Uri link;

/// Create a copy of SnsAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnsAccountCopyWith<_SnsAccount> get copyWith => __$SnsAccountCopyWithImpl<_SnsAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnsAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnsAccount&&(identical(other.type, type) || other.type == type)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,link);

@override
String toString() {
  return 'SnsAccount(type: $type, link: $link)';
}


}

/// @nodoc
abstract mixin class _$SnsAccountCopyWith<$Res> implements $SnsAccountCopyWith<$Res> {
  factory _$SnsAccountCopyWith(_SnsAccount value, $Res Function(_SnsAccount) _then) = __$SnsAccountCopyWithImpl;
@override @useResult
$Res call({
 SnsType type, Uri link
});




}
/// @nodoc
class __$SnsAccountCopyWithImpl<$Res>
    implements _$SnsAccountCopyWith<$Res> {
  __$SnsAccountCopyWithImpl(this._self, this._then);

  final _SnsAccount _self;
  final $Res Function(_SnsAccount) _then;

/// Create a copy of SnsAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? link = null,}) {
  return _then(_SnsAccount(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnsType,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

// dart format on
