// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_websocket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserWebsocketResponse {

 String get url; String get ticket; int get expiration; DateTime get responseAt;
/// Create a copy of UserWebsocketResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketResponseCopyWith<UserWebsocketResponse> get copyWith => _$UserWebsocketResponseCopyWithImpl<UserWebsocketResponse>(this as UserWebsocketResponse, _$identity);

  /// Serializes this UserWebsocketResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.responseAt, responseAt) || other.responseAt == responseAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,ticket,expiration,responseAt);

@override
String toString() {
  return 'UserWebsocketResponse(url: $url, ticket: $ticket, expiration: $expiration, responseAt: $responseAt)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketResponseCopyWith<$Res>  {
  factory $UserWebsocketResponseCopyWith(UserWebsocketResponse value, $Res Function(UserWebsocketResponse) _then) = _$UserWebsocketResponseCopyWithImpl;
@useResult
$Res call({
 String url, String ticket, int expiration, DateTime responseAt
});




}
/// @nodoc
class _$UserWebsocketResponseCopyWithImpl<$Res>
    implements $UserWebsocketResponseCopyWith<$Res> {
  _$UserWebsocketResponseCopyWithImpl(this._self, this._then);

  final UserWebsocketResponse _self;
  final $Res Function(UserWebsocketResponse) _then;

/// Create a copy of UserWebsocketResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? ticket = null,Object? expiration = null,Object? responseAt = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as int,responseAt: null == responseAt ? _self.responseAt : responseAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserWebsocketResponse].
extension UserWebsocketResponsePatterns on UserWebsocketResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserWebsocketResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserWebsocketResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserWebsocketResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserWebsocketResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserWebsocketResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserWebsocketResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String ticket,  int expiration,  DateTime responseAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWebsocketResponse() when $default != null:
return $default(_that.url,_that.ticket,_that.expiration,_that.responseAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String ticket,  int expiration,  DateTime responseAt)  $default,) {final _that = this;
switch (_that) {
case _UserWebsocketResponse():
return $default(_that.url,_that.ticket,_that.expiration,_that.responseAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String ticket,  int expiration,  DateTime responseAt)?  $default,) {final _that = this;
switch (_that) {
case _UserWebsocketResponse() when $default != null:
return $default(_that.url,_that.ticket,_that.expiration,_that.responseAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserWebsocketResponse implements UserWebsocketResponse {
  const _UserWebsocketResponse({required this.url, required this.ticket, required this.expiration, required this.responseAt});
  factory _UserWebsocketResponse.fromJson(Map<String, dynamic> json) => _$UserWebsocketResponseFromJson(json);

@override final  String url;
@override final  String ticket;
@override final  int expiration;
@override final  DateTime responseAt;

/// Create a copy of UserWebsocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserWebsocketResponseCopyWith<_UserWebsocketResponse> get copyWith => __$UserWebsocketResponseCopyWithImpl<_UserWebsocketResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWebsocketResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWebsocketResponse&&(identical(other.url, url) || other.url == url)&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.responseAt, responseAt) || other.responseAt == responseAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,ticket,expiration,responseAt);

@override
String toString() {
  return 'UserWebsocketResponse(url: $url, ticket: $ticket, expiration: $expiration, responseAt: $responseAt)';
}


}

/// @nodoc
abstract mixin class _$UserWebsocketResponseCopyWith<$Res> implements $UserWebsocketResponseCopyWith<$Res> {
  factory _$UserWebsocketResponseCopyWith(_UserWebsocketResponse value, $Res Function(_UserWebsocketResponse) _then) = __$UserWebsocketResponseCopyWithImpl;
@override @useResult
$Res call({
 String url, String ticket, int expiration, DateTime responseAt
});




}
/// @nodoc
class __$UserWebsocketResponseCopyWithImpl<$Res>
    implements _$UserWebsocketResponseCopyWith<$Res> {
  __$UserWebsocketResponseCopyWithImpl(this._self, this._then);

  final _UserWebsocketResponse _self;
  final $Res Function(_UserWebsocketResponse) _then;

/// Create a copy of UserWebsocketResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? ticket = null,Object? expiration = null,Object? responseAt = null,}) {
  return _then(_UserWebsocketResponse(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as int,responseAt: null == responseAt ? _self.responseAt : responseAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
