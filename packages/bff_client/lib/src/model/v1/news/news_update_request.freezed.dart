// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsUpdateRequest {

 String get title; String get url; DateTime? get startsAt; DateTime? get endsAt;
/// Create a copy of NewsUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsUpdateRequestCopyWith<NewsUpdateRequest> get copyWith => _$NewsUpdateRequestCopyWithImpl<NewsUpdateRequest>(this as NewsUpdateRequest, _$identity);

  /// Serializes this NewsUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsUpdateRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,startsAt,endsAt);

@override
String toString() {
  return 'NewsUpdateRequest(title: $title, url: $url, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class $NewsUpdateRequestCopyWith<$Res>  {
  factory $NewsUpdateRequestCopyWith(NewsUpdateRequest value, $Res Function(NewsUpdateRequest) _then) = _$NewsUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String title, String url, DateTime? startsAt, DateTime? endsAt
});




}
/// @nodoc
class _$NewsUpdateRequestCopyWithImpl<$Res>
    implements $NewsUpdateRequestCopyWith<$Res> {
  _$NewsUpdateRequestCopyWithImpl(this._self, this._then);

  final NewsUpdateRequest _self;
  final $Res Function(NewsUpdateRequest) _then;

/// Create a copy of NewsUpdateRequest
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


/// Adds pattern-matching-related methods to [NewsUpdateRequest].
extension NewsUpdateRequestPatterns on NewsUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _NewsUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NewsUpdateRequest() when $default != null:
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
case _NewsUpdateRequest() when $default != null:
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
case _NewsUpdateRequest():
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
case _NewsUpdateRequest() when $default != null:
return $default(_that.title,_that.url,_that.startsAt,_that.endsAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsUpdateRequest implements NewsUpdateRequest {
  const _NewsUpdateRequest({required this.title, required this.url, this.startsAt, this.endsAt});
  factory _NewsUpdateRequest.fromJson(Map<String, dynamic> json) => _$NewsUpdateRequestFromJson(json);

@override final  String title;
@override final  String url;
@override final  DateTime? startsAt;
@override final  DateTime? endsAt;

/// Create a copy of NewsUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsUpdateRequestCopyWith<_NewsUpdateRequest> get copyWith => __$NewsUpdateRequestCopyWithImpl<_NewsUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsUpdateRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,startsAt,endsAt);

@override
String toString() {
  return 'NewsUpdateRequest(title: $title, url: $url, startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class _$NewsUpdateRequestCopyWith<$Res> implements $NewsUpdateRequestCopyWith<$Res> {
  factory _$NewsUpdateRequestCopyWith(_NewsUpdateRequest value, $Res Function(_NewsUpdateRequest) _then) = __$NewsUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, DateTime? startsAt, DateTime? endsAt
});




}
/// @nodoc
class __$NewsUpdateRequestCopyWithImpl<$Res>
    implements _$NewsUpdateRequestCopyWith<$Res> {
  __$NewsUpdateRequestCopyWithImpl(this._self, this._then);

  final _NewsUpdateRequest _self;
  final $Res Function(_NewsUpdateRequest) _then;

/// Create a copy of NewsUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? startsAt = freezed,Object? endsAt = freezed,}) {
  return _then(_NewsUpdateRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
