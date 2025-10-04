// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_with_venue_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionWithVenueResponse {

 List<VenueWithSessions> get venues;
/// Create a copy of SessionWithVenueResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionWithVenueResponseCopyWith<SessionWithVenueResponse> get copyWith => _$SessionWithVenueResponseCopyWithImpl<SessionWithVenueResponse>(this as SessionWithVenueResponse, _$identity);

  /// Serializes this SessionWithVenueResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionWithVenueResponse&&const DeepCollectionEquality().equals(other.venues, venues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(venues));

@override
String toString() {
  return 'SessionWithVenueResponse(venues: $venues)';
}


}

/// @nodoc
abstract mixin class $SessionWithVenueResponseCopyWith<$Res>  {
  factory $SessionWithVenueResponseCopyWith(SessionWithVenueResponse value, $Res Function(SessionWithVenueResponse) _then) = _$SessionWithVenueResponseCopyWithImpl;
@useResult
$Res call({
 List<VenueWithSessions> venues
});




}
/// @nodoc
class _$SessionWithVenueResponseCopyWithImpl<$Res>
    implements $SessionWithVenueResponseCopyWith<$Res> {
  _$SessionWithVenueResponseCopyWithImpl(this._self, this._then);

  final SessionWithVenueResponse _self;
  final $Res Function(SessionWithVenueResponse) _then;

/// Create a copy of SessionWithVenueResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? venues = null,}) {
  return _then(_self.copyWith(
venues: null == venues ? _self.venues : venues // ignore: cast_nullable_to_non_nullable
as List<VenueWithSessions>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionWithVenueResponse].
extension SessionWithVenueResponsePatterns on SessionWithVenueResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionWithVenueResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionWithVenueResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionWithVenueResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionWithVenueResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionWithVenueResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionWithVenueResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VenueWithSessions> venues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionWithVenueResponse() when $default != null:
return $default(_that.venues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VenueWithSessions> venues)  $default,) {final _that = this;
switch (_that) {
case _SessionWithVenueResponse():
return $default(_that.venues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VenueWithSessions> venues)?  $default,) {final _that = this;
switch (_that) {
case _SessionWithVenueResponse() when $default != null:
return $default(_that.venues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionWithVenueResponse implements SessionWithVenueResponse {
  const _SessionWithVenueResponse({required final  List<VenueWithSessions> venues}): _venues = venues;
  factory _SessionWithVenueResponse.fromJson(Map<String, dynamic> json) => _$SessionWithVenueResponseFromJson(json);

 final  List<VenueWithSessions> _venues;
@override List<VenueWithSessions> get venues {
  if (_venues is EqualUnmodifiableListView) return _venues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_venues);
}


/// Create a copy of SessionWithVenueResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionWithVenueResponseCopyWith<_SessionWithVenueResponse> get copyWith => __$SessionWithVenueResponseCopyWithImpl<_SessionWithVenueResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionWithVenueResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionWithVenueResponse&&const DeepCollectionEquality().equals(other._venues, _venues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_venues));

@override
String toString() {
  return 'SessionWithVenueResponse(venues: $venues)';
}


}

/// @nodoc
abstract mixin class _$SessionWithVenueResponseCopyWith<$Res> implements $SessionWithVenueResponseCopyWith<$Res> {
  factory _$SessionWithVenueResponseCopyWith(_SessionWithVenueResponse value, $Res Function(_SessionWithVenueResponse) _then) = __$SessionWithVenueResponseCopyWithImpl;
@override @useResult
$Res call({
 List<VenueWithSessions> venues
});




}
/// @nodoc
class __$SessionWithVenueResponseCopyWithImpl<$Res>
    implements _$SessionWithVenueResponseCopyWith<$Res> {
  __$SessionWithVenueResponseCopyWithImpl(this._self, this._then);

  final _SessionWithVenueResponse _self;
  final $Res Function(_SessionWithVenueResponse) _then;

/// Create a copy of SessionWithVenueResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? venues = null,}) {
  return _then(_SessionWithVenueResponse(
venues: null == venues ? _self._venues : venues // ignore: cast_nullable_to_non_nullable
as List<VenueWithSessions>,
  ));
}


}


/// @nodoc
mixin _$VenueWithSessions {

 String get id; String get name; List<SessionWithSpeakers> get sessions;
/// Create a copy of VenueWithSessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenueWithSessionsCopyWith<VenueWithSessions> get copyWith => _$VenueWithSessionsCopyWithImpl<VenueWithSessions>(this as VenueWithSessions, _$identity);

  /// Serializes this VenueWithSessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VenueWithSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'VenueWithSessions(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $VenueWithSessionsCopyWith<$Res>  {
  factory $VenueWithSessionsCopyWith(VenueWithSessions value, $Res Function(VenueWithSessions) _then) = _$VenueWithSessionsCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SessionWithSpeakers> sessions
});




}
/// @nodoc
class _$VenueWithSessionsCopyWithImpl<$Res>
    implements $VenueWithSessionsCopyWith<$Res> {
  _$VenueWithSessionsCopyWithImpl(this._self, this._then);

  final VenueWithSessions _self;
  final $Res Function(VenueWithSessions) _then;

/// Create a copy of VenueWithSessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithSpeakers>,
  ));
}

}


/// Adds pattern-matching-related methods to [VenueWithSessions].
extension VenueWithSessionsPatterns on VenueWithSessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VenueWithSessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VenueWithSessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VenueWithSessions value)  $default,){
final _that = this;
switch (_that) {
case _VenueWithSessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VenueWithSessions value)?  $default,){
final _that = this;
switch (_that) {
case _VenueWithSessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithSpeakers> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VenueWithSessions() when $default != null:
return $default(_that.id,_that.name,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithSpeakers> sessions)  $default,) {final _that = this;
switch (_that) {
case _VenueWithSessions():
return $default(_that.id,_that.name,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SessionWithSpeakers> sessions)?  $default,) {final _that = this;
switch (_that) {
case _VenueWithSessions() when $default != null:
return $default(_that.id,_that.name,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VenueWithSessions implements VenueWithSessions {
  const _VenueWithSessions({required this.id, required this.name, required final  List<SessionWithSpeakers> sessions}): _sessions = sessions;
  factory _VenueWithSessions.fromJson(Map<String, dynamic> json) => _$VenueWithSessionsFromJson(json);

@override final  String id;
@override final  String name;
 final  List<SessionWithSpeakers> _sessions;
@override List<SessionWithSpeakers> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of VenueWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenueWithSessionsCopyWith<_VenueWithSessions> get copyWith => __$VenueWithSessionsCopyWithImpl<_VenueWithSessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenueWithSessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VenueWithSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'VenueWithSessions(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$VenueWithSessionsCopyWith<$Res> implements $VenueWithSessionsCopyWith<$Res> {
  factory _$VenueWithSessionsCopyWith(_VenueWithSessions value, $Res Function(_VenueWithSessions) _then) = __$VenueWithSessionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SessionWithSpeakers> sessions
});




}
/// @nodoc
class __$VenueWithSessionsCopyWithImpl<$Res>
    implements _$VenueWithSessionsCopyWith<$Res> {
  __$VenueWithSessionsCopyWithImpl(this._self, this._then);

  final _VenueWithSessions _self;
  final $Res Function(_VenueWithSessions) _then;

/// Create a copy of VenueWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_VenueWithSessions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithSpeakers>,
  ));
}


}

// dart format on
