// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_create_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsCreateRequest {

 String get title; String get url; DateTime? get startsAt; DateTime? get endsAt;
/// Create a copy of NewsCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsCreateRequestCopyWith<NewsCreateRequest> get copyWith => _$NewsCreateRequestCopyWithImpl<NewsCreateRequest>(this as NewsCreateRequest, _$identity);

  /// Serializes this NewsCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsCreateRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,startsAt,endsAt);

@override
String toString() {
  return 'NewsCreateRequest(title: $title, url: $url, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class $NewsCreateRequestCopyWith<$Res>  {
  factory $NewsCreateRequestCopyWith(NewsCreateRequest value, $Res Function(NewsCreateRequest) _then) = _$NewsCreateRequestCopyWithImpl;
@useResult
$Res call({
 String title, String url, DateTime? startsAt, DateTime? endsAt
});




}
/// @nodoc
class _$NewsCreateRequestCopyWithImpl<$Res>
    implements $NewsCreateRequestCopyWith<$Res> {
  _$NewsCreateRequestCopyWithImpl(this._self, this._then);

  final NewsCreateRequest _self;
  final $Res Function(NewsCreateRequest) _then;

/// Create a copy of NewsCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,Object? startsAt = freezed,Object? endsAt = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsCreateRequest].
extension NewsCreateRequestPatterns on NewsCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _NewsCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NewsCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String url,  DateTime? startsAt,  DateTime? endsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsCreateRequest() when $default != null:
return $default(_that.title,_that.url,_that.startsAt,_that.endsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String url,  DateTime? startsAt,  DateTime? endsAt)  $default,) {final _that = this;
switch (_that) {
case _NewsCreateRequest():
return $default(_that.title,_that.url,_that.startsAt,_that.endsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String url,  DateTime? startsAt,  DateTime? endsAt)?  $default,) {final _that = this;
switch (_that) {
case _NewsCreateRequest() when $default != null:
return $default(_that.title,_that.url,_that.startsAt,_that.endsAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsCreateRequest implements NewsCreateRequest {
  const _NewsCreateRequest({required this.title, required this.url, this.startsAt, this.endsAt});
  factory _NewsCreateRequest.fromJson(Map<String, dynamic> json) => _$NewsCreateRequestFromJson(json);

@override final  String title;
@override final  String url;
@override final  DateTime? startsAt;
@override final  DateTime? endsAt;

/// Create a copy of NewsCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsCreateRequestCopyWith<_NewsCreateRequest> get copyWith => __$NewsCreateRequestCopyWithImpl<_NewsCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsCreateRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,startsAt,endsAt);

@override
String toString() {
  return 'NewsCreateRequest(title: $title, url: $url, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class _$NewsCreateRequestCopyWith<$Res> implements $NewsCreateRequestCopyWith<$Res> {
  factory _$NewsCreateRequestCopyWith(_NewsCreateRequest value, $Res Function(_NewsCreateRequest) _then) = __$NewsCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, DateTime? startsAt, DateTime? endsAt
});




}
/// @nodoc
class __$NewsCreateRequestCopyWithImpl<$Res>
    implements _$NewsCreateRequestCopyWith<$Res> {
  __$NewsCreateRequestCopyWithImpl(this._self, this._then);

  final _NewsCreateRequest _self;
  final $Res Function(_NewsCreateRequest) _then;

/// Create a copy of NewsCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? startsAt = freezed,Object? endsAt = freezed,}) {
  return _then(_NewsCreateRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
