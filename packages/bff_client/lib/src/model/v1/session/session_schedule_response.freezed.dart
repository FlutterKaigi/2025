// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionScheduleResponse {

 Map<String, List<ScheduleSession>> get schedule;
/// Create a copy of SessionScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionScheduleResponseCopyWith<SessionScheduleResponse> get copyWith => _$SessionScheduleResponseCopyWithImpl<SessionScheduleResponse>(this as SessionScheduleResponse, _$identity);

  /// Serializes this SessionScheduleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionScheduleResponse&&const DeepCollectionEquality().equals(other.schedule, schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedule));

@override
String toString() {
  return 'SessionScheduleResponse(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $SessionScheduleResponseCopyWith<$Res>  {
  factory $SessionScheduleResponseCopyWith(SessionScheduleResponse value, $Res Function(SessionScheduleResponse) _then) = _$SessionScheduleResponseCopyWithImpl;
@useResult
$Res call({
 Map<String, List<ScheduleSession>> schedule
});




}
/// @nodoc
class _$SessionScheduleResponseCopyWithImpl<$Res>
    implements $SessionScheduleResponseCopyWith<$Res> {
  _$SessionScheduleResponseCopyWithImpl(this._self, this._then);

  final SessionScheduleResponse _self;
  final $Res Function(SessionScheduleResponse) _then;

/// Create a copy of SessionScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedule = null,}) {
  return _then(_self.copyWith(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleSession>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionScheduleResponse].
extension SessionScheduleResponsePatterns on SessionScheduleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionScheduleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionScheduleResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionScheduleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionScheduleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, List<ScheduleSession>> schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionScheduleResponse() when $default != null:
return $default(_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, List<ScheduleSession>> schedule)  $default,) {final _that = this;
switch (_that) {
case _SessionScheduleResponse():
return $default(_that.schedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, List<ScheduleSession>> schedule)?  $default,) {final _that = this;
switch (_that) {
case _SessionScheduleResponse() when $default != null:
return $default(_that.schedule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionScheduleResponse implements SessionScheduleResponse {
  const _SessionScheduleResponse({required final  Map<String, List<ScheduleSession>> schedule}): _schedule = schedule;
  factory _SessionScheduleResponse.fromJson(Map<String, dynamic> json) => _$SessionScheduleResponseFromJson(json);

 final  Map<String, List<ScheduleSession>> _schedule;
@override Map<String, List<ScheduleSession>> get schedule {
  if (_schedule is EqualUnmodifiableMapView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_schedule);
}


/// Create a copy of SessionScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionScheduleResponseCopyWith<_SessionScheduleResponse> get copyWith => __$SessionScheduleResponseCopyWithImpl<_SessionScheduleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionScheduleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionScheduleResponse&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedule));

@override
String toString() {
  return 'SessionScheduleResponse(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$SessionScheduleResponseCopyWith<$Res> implements $SessionScheduleResponseCopyWith<$Res> {
  factory _$SessionScheduleResponseCopyWith(_SessionScheduleResponse value, $Res Function(_SessionScheduleResponse) _then) = __$SessionScheduleResponseCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<ScheduleSession>> schedule
});




}
/// @nodoc
class __$SessionScheduleResponseCopyWithImpl<$Res>
    implements _$SessionScheduleResponseCopyWith<$Res> {
  __$SessionScheduleResponseCopyWithImpl(this._self, this._then);

  final _SessionScheduleResponse _self;
  final $Res Function(_SessionScheduleResponse) _then;

/// Create a copy of SessionScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(_SessionScheduleResponse(
schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleSession>>,
  ));
}


}


/// @nodoc
mixin _$ScheduleSession {

 String get venue; String get venueId; String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; List<Speaker> get speakers; String? get videoUrl; String? get url; Sponsor? get sponsor;
/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleSessionCopyWith<ScheduleSession> get copyWith => _$ScheduleSessionCopyWithImpl<ScheduleSession>(this as ScheduleSession, _$identity);

  /// Serializes this ScheduleSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleSession&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(speakers),videoUrl,url,sponsor);

@override
String toString() {
  return 'ScheduleSession(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, url: $url, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $ScheduleSessionCopyWith<$Res>  {
  factory $ScheduleSessionCopyWith(ScheduleSession value, $Res Function(ScheduleSession) _then) = _$ScheduleSessionCopyWithImpl;
@useResult
$Res call({
 String venue, String venueId, String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, String? url, Sponsor? sponsor
});


$SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class _$ScheduleSessionCopyWithImpl<$Res>
    implements $ScheduleSessionCopyWith<$Res> {
  _$ScheduleSessionCopyWithImpl(this._self, this._then);

  final ScheduleSession _self;
  final $Res Function(ScheduleSession) _then;

/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? url = freezed,Object? sponsor = freezed,}) {
  return _then(_self.copyWith(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}
/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $SponsorCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScheduleSession].
extension ScheduleSessionPatterns on ScheduleSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleSession value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleSession value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleSession() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)  $default,) {final _that = this;
switch (_that) {
case _ScheduleSession():
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleSession() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleSession implements ScheduleSession {
  const _ScheduleSession({required this.venue, required this.venueId, required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.isLightningTalk, required this.isBeginnersLightningTalk, required this.isHandsOn, required final  List<Speaker> speakers, this.videoUrl, this.url, this.sponsor}): _speakers = speakers;
  factory _ScheduleSession.fromJson(Map<String, dynamic> json) => _$ScheduleSessionFromJson(json);

@override final  String venue;
@override final  String venueId;
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
@override final  String? url;
@override final  Sponsor? sponsor;

/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleSessionCopyWith<_ScheduleSession> get copyWith => __$ScheduleSessionCopyWithImpl<_ScheduleSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleSession&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(_speakers),videoUrl,url,sponsor);

@override
String toString() {
  return 'ScheduleSession(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, url: $url, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$ScheduleSessionCopyWith<$Res> implements $ScheduleSessionCopyWith<$Res> {
  factory _$ScheduleSessionCopyWith(_ScheduleSession value, $Res Function(_ScheduleSession) _then) = __$ScheduleSessionCopyWithImpl;
@override @useResult
$Res call({
 String venue, String venueId, String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, String? url, Sponsor? sponsor
});


@override $SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class __$ScheduleSessionCopyWithImpl<$Res>
    implements _$ScheduleSessionCopyWith<$Res> {
  __$ScheduleSessionCopyWithImpl(this._self, this._then);

  final _ScheduleSession _self;
  final $Res Function(_ScheduleSession) _then;

/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? url = freezed,Object? sponsor = freezed,}) {
  return _then(_ScheduleSession(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}

/// Create a copy of ScheduleSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $SponsorCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}

// dart format on
