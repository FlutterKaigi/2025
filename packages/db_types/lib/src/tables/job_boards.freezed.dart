// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_boards.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobBoards {

 int get id; String get url; String get altText; String get imageName;
/// Create a copy of JobBoards
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobBoardsCopyWith<JobBoards> get copyWith => _$JobBoardsCopyWithImpl<JobBoards>(this as JobBoards, _$identity);

  /// Serializes this JobBoards to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobBoards&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.imageName, imageName) || other.imageName == imageName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,altText,imageName);

@override
String toString() {
  return 'JobBoards(id: $id, url: $url, altText: $altText, imageName: $imageName)';
}


}

/// @nodoc
abstract mixin class $JobBoardsCopyWith<$Res>  {
  factory $JobBoardsCopyWith(JobBoards value, $Res Function(JobBoards) _then) = _$JobBoardsCopyWithImpl;
@useResult
$Res call({
 int id, String url, String altText, String imageName
});




}
/// @nodoc
class _$JobBoardsCopyWithImpl<$Res>
    implements $JobBoardsCopyWith<$Res> {
  _$JobBoardsCopyWithImpl(this._self, this._then);

  final JobBoards _self;
  final $Res Function(JobBoards) _then;

/// Create a copy of JobBoards
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? altText = null,Object? imageName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,imageName: null == imageName ? _self.imageName : imageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobBoards].
extension JobBoardsPatterns on JobBoards {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobBoards value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobBoards() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobBoards value)  $default,){
final _that = this;
switch (_that) {
case _JobBoards():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobBoards value)?  $default,){
final _that = this;
switch (_that) {
case _JobBoards() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url,  String altText,  String imageName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobBoards() when $default != null:
return $default(_that.id,_that.url,_that.altText,_that.imageName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url,  String altText,  String imageName)  $default,) {final _that = this;
switch (_that) {
case _JobBoards():
return $default(_that.id,_that.url,_that.altText,_that.imageName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url,  String altText,  String imageName)?  $default,) {final _that = this;
switch (_that) {
case _JobBoards() when $default != null:
return $default(_that.id,_that.url,_that.altText,_that.imageName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobBoards implements JobBoards {
  const _JobBoards({required this.id, required this.url, required this.altText, required this.imageName});
  factory _JobBoards.fromJson(Map<String, dynamic> json) => _$JobBoardsFromJson(json);

@override final  int id;
@override final  String url;
@override final  String altText;
@override final  String imageName;

/// Create a copy of JobBoards
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobBoardsCopyWith<_JobBoards> get copyWith => __$JobBoardsCopyWithImpl<_JobBoards>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobBoardsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobBoards&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.imageName, imageName) || other.imageName == imageName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,altText,imageName);

@override
String toString() {
  return 'JobBoards(id: $id, url: $url, altText: $altText, imageName: $imageName)';
}


}

/// @nodoc
abstract mixin class _$JobBoardsCopyWith<$Res> implements $JobBoardsCopyWith<$Res> {
  factory _$JobBoardsCopyWith(_JobBoards value, $Res Function(_JobBoards) _then) = __$JobBoardsCopyWithImpl;
@override @useResult
$Res call({
 int id, String url, String altText, String imageName
});




}
/// @nodoc
class __$JobBoardsCopyWithImpl<$Res>
    implements _$JobBoardsCopyWith<$Res> {
  __$JobBoardsCopyWithImpl(this._self, this._then);

  final _JobBoards _self;
  final $Res Function(_JobBoards) _then;

/// Create a copy of JobBoards
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? altText = null,Object? imageName = null,}) {
  return _then(_JobBoards(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,imageName: null == imageName ? _self.imageName : imageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
