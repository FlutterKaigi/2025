// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsListResponse {

 List<News> get news;
/// Create a copy of NewsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsListResponseCopyWith<NewsListResponse> get copyWith => _$NewsListResponseCopyWithImpl<NewsListResponse>(this as NewsListResponse, _$identity);

  /// Serializes this NewsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsListResponse&&const DeepCollectionEquality().equals(other.news, news));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(news));

@override
String toString() {
  return 'NewsListResponse(news: $news)';
}


}

/// @nodoc
abstract mixin class $NewsListResponseCopyWith<$Res>  {
  factory $NewsListResponseCopyWith(NewsListResponse value, $Res Function(NewsListResponse) _then) = _$NewsListResponseCopyWithImpl;
@useResult
$Res call({
 List<News> news
});




}
/// @nodoc
class _$NewsListResponseCopyWithImpl<$Res>
    implements $NewsListResponseCopyWith<$Res> {
  _$NewsListResponseCopyWithImpl(this._self, this._then);

  final NewsListResponse _self;
  final $Res Function(NewsListResponse) _then;

/// Create a copy of NewsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? news = null,}) {
  return _then(_self.copyWith(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as List<News>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsListResponse].
extension NewsListResponsePatterns on NewsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _NewsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NewsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<News> news)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsListResponse() when $default != null:
return $default(_that.news);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<News> news)  $default,) {final _that = this;
switch (_that) {
case _NewsListResponse():
return $default(_that.news);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<News> news)?  $default,) {final _that = this;
switch (_that) {
case _NewsListResponse() when $default != null:
return $default(_that.news);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsListResponse implements NewsListResponse {
  const _NewsListResponse({required final  List<News> news}): _news = news;
  factory _NewsListResponse.fromJson(Map<String, dynamic> json) => _$NewsListResponseFromJson(json);

 final  List<News> _news;
@override List<News> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of NewsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsListResponseCopyWith<_NewsListResponse> get copyWith => __$NewsListResponseCopyWithImpl<_NewsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsListResponse&&const DeepCollectionEquality().equals(other._news, _news));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));

@override
String toString() {
  return 'NewsListResponse(news: $news)';
}


}

/// @nodoc
abstract mixin class _$NewsListResponseCopyWith<$Res> implements $NewsListResponseCopyWith<$Res> {
  factory _$NewsListResponseCopyWith(_NewsListResponse value, $Res Function(_NewsListResponse) _then) = __$NewsListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<News> news
});




}
/// @nodoc
class __$NewsListResponseCopyWithImpl<$Res>
    implements _$NewsListResponseCopyWith<$Res> {
  __$NewsListResponseCopyWithImpl(this._self, this._then);

  final _NewsListResponse _self;
  final $Res Function(_NewsListResponse) _then;

/// Create a copy of NewsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(_NewsListResponse(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<News>,
  ));
}


}

// dart format on
