// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorSessionResponse {

 List<SponsorWithSessions> get sponsors;
/// Create a copy of SponsorSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSessionResponseCopyWith<SponsorSessionResponse> get copyWith => _$SponsorSessionResponseCopyWithImpl<SponsorSessionResponse>(this as SponsorSessionResponse, _$identity);

  /// Serializes this SponsorSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSessionResponse&&const DeepCollectionEquality().equals(other.sponsors, sponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sponsors));

@override
String toString() {
  return 'SponsorSessionResponse(sponsors: $sponsors)';
}


}

/// @nodoc
abstract mixin class $SponsorSessionResponseCopyWith<$Res>  {
  factory $SponsorSessionResponseCopyWith(SponsorSessionResponse value, $Res Function(SponsorSessionResponse) _then) = _$SponsorSessionResponseCopyWithImpl;
@useResult
$Res call({
 List<SponsorWithSessions> sponsors
});




}
/// @nodoc
class _$SponsorSessionResponseCopyWithImpl<$Res>
    implements $SponsorSessionResponseCopyWith<$Res> {
  _$SponsorSessionResponseCopyWithImpl(this._self, this._then);

  final SponsorSessionResponse _self;
  final $Res Function(SponsorSessionResponse) _then;

/// Create a copy of SponsorSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsors = null,}) {
  return _then(_self.copyWith(
sponsors: null == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<SponsorWithSessions>,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorSessionResponse].
extension SponsorSessionResponsePatterns on SponsorSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SponsorWithSessions> sponsors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSessionResponse() when $default != null:
return $default(_that.sponsors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SponsorWithSessions> sponsors)  $default,) {final _that = this;
switch (_that) {
case _SponsorSessionResponse():
return $default(_that.sponsors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SponsorWithSessions> sponsors)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSessionResponse() when $default != null:
return $default(_that.sponsors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSessionResponse implements SponsorSessionResponse {
  const _SponsorSessionResponse({required final  List<SponsorWithSessions> sponsors}): _sponsors = sponsors;
  factory _SponsorSessionResponse.fromJson(Map<String, dynamic> json) => _$SponsorSessionResponseFromJson(json);

 final  List<SponsorWithSessions> _sponsors;
@override List<SponsorWithSessions> get sponsors {
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sponsors);
}


/// Create a copy of SponsorSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSessionResponseCopyWith<_SponsorSessionResponse> get copyWith => __$SponsorSessionResponseCopyWithImpl<_SponsorSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSessionResponse&&const DeepCollectionEquality().equals(other._sponsors, _sponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sponsors));

@override
String toString() {
  return 'SponsorSessionResponse(sponsors: $sponsors)';
}


}

/// @nodoc
abstract mixin class _$SponsorSessionResponseCopyWith<$Res> implements $SponsorSessionResponseCopyWith<$Res> {
  factory _$SponsorSessionResponseCopyWith(_SponsorSessionResponse value, $Res Function(_SponsorSessionResponse) _then) = __$SponsorSessionResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SponsorWithSessions> sponsors
});




}
/// @nodoc
class __$SponsorSessionResponseCopyWithImpl<$Res>
    implements _$SponsorSessionResponseCopyWith<$Res> {
  __$SponsorSessionResponseCopyWithImpl(this._self, this._then);

  final _SponsorSessionResponse _self;
  final $Res Function(_SponsorSessionResponse) _then;

/// Create a copy of SponsorSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsors = null,}) {
  return _then(_SponsorSessionResponse(
sponsors: null == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<SponsorWithSessions>,
  ));
}


}


/// @nodoc
mixin _$SponsorWithSessions {

 Sponsor get sponsor; List<SessionWithVenue> get sessions;
/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorWithSessionsCopyWith<SponsorWithSessions> get copyWith => _$SponsorWithSessionsCopyWithImpl<SponsorWithSessions>(this as SponsorWithSessions, _$identity);

  /// Serializes this SponsorWithSessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorWithSessions&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'SponsorWithSessions(sponsor: $sponsor, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SponsorWithSessionsCopyWith<$Res>  {
  factory $SponsorWithSessionsCopyWith(SponsorWithSessions value, $Res Function(SponsorWithSessions) _then) = _$SponsorWithSessionsCopyWithImpl;
@useResult
$Res call({
 Sponsor sponsor, List<SessionWithVenue> sessions
});


$SponsorCopyWith<$Res> get sponsor;

}
/// @nodoc
class _$SponsorWithSessionsCopyWithImpl<$Res>
    implements $SponsorWithSessionsCopyWith<$Res> {
  _$SponsorWithSessionsCopyWithImpl(this._self, this._then);

  final SponsorWithSessions _self;
  final $Res Function(SponsorWithSessions) _then;

/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsor = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithVenue>,
  ));
}
/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res> get sponsor {
  
  return $SponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorWithSessions].
extension SponsorWithSessionsPatterns on SponsorWithSessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorWithSessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorWithSessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorWithSessions value)  $default,){
final _that = this;
switch (_that) {
case _SponsorWithSessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorWithSessions value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorWithSessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sponsor sponsor,  List<SessionWithVenue> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorWithSessions() when $default != null:
return $default(_that.sponsor,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sponsor sponsor,  List<SessionWithVenue> sessions)  $default,) {final _that = this;
switch (_that) {
case _SponsorWithSessions():
return $default(_that.sponsor,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sponsor sponsor,  List<SessionWithVenue> sessions)?  $default,) {final _that = this;
switch (_that) {
case _SponsorWithSessions() when $default != null:
return $default(_that.sponsor,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorWithSessions implements SponsorWithSessions {
  const _SponsorWithSessions({required this.sponsor, required final  List<SessionWithVenue> sessions}): _sessions = sessions;
  factory _SponsorWithSessions.fromJson(Map<String, dynamic> json) => _$SponsorWithSessionsFromJson(json);

@override final  Sponsor sponsor;
 final  List<SessionWithVenue> _sessions;
@override List<SessionWithVenue> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorWithSessionsCopyWith<_SponsorWithSessions> get copyWith => __$SponsorWithSessionsCopyWithImpl<_SponsorWithSessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorWithSessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorWithSessions&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SponsorWithSessions(sponsor: $sponsor, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SponsorWithSessionsCopyWith<$Res> implements $SponsorWithSessionsCopyWith<$Res> {
  factory _$SponsorWithSessionsCopyWith(_SponsorWithSessions value, $Res Function(_SponsorWithSessions) _then) = __$SponsorWithSessionsCopyWithImpl;
@override @useResult
$Res call({
 Sponsor sponsor, List<SessionWithVenue> sessions
});


@override $SponsorCopyWith<$Res> get sponsor;

}
/// @nodoc
class __$SponsorWithSessionsCopyWithImpl<$Res>
    implements _$SponsorWithSessionsCopyWith<$Res> {
  __$SponsorWithSessionsCopyWithImpl(this._self, this._then);

  final _SponsorWithSessions _self;
  final $Res Function(_SponsorWithSessions) _then;

/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsor = null,Object? sessions = null,}) {
  return _then(_SponsorWithSessions(
sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithVenue>,
  ));
}

/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res> get sponsor {
  
  return $SponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// @nodoc
mixin _$SessionWithVenue {

 String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; List<Speaker> get speakers; String? get videoUrl; Venue? get venue;
/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionWithVenueCopyWith<SessionWithVenue> get copyWith => _$SessionWithVenueCopyWithImpl<SessionWithVenue>(this as SessionWithVenue, _$identity);

  /// Serializes this SessionWithVenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionWithVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(speakers),videoUrl,venue);

@override
String toString() {
  return 'SessionWithVenue(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, venue: $venue)';
}


}

/// @nodoc
abstract mixin class $SessionWithVenueCopyWith<$Res>  {
  factory $SessionWithVenueCopyWith(SessionWithVenue value, $Res Function(SessionWithVenue) _then) = _$SessionWithVenueCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Venue? venue
});


$VenueCopyWith<$Res>? get venue;

}
/// @nodoc
class _$SessionWithVenueCopyWithImpl<$Res>
    implements $SessionWithVenueCopyWith<$Res> {
  _$SessionWithVenueCopyWithImpl(this._self, this._then);

  final SessionWithVenue _self;
  final $Res Function(SessionWithVenue) _then;

/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? venue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as Venue?,
  ));
}
/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $VenueCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionWithVenue].
extension SessionWithVenuePatterns on SessionWithVenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionWithVenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionWithVenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionWithVenue value)  $default,){
final _that = this;
switch (_that) {
case _SessionWithVenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionWithVenue value)?  $default,){
final _that = this;
switch (_that) {
case _SessionWithVenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Venue? venue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionWithVenue() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.venue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Venue? venue)  $default,) {final _that = this;
switch (_that) {
case _SessionWithVenue():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.venue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Venue? venue)?  $default,) {final _that = this;
switch (_that) {
case _SessionWithVenue() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.venue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionWithVenue implements SessionWithVenue {
  const _SessionWithVenue({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.isLightningTalk, required this.isBeginnersLightningTalk, required this.isHandsOn, required final  List<Speaker> speakers, this.videoUrl, this.venue}): _speakers = speakers;
  factory _SessionWithVenue.fromJson(Map<String, dynamic> json) => _$SessionWithVenueFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  bool isLightningTalk;
@override final  bool isBeginnersLightningTalk;
@override final  bool isHandsOn;
 final  List<Speaker> _speakers;
@override List<Speaker> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  String? videoUrl;
@override final  Venue? venue;

/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionWithVenueCopyWith<_SessionWithVenue> get copyWith => __$SessionWithVenueCopyWithImpl<_SessionWithVenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionWithVenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionWithVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(_speakers),videoUrl,venue);

@override
String toString() {
  return 'SessionWithVenue(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, venue: $venue)';
}


}

/// @nodoc
abstract mixin class _$SessionWithVenueCopyWith<$Res> implements $SessionWithVenueCopyWith<$Res> {
  factory _$SessionWithVenueCopyWith(_SessionWithVenue value, $Res Function(_SessionWithVenue) _then) = __$SessionWithVenueCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Venue? venue
});


@override $VenueCopyWith<$Res>? get venue;

}
/// @nodoc
class __$SessionWithVenueCopyWithImpl<$Res>
    implements _$SessionWithVenueCopyWith<$Res> {
  __$SessionWithVenueCopyWithImpl(this._self, this._then);

  final _SessionWithVenue _self;
  final $Res Function(_SessionWithVenue) _then;

/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? venue = freezed,}) {
  return _then(_SessionWithVenue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as Venue?,
  ));
}

/// Create a copy of SessionWithVenue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $VenueCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}

// dart format on
