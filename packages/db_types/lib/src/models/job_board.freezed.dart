// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobBoard {

 int get id; String get url; String get altText; String get imageUrl;
/// Create a copy of JobBoard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobBoardCopyWith<JobBoard> get copyWith => _$JobBoardCopyWithImpl<JobBoard>(this as JobBoard, _$identity);

  /// Serializes this JobBoard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobBoard&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,altText,imageUrl);

@override
String toString() {
  return 'JobBoard(id: $id, url: $url, altText: $altText, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $JobBoardCopyWith<$Res>  {
  factory $JobBoardCopyWith(JobBoard value, $Res Function(JobBoard) _then) = _$JobBoardCopyWithImpl;
@useResult
$Res call({
 int id, String url, String altText, String imageUrl
});




}
/// @nodoc
class _$JobBoardCopyWithImpl<$Res>
    implements $JobBoardCopyWith<$Res> {
  _$JobBoardCopyWithImpl(this._self, this._then);

  final JobBoard _self;
  final $Res Function(JobBoard) _then;

/// Create a copy of JobBoard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? altText = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobBoard].
extension JobBoardPatterns on JobBoard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobBoard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobBoard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobBoard value)  $default,){
final _that = this;
switch (_that) {
case _JobBoard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobBoard value)?  $default,){
final _that = this;
switch (_that) {
case _JobBoard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url,  String altText,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobBoard() when $default != null:
return $default(_that.id,_that.url,_that.altText,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url,  String altText,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _JobBoard():
return $default(_that.id,_that.url,_that.altText,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url,  String altText,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _JobBoard() when $default != null:
return $default(_that.id,_that.url,_that.altText,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobBoard implements JobBoard {
  const _JobBoard({required this.id, required this.url, required this.altText, required this.imageUrl});
  factory _JobBoard.fromJson(Map<String, dynamic> json) => _$JobBoardFromJson(json);

@override final  int id;
@override final  String url;
@override final  String altText;
@override final  String imageUrl;

/// Create a copy of JobBoard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobBoardCopyWith<_JobBoard> get copyWith => __$JobBoardCopyWithImpl<_JobBoard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobBoardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobBoard&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,altText,imageUrl);

@override
String toString() {
  return 'JobBoard(id: $id, url: $url, altText: $altText, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$JobBoardCopyWith<$Res> implements $JobBoardCopyWith<$Res> {
  factory _$JobBoardCopyWith(_JobBoard value, $Res Function(_JobBoard) _then) = __$JobBoardCopyWithImpl;
@override @useResult
$Res call({
 int id, String url, String altText, String imageUrl
});




}
/// @nodoc
class __$JobBoardCopyWithImpl<$Res>
    implements _$JobBoardCopyWith<$Res> {
  __$JobBoardCopyWithImpl(this._self, this._then);

  final _JobBoard _self;
  final $Res Function(_JobBoard) _then;

/// Create a copy of JobBoard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? altText = null,Object? imageUrl = null,}) {
  return _then(_JobBoard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
