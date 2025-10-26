// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_ticket_sign_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
WebsocketTicketSignRequest _$WebsocketTicketSignRequestFromJson(
  Map<String, dynamic> json
) {
    return WebsocketTicketSignRequestUser.fromJson(
      json
    );
}

/// @nodoc
mixin _$WebsocketTicketSignRequest {

 String get userId;@DurationInSecondsConverter() Duration get expiration;
/// Create a copy of WebsocketTicketSignRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsocketTicketSignRequestCopyWith<WebsocketTicketSignRequest> get copyWith => _$WebsocketTicketSignRequestCopyWithImpl<WebsocketTicketSignRequest>(this as WebsocketTicketSignRequest, _$identity);

  /// Serializes this WebsocketTicketSignRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketTicketSignRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,expiration);

@override
String toString() {
  return 'WebsocketTicketSignRequest(userId: $userId, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class $WebsocketTicketSignRequestCopyWith<$Res>  {
  factory $WebsocketTicketSignRequestCopyWith(WebsocketTicketSignRequest value, $Res Function(WebsocketTicketSignRequest) _then) = _$WebsocketTicketSignRequestCopyWithImpl;
@useResult
$Res call({
 String userId,@DurationInSecondsConverter() Duration expiration
});




}
/// @nodoc
class _$WebsocketTicketSignRequestCopyWithImpl<$Res>
    implements $WebsocketTicketSignRequestCopyWith<$Res> {
  _$WebsocketTicketSignRequestCopyWithImpl(this._self, this._then);

  final WebsocketTicketSignRequest _self;
  final $Res Function(WebsocketTicketSignRequest) _then;

/// Create a copy of WebsocketTicketSignRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? expiration = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [WebsocketTicketSignRequest].
extension WebsocketTicketSignRequestPatterns on WebsocketTicketSignRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WebsocketTicketSignRequestUser value)?  user,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser() when user != null:
return user(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WebsocketTicketSignRequestUser value)  user,}){
final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser():
return user(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WebsocketTicketSignRequestUser value)?  user,}){
final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser() when user != null:
return user(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId, @DurationInSecondsConverter()  Duration expiration)?  user,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser() when user != null:
return user(_that.userId,_that.expiration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId, @DurationInSecondsConverter()  Duration expiration)  user,}) {final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser():
return user(_that.userId,_that.expiration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId, @DurationInSecondsConverter()  Duration expiration)?  user,}) {final _that = this;
switch (_that) {
case WebsocketTicketSignRequestUser() when user != null:
return user(_that.userId,_that.expiration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class WebsocketTicketSignRequestUser implements WebsocketTicketSignRequest {
  const WebsocketTicketSignRequestUser({required this.userId, @DurationInSecondsConverter() required this.expiration});
  factory WebsocketTicketSignRequestUser.fromJson(Map<String, dynamic> json) => _$WebsocketTicketSignRequestUserFromJson(json);

@override final  String userId;
@override@DurationInSecondsConverter() final  Duration expiration;

/// Create a copy of WebsocketTicketSignRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebsocketTicketSignRequestUserCopyWith<WebsocketTicketSignRequestUser> get copyWith => _$WebsocketTicketSignRequestUserCopyWithImpl<WebsocketTicketSignRequestUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebsocketTicketSignRequestUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketTicketSignRequestUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,expiration);

@override
String toString() {
  return 'WebsocketTicketSignRequest.user(userId: $userId, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class $WebsocketTicketSignRequestUserCopyWith<$Res> implements $WebsocketTicketSignRequestCopyWith<$Res> {
  factory $WebsocketTicketSignRequestUserCopyWith(WebsocketTicketSignRequestUser value, $Res Function(WebsocketTicketSignRequestUser) _then) = _$WebsocketTicketSignRequestUserCopyWithImpl;
@override @useResult
$Res call({
 String userId,@DurationInSecondsConverter() Duration expiration
});




}
/// @nodoc
class _$WebsocketTicketSignRequestUserCopyWithImpl<$Res>
    implements $WebsocketTicketSignRequestUserCopyWith<$Res> {
  _$WebsocketTicketSignRequestUserCopyWithImpl(this._self, this._then);

  final WebsocketTicketSignRequestUser _self;
  final $Res Function(WebsocketTicketSignRequestUser) _then;

/// Create a copy of WebsocketTicketSignRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? expiration = null,}) {
  return _then(WebsocketTicketSignRequestUser(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
