// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_update_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileUpdateData {

 String get name; String get comment; bool get isAdult; String? get avatarKey;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdateDataCopyWith<ProfileUpdateData> get copyWith => _$ProfileUpdateDataCopyWithImpl<ProfileUpdateData>(this as ProfileUpdateData, _$identity);

  /// Serializes this ProfileUpdateData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdateData&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comment,isAdult,avatarKey,updatedAt);

@override
String toString() {
  return 'ProfileUpdateData(name: $name, comment: $comment, isAdult: $isAdult, avatarKey: $avatarKey, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdateDataCopyWith<$Res>  {
  factory $ProfileUpdateDataCopyWith(ProfileUpdateData value, $Res Function(ProfileUpdateData) _then) = _$ProfileUpdateDataCopyWithImpl;
@useResult
$Res call({
 String name, String comment, bool isAdult, String? avatarKey,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ProfileUpdateDataCopyWithImpl<$Res>
    implements $ProfileUpdateDataCopyWith<$Res> {
  _$ProfileUpdateDataCopyWithImpl(this._self, this._then);

  final ProfileUpdateData _self;
  final $Res Function(ProfileUpdateData) _then;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? comment = null,Object? isAdult = null,Object? avatarKey = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,avatarKey: freezed == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileUpdateData].
extension ProfileUpdateDataPatterns on ProfileUpdateData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUpdateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUpdateData value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUpdateData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String comment,  bool isAdult,  String? avatarKey, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
return $default(_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String comment,  bool isAdult,  String? avatarKey, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateData():
return $default(_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String comment,  bool isAdult,  String? avatarKey, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateData() when $default != null:
return $default(_that.name,_that.comment,_that.isAdult,_that.avatarKey,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileUpdateData implements ProfileUpdateData {
  const _ProfileUpdateData({required this.name, required this.comment, required this.isAdult, this.avatarKey, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ProfileUpdateData.fromJson(Map<String, dynamic> json) => _$ProfileUpdateDataFromJson(json);

@override final  String name;
@override final  String comment;
@override final  bool isAdult;
@override final  String? avatarKey;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdateDataCopyWith<_ProfileUpdateData> get copyWith => __$ProfileUpdateDataCopyWithImpl<_ProfileUpdateData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileUpdateDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdateData&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.avatarKey, avatarKey) || other.avatarKey == avatarKey)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comment,isAdult,avatarKey,updatedAt);

@override
String toString() {
  return 'ProfileUpdateData(name: $name, comment: $comment, isAdult: $isAdult, avatarKey: $avatarKey, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdateDataCopyWith<$Res> implements $ProfileUpdateDataCopyWith<$Res> {
  factory _$ProfileUpdateDataCopyWith(_ProfileUpdateData value, $Res Function(_ProfileUpdateData) _then) = __$ProfileUpdateDataCopyWithImpl;
@override @useResult
$Res call({
 String name, String comment, bool isAdult, String? avatarKey,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ProfileUpdateDataCopyWithImpl<$Res>
    implements _$ProfileUpdateDataCopyWith<$Res> {
  __$ProfileUpdateDataCopyWithImpl(this._self, this._then);

  final _ProfileUpdateData _self;
  final $Res Function(_ProfileUpdateData) _then;

/// Create a copy of ProfileUpdateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? comment = null,Object? isAdult = null,Object? avatarKey = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProfileUpdateData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,avatarKey: freezed == avatarKey ? _self.avatarKey : avatarKey // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
