// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionListResponse {

 List<Session> get sessions;
/// Create a copy of SessionListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionListResponseCopyWith<SessionListResponse> get copyWith => _$SessionListResponseCopyWithImpl<SessionListResponse>(this as SessionListResponse, _$identity);

  /// Serializes this SessionListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionListResponse&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'SessionListResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionListResponseCopyWith<$Res>  {
  factory $SessionListResponseCopyWith(SessionListResponse value, $Res Function(SessionListResponse) _then) = _$SessionListResponseCopyWithImpl;
@useResult
$Res call({
 List<Session> sessions
});




}
/// @nodoc
class _$SessionListResponseCopyWithImpl<$Res>
    implements $SessionListResponseCopyWith<$Res> {
  _$SessionListResponseCopyWithImpl(this._self, this._then);

  final SessionListResponse _self;
  final $Res Function(SessionListResponse) _then;

/// Create a copy of SessionListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionListResponse].
extension SessionListResponsePatterns on SessionListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Session> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionListResponse() when $default != null:
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Session> sessions)  $default,) {final _that = this;
switch (_that) {
case _SessionListResponse():
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Session> sessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionListResponse() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionListResponse implements SessionListResponse {
  const _SessionListResponse({required final  List<Session> sessions}): _sessions = sessions;
  factory _SessionListResponse.fromJson(Map<String, dynamic> json) => _$SessionListResponseFromJson(json);

 final  List<Session> _sessions;
@override List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SessionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionListResponseCopyWith<_SessionListResponse> get copyWith => __$SessionListResponseCopyWithImpl<_SessionListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionListResponse&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionListResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SessionListResponseCopyWith<$Res> implements $SessionListResponseCopyWith<$Res> {
  factory _$SessionListResponseCopyWith(_SessionListResponse value, $Res Function(_SessionListResponse) _then) = __$SessionListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Session> sessions
});




}
/// @nodoc
class __$SessionListResponseCopyWithImpl<$Res>
    implements _$SessionListResponseCopyWith<$Res> {
  __$SessionListResponseCopyWithImpl(this._self, this._then);

  final _SessionListResponse _self;
  final $Res Function(_SessionListResponse) _then;

/// Create a copy of SessionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_SessionListResponse(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}


}

// dart format on
