// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signed_url_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SignedUrlRequest _$SignedUrlRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'put':
          return SignedUrlRequestPut.fromJson(
            json
          );
                case 'get':
          return SignedUrlRequestGet.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'SignedUrlRequest',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$SignedUrlRequest {

 String get key; int get expiresIn;
/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedUrlRequestCopyWith<SignedUrlRequest> get copyWith => _$SignedUrlRequestCopyWithImpl<SignedUrlRequest>(this as SignedUrlRequest, _$identity);

  /// Serializes this SignedUrlRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedUrlRequest&&(identical(other.key, key) || other.key == key)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,expiresIn);

@override
String toString() {
  return 'SignedUrlRequest(key: $key, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $SignedUrlRequestCopyWith<$Res>  {
  factory $SignedUrlRequestCopyWith(SignedUrlRequest value, $Res Function(SignedUrlRequest) _then) = _$SignedUrlRequestCopyWithImpl;
@useResult
$Res call({
 String key, int expiresIn
});




}
/// @nodoc
class _$SignedUrlRequestCopyWithImpl<$Res>
    implements $SignedUrlRequestCopyWith<$Res> {
  _$SignedUrlRequestCopyWithImpl(this._self, this._then);

  final SignedUrlRequest _self;
  final $Res Function(SignedUrlRequest) _then;

/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SignedUrlRequest].
extension SignedUrlRequestPatterns on SignedUrlRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignedUrlRequestPut value)?  put,TResult Function( SignedUrlRequestGet value)?  get,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignedUrlRequestPut() when put != null:
return put(_that);case SignedUrlRequestGet() when get != null:
return get(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignedUrlRequestPut value)  put,required TResult Function( SignedUrlRequestGet value)  get,}){
final _that = this;
switch (_that) {
case SignedUrlRequestPut():
return put(_that);case SignedUrlRequestGet():
return get(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignedUrlRequestPut value)?  put,TResult? Function( SignedUrlRequestGet value)?  get,}){
final _that = this;
switch (_that) {
case SignedUrlRequestPut() when put != null:
return put(_that);case SignedUrlRequestGet() when get != null:
return get(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String extension,  int contentLength,  String mimeType,  int expiresIn)?  put,TResult Function( String key,  int expiresIn)?  get,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignedUrlRequestPut() when put != null:
return put(_that.key,_that.extension,_that.contentLength,_that.mimeType,_that.expiresIn);case SignedUrlRequestGet() when get != null:
return get(_that.key,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String extension,  int contentLength,  String mimeType,  int expiresIn)  put,required TResult Function( String key,  int expiresIn)  get,}) {final _that = this;
switch (_that) {
case SignedUrlRequestPut():
return put(_that.key,_that.extension,_that.contentLength,_that.mimeType,_that.expiresIn);case SignedUrlRequestGet():
return get(_that.key,_that.expiresIn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String extension,  int contentLength,  String mimeType,  int expiresIn)?  put,TResult? Function( String key,  int expiresIn)?  get,}) {final _that = this;
switch (_that) {
case SignedUrlRequestPut() when put != null:
return put(_that.key,_that.extension,_that.contentLength,_that.mimeType,_that.expiresIn);case SignedUrlRequestGet() when get != null:
return get(_that.key,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SignedUrlRequestPut implements SignedUrlRequest {
  const SignedUrlRequestPut({required this.key, required this.extension, required this.contentLength, required this.mimeType, required this.expiresIn, final  String? $type}): $type = $type ?? 'put';
  factory SignedUrlRequestPut.fromJson(Map<String, dynamic> json) => _$SignedUrlRequestPutFromJson(json);

@override final  String key;
 final  String extension;
 final  int contentLength;
 final  String mimeType;
@override final  int expiresIn;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedUrlRequestPutCopyWith<SignedUrlRequestPut> get copyWith => _$SignedUrlRequestPutCopyWithImpl<SignedUrlRequestPut>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignedUrlRequestPutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedUrlRequestPut&&(identical(other.key, key) || other.key == key)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.contentLength, contentLength) || other.contentLength == contentLength)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,extension,contentLength,mimeType,expiresIn);

@override
String toString() {
  return 'SignedUrlRequest.put(key: $key, extension: $extension, contentLength: $contentLength, mimeType: $mimeType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $SignedUrlRequestPutCopyWith<$Res> implements $SignedUrlRequestCopyWith<$Res> {
  factory $SignedUrlRequestPutCopyWith(SignedUrlRequestPut value, $Res Function(SignedUrlRequestPut) _then) = _$SignedUrlRequestPutCopyWithImpl;
@override @useResult
$Res call({
 String key, String extension, int contentLength, String mimeType, int expiresIn
});




}
/// @nodoc
class _$SignedUrlRequestPutCopyWithImpl<$Res>
    implements $SignedUrlRequestPutCopyWith<$Res> {
  _$SignedUrlRequestPutCopyWithImpl(this._self, this._then);

  final SignedUrlRequestPut _self;
  final $Res Function(SignedUrlRequestPut) _then;

/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? extension = null,Object? contentLength = null,Object? mimeType = null,Object? expiresIn = null,}) {
  return _then(SignedUrlRequestPut(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,contentLength: null == contentLength ? _self.contentLength : contentLength // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SignedUrlRequestGet implements SignedUrlRequest {
  const SignedUrlRequestGet({required this.key, required this.expiresIn, final  String? $type}): $type = $type ?? 'get';
  factory SignedUrlRequestGet.fromJson(Map<String, dynamic> json) => _$SignedUrlRequestGetFromJson(json);

@override final  String key;
@override final  int expiresIn;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedUrlRequestGetCopyWith<SignedUrlRequestGet> get copyWith => _$SignedUrlRequestGetCopyWithImpl<SignedUrlRequestGet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignedUrlRequestGetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedUrlRequestGet&&(identical(other.key, key) || other.key == key)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,expiresIn);

@override
String toString() {
  return 'SignedUrlRequest.get(key: $key, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $SignedUrlRequestGetCopyWith<$Res> implements $SignedUrlRequestCopyWith<$Res> {
  factory $SignedUrlRequestGetCopyWith(SignedUrlRequestGet value, $Res Function(SignedUrlRequestGet) _then) = _$SignedUrlRequestGetCopyWithImpl;
@override @useResult
$Res call({
 String key, int expiresIn
});




}
/// @nodoc
class _$SignedUrlRequestGetCopyWithImpl<$Res>
    implements $SignedUrlRequestGetCopyWith<$Res> {
  _$SignedUrlRequestGetCopyWithImpl(this._self, this._then);

  final SignedUrlRequestGet _self;
  final $Res Function(SignedUrlRequestGet) _then;

/// Create a copy of SignedUrlRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? expiresIn = null,}) {
  return _then(SignedUrlRequestGet(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
