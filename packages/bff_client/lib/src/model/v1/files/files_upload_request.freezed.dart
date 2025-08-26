// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files_upload_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilesUploadRequest {

 FileVariant get variant; int get contentLength;
/// Create a copy of FilesUploadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilesUploadRequestCopyWith<FilesUploadRequest> get copyWith => _$FilesUploadRequestCopyWithImpl<FilesUploadRequest>(this as FilesUploadRequest, _$identity);

  /// Serializes this FilesUploadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilesUploadRequest&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.contentLength, contentLength) || other.contentLength == contentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variant,contentLength);

@override
String toString() {
  return 'FilesUploadRequest(variant: $variant, contentLength: $contentLength)';
}


}

/// @nodoc
abstract mixin class $FilesUploadRequestCopyWith<$Res>  {
  factory $FilesUploadRequestCopyWith(FilesUploadRequest value, $Res Function(FilesUploadRequest) _then) = _$FilesUploadRequestCopyWithImpl;
@useResult
$Res call({
 FileVariant variant, int contentLength
});




}
/// @nodoc
class _$FilesUploadRequestCopyWithImpl<$Res>
    implements $FilesUploadRequestCopyWith<$Res> {
  _$FilesUploadRequestCopyWithImpl(this._self, this._then);

  final FilesUploadRequest _self;
  final $Res Function(FilesUploadRequest) _then;

/// Create a copy of FilesUploadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variant = null,Object? contentLength = null,}) {
  return _then(_self.copyWith(
variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as FileVariant,contentLength: null == contentLength ? _self.contentLength : contentLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FilesUploadRequest].
extension FilesUploadRequestPatterns on FilesUploadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilesUploadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilesUploadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilesUploadRequest value)  $default,){
final _that = this;
switch (_that) {
case _FilesUploadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilesUploadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FilesUploadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FileVariant variant,  int contentLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilesUploadRequest() when $default != null:
return $default(_that.variant,_that.contentLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FileVariant variant,  int contentLength)  $default,) {final _that = this;
switch (_that) {
case _FilesUploadRequest():
return $default(_that.variant,_that.contentLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FileVariant variant,  int contentLength)?  $default,) {final _that = this;
switch (_that) {
case _FilesUploadRequest() when $default != null:
return $default(_that.variant,_that.contentLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilesUploadRequest implements FilesUploadRequest {
  const _FilesUploadRequest({required this.variant, required this.contentLength});
  factory _FilesUploadRequest.fromJson(Map<String, dynamic> json) => _$FilesUploadRequestFromJson(json);

@override final  FileVariant variant;
@override final  int contentLength;

/// Create a copy of FilesUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilesUploadRequestCopyWith<_FilesUploadRequest> get copyWith => __$FilesUploadRequestCopyWithImpl<_FilesUploadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilesUploadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilesUploadRequest&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.contentLength, contentLength) || other.contentLength == contentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variant,contentLength);

@override
String toString() {
  return 'FilesUploadRequest(variant: $variant, contentLength: $contentLength)';
}


}

/// @nodoc
abstract mixin class _$FilesUploadRequestCopyWith<$Res> implements $FilesUploadRequestCopyWith<$Res> {
  factory _$FilesUploadRequestCopyWith(_FilesUploadRequest value, $Res Function(_FilesUploadRequest) _then) = __$FilesUploadRequestCopyWithImpl;
@override @useResult
$Res call({
 FileVariant variant, int contentLength
});




}
/// @nodoc
class __$FilesUploadRequestCopyWithImpl<$Res>
    implements _$FilesUploadRequestCopyWith<$Res> {
  __$FilesUploadRequestCopyWithImpl(this._self, this._then);

  final _FilesUploadRequest _self;
  final $Res Function(_FilesUploadRequest) _then;

/// Create a copy of FilesUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variant = null,Object? contentLength = null,}) {
  return _then(_FilesUploadRequest(
variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as FileVariant,contentLength: null == contentLength ? _self.contentLength : contentLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
