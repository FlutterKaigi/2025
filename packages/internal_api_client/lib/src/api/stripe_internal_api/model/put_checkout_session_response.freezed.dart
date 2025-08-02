// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_checkout_session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PutCheckoutSessionResponse {

 String get id; String get url; DateTime get expiresAt; String get status; String get customerEmail; Map<String, dynamic> get session;
/// Create a copy of PutCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PutCheckoutSessionResponseCopyWith<PutCheckoutSessionResponse> get copyWith => _$PutCheckoutSessionResponseCopyWithImpl<PutCheckoutSessionResponse>(this as PutCheckoutSessionResponse, _$identity);

  /// Serializes this PutCheckoutSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PutCheckoutSessionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&const DeepCollectionEquality().equals(other.session, session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,expiresAt,status,customerEmail,const DeepCollectionEquality().hash(session));

@override
String toString() {
  return 'PutCheckoutSessionResponse(id: $id, url: $url, expiresAt: $expiresAt, status: $status, customerEmail: $customerEmail, session: $session)';
}


}

/// @nodoc
abstract mixin class $PutCheckoutSessionResponseCopyWith<$Res>  {
  factory $PutCheckoutSessionResponseCopyWith(PutCheckoutSessionResponse value, $Res Function(PutCheckoutSessionResponse) _then) = _$PutCheckoutSessionResponseCopyWithImpl;
@useResult
$Res call({
 String id, String url, DateTime expiresAt, String status, String customerEmail, Map<String, dynamic> session
});




}
/// @nodoc
class _$PutCheckoutSessionResponseCopyWithImpl<$Res>
    implements $PutCheckoutSessionResponseCopyWith<$Res> {
  _$PutCheckoutSessionResponseCopyWithImpl(this._self, this._then);

  final PutCheckoutSessionResponse _self;
  final $Res Function(PutCheckoutSessionResponse) _then;

/// Create a copy of PutCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? expiresAt = null,Object? status = null,Object? customerEmail = null,Object? session = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PutCheckoutSessionResponse].
extension PutCheckoutSessionResponsePatterns on PutCheckoutSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PutCheckoutSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PutCheckoutSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PutCheckoutSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  DateTime expiresAt,  String status,  String customerEmail,  Map<String, dynamic> session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse() when $default != null:
return $default(_that.id,_that.url,_that.expiresAt,_that.status,_that.customerEmail,_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  DateTime expiresAt,  String status,  String customerEmail,  Map<String, dynamic> session)  $default,) {final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse():
return $default(_that.id,_that.url,_that.expiresAt,_that.status,_that.customerEmail,_that.session);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  DateTime expiresAt,  String status,  String customerEmail,  Map<String, dynamic> session)?  $default,) {final _that = this;
switch (_that) {
case _PutCheckoutSessionResponse() when $default != null:
return $default(_that.id,_that.url,_that.expiresAt,_that.status,_that.customerEmail,_that.session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PutCheckoutSessionResponse implements PutCheckoutSessionResponse {
  const _PutCheckoutSessionResponse({required this.id, required this.url, required this.expiresAt, required this.status, required this.customerEmail, required final  Map<String, dynamic> session}): _session = session;
  factory _PutCheckoutSessionResponse.fromJson(Map<String, dynamic> json) => _$PutCheckoutSessionResponseFromJson(json);

@override final  String id;
@override final  String url;
@override final  DateTime expiresAt;
@override final  String status;
@override final  String customerEmail;
 final  Map<String, dynamic> _session;
@override Map<String, dynamic> get session {
  if (_session is EqualUnmodifiableMapView) return _session;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_session);
}


/// Create a copy of PutCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PutCheckoutSessionResponseCopyWith<_PutCheckoutSessionResponse> get copyWith => __$PutCheckoutSessionResponseCopyWithImpl<_PutCheckoutSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PutCheckoutSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PutCheckoutSessionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&const DeepCollectionEquality().equals(other._session, _session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,expiresAt,status,customerEmail,const DeepCollectionEquality().hash(_session));

@override
String toString() {
  return 'PutCheckoutSessionResponse(id: $id, url: $url, expiresAt: $expiresAt, status: $status, customerEmail: $customerEmail, session: $session)';
}


}

/// @nodoc
abstract mixin class _$PutCheckoutSessionResponseCopyWith<$Res> implements $PutCheckoutSessionResponseCopyWith<$Res> {
  factory _$PutCheckoutSessionResponseCopyWith(_PutCheckoutSessionResponse value, $Res Function(_PutCheckoutSessionResponse) _then) = __$PutCheckoutSessionResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, DateTime expiresAt, String status, String customerEmail, Map<String, dynamic> session
});




}
/// @nodoc
class __$PutCheckoutSessionResponseCopyWithImpl<$Res>
    implements _$PutCheckoutSessionResponseCopyWith<$Res> {
  __$PutCheckoutSessionResponseCopyWithImpl(this._self, this._then);

  final _PutCheckoutSessionResponse _self;
  final $Res Function(_PutCheckoutSessionResponse) _then;

/// Create a copy of PutCheckoutSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? expiresAt = null,Object? status = null,Object? customerEmail = null,Object? session = null,}) {
  return _then(_PutCheckoutSessionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self._session : session // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
