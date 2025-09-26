// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_speakers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionSpeakers {

 String get sessionId; String get speakerId;
/// Create a copy of SessionSpeakers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSpeakersCopyWith<SessionSpeakers> get copyWith => _$SessionSpeakersCopyWithImpl<SessionSpeakers>(this as SessionSpeakers, _$identity);

  /// Serializes this SessionSpeakers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSpeakers&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.speakerId, speakerId) || other.speakerId == speakerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,speakerId);

@override
String toString() {
  return 'SessionSpeakers(sessionId: $sessionId, speakerId: $speakerId)';
}


}

/// @nodoc
abstract mixin class $SessionSpeakersCopyWith<$Res>  {
  factory $SessionSpeakersCopyWith(SessionSpeakers value, $Res Function(SessionSpeakers) _then) = _$SessionSpeakersCopyWithImpl;
@useResult
$Res call({
 String sessionId, String speakerId
});




}
/// @nodoc
class _$SessionSpeakersCopyWithImpl<$Res>
    implements $SessionSpeakersCopyWith<$Res> {
  _$SessionSpeakersCopyWithImpl(this._self, this._then);

  final SessionSpeakers _self;
  final $Res Function(SessionSpeakers) _then;

/// Create a copy of SessionSpeakers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? speakerId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,speakerId: null == speakerId ? _self.speakerId : speakerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSpeakers].
extension SessionSpeakersPatterns on SessionSpeakers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSpeakers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSpeakers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSpeakers value)  $default,){
final _that = this;
switch (_that) {
case _SessionSpeakers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSpeakers value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSpeakers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String speakerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSpeakers() when $default != null:
return $default(_that.sessionId,_that.speakerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String speakerId)  $default,) {final _that = this;
switch (_that) {
case _SessionSpeakers():
return $default(_that.sessionId,_that.speakerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String speakerId)?  $default,) {final _that = this;
switch (_that) {
case _SessionSpeakers() when $default != null:
return $default(_that.sessionId,_that.speakerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionSpeakers implements SessionSpeakers {
  const _SessionSpeakers({required this.sessionId, required this.speakerId});
  factory _SessionSpeakers.fromJson(Map<String, dynamic> json) => _$SessionSpeakersFromJson(json);

@override final  String sessionId;
@override final  String speakerId;

/// Create a copy of SessionSpeakers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSpeakersCopyWith<_SessionSpeakers> get copyWith => __$SessionSpeakersCopyWithImpl<_SessionSpeakers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionSpeakersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSpeakers&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.speakerId, speakerId) || other.speakerId == speakerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,speakerId);

@override
String toString() {
  return 'SessionSpeakers(sessionId: $sessionId, speakerId: $speakerId)';
}


}

/// @nodoc
abstract mixin class _$SessionSpeakersCopyWith<$Res> implements $SessionSpeakersCopyWith<$Res> {
  factory _$SessionSpeakersCopyWith(_SessionSpeakers value, $Res Function(_SessionSpeakers) _then) = __$SessionSpeakersCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String speakerId
});




}
/// @nodoc
class __$SessionSpeakersCopyWithImpl<$Res>
    implements _$SessionSpeakersCopyWith<$Res> {
  __$SessionSpeakersCopyWithImpl(this._self, this._then);

  final _SessionSpeakers _self;
  final $Res Function(_SessionSpeakers) _then;

/// Create a copy of SessionSpeakers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? speakerId = null,}) {
  return _then(_SessionSpeakers(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,speakerId: null == speakerId ? _self.speakerId : speakerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
