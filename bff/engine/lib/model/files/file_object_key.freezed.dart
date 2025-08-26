// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_object_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FileObjectKey _$FileObjectKeyFromJson(
  Map<String, dynamic> json
) {
    return FileObjectAvatarKey.fromJson(
      json
    );
}

/// @nodoc
mixin _$FileObjectKey {

 String get userId; String get uuid; String get extension;
/// Create a copy of FileObjectKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileObjectKeyCopyWith<FileObjectKey> get copyWith => _$FileObjectKeyCopyWithImpl<FileObjectKey>(this as FileObjectKey, _$identity);

  /// Serializes this FileObjectKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileObjectKey&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.extension, extension) || other.extension == extension));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,uuid,extension);



}

/// @nodoc
abstract mixin class $FileObjectKeyCopyWith<$Res>  {
  factory $FileObjectKeyCopyWith(FileObjectKey value, $Res Function(FileObjectKey) _then) = _$FileObjectKeyCopyWithImpl;
@useResult
$Res call({
 String userId, String uuid, String extension
});




}
/// @nodoc
class _$FileObjectKeyCopyWithImpl<$Res>
    implements $FileObjectKeyCopyWith<$Res> {
  _$FileObjectKeyCopyWithImpl(this._self, this._then);

  final FileObjectKey _self;
  final $Res Function(FileObjectKey) _then;

/// Create a copy of FileObjectKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? uuid = null,Object? extension = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileObjectKey].
extension FileObjectKeyPatterns on FileObjectKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FileObjectAvatarKey value)?  avatar,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FileObjectAvatarKey() when avatar != null:
return avatar(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FileObjectAvatarKey value)  avatar,}){
final _that = this;
switch (_that) {
case FileObjectAvatarKey():
return avatar(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FileObjectAvatarKey value)?  avatar,}){
final _that = this;
switch (_that) {
case FileObjectAvatarKey() when avatar != null:
return avatar(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String uuid,  String extension)?  avatar,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FileObjectAvatarKey() when avatar != null:
return avatar(_that.userId,_that.uuid,_that.extension);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String uuid,  String extension)  avatar,}) {final _that = this;
switch (_that) {
case FileObjectAvatarKey():
return avatar(_that.userId,_that.uuid,_that.extension);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String uuid,  String extension)?  avatar,}) {final _that = this;
switch (_that) {
case FileObjectAvatarKey() when avatar != null:
return avatar(_that.userId,_that.uuid,_that.extension);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FileObjectAvatarKey implements FileObjectKey {
  const FileObjectAvatarKey({required this.userId, required this.uuid, required this.extension});
  factory FileObjectAvatarKey.fromJson(Map<String, dynamic> json) => _$FileObjectAvatarKeyFromJson(json);

@override final  String userId;
@override final  String uuid;
@override final  String extension;

/// Create a copy of FileObjectKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileObjectAvatarKeyCopyWith<FileObjectAvatarKey> get copyWith => _$FileObjectAvatarKeyCopyWithImpl<FileObjectAvatarKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileObjectAvatarKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileObjectAvatarKey&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.extension, extension) || other.extension == extension));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,uuid,extension);



}

/// @nodoc
abstract mixin class $FileObjectAvatarKeyCopyWith<$Res> implements $FileObjectKeyCopyWith<$Res> {
  factory $FileObjectAvatarKeyCopyWith(FileObjectAvatarKey value, $Res Function(FileObjectAvatarKey) _then) = _$FileObjectAvatarKeyCopyWithImpl;
@override @useResult
$Res call({
 String userId, String uuid, String extension
});




}
/// @nodoc
class _$FileObjectAvatarKeyCopyWithImpl<$Res>
    implements $FileObjectAvatarKeyCopyWith<$Res> {
  _$FileObjectAvatarKeyCopyWithImpl(this._self, this._then);

  final FileObjectAvatarKey _self;
  final $Res Function(FileObjectAvatarKey) _then;

/// Create a copy of FileObjectKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? uuid = null,Object? extension = null,}) {
  return _then(FileObjectAvatarKey(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
