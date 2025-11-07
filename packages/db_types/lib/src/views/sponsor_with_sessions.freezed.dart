// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_with_sessions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorWithSessions {

 CompanySponsorDetail get sponsor; List<SponsorSessionDetail> get sessions;
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
 CompanySponsorDetail sponsor, List<SponsorSessionDetail> sessions
});


$CompanySponsorDetailCopyWith<$Res> get sponsor;

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
as CompanySponsorDetail,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SponsorSessionDetail>,
  ));
}
/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<$Res> get sponsor {
  
  return $CompanySponsorDetailCopyWith<$Res>(_self.sponsor, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CompanySponsorDetail sponsor,  List<SponsorSessionDetail> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CompanySponsorDetail sponsor,  List<SponsorSessionDetail> sessions)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CompanySponsorDetail sponsor,  List<SponsorSessionDetail> sessions)?  $default,) {final _that = this;
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
  const _SponsorWithSessions({required this.sponsor, final  List<SponsorSessionDetail> sessions = const []}): _sessions = sessions;
  factory _SponsorWithSessions.fromJson(Map<String, dynamic> json) => _$SponsorWithSessionsFromJson(json);

@override final  CompanySponsorDetail sponsor;
 final  List<SponsorSessionDetail> _sessions;
@override@JsonKey() List<SponsorSessionDetail> get sessions {
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
 CompanySponsorDetail sponsor, List<SponsorSessionDetail> sessions
});


@override $CompanySponsorDetailCopyWith<$Res> get sponsor;

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
as CompanySponsorDetail,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SponsorSessionDetail>,
  ));
}

/// Create a copy of SponsorWithSessions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<$Res> get sponsor {
  
  return $CompanySponsorDetailCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// @nodoc
mixin _$SponsorSessionDetail {

 String get id; String get title; String get description;@RequiredDateTimeConverter() DateTime get startsAt;@RequiredDateTimeConverter() DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl; String? get url; List<Speakers> get speakers; SessionVenues? get venue;
/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSessionDetailCopyWith<SponsorSessionDetail> get copyWith => _$SponsorSessionDetailCopyWithImpl<SponsorSessionDetail>(this as SponsorSessionDetail, _$identity);

  /// Serializes this SponsorSessionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSessionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,url,const DeepCollectionEquality().hash(speakers),venue);

@override
String toString() {
  return 'SponsorSessionDetail(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, url: $url, speakers: $speakers, venue: $venue)';
}


}

/// @nodoc
abstract mixin class $SponsorSessionDetailCopyWith<$Res>  {
  factory $SponsorSessionDetailCopyWith(SponsorSessionDetail value, $Res Function(SponsorSessionDetail) _then) = _$SponsorSessionDetailCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, String? url, List<Speakers> speakers, SessionVenues? venue
});


$SessionVenuesCopyWith<$Res>? get venue;

}
/// @nodoc
class _$SponsorSessionDetailCopyWithImpl<$Res>
    implements $SponsorSessionDetailCopyWith<$Res> {
  _$SponsorSessionDetailCopyWithImpl(this._self, this._then);

  final SponsorSessionDetail _self;
  final $Res Function(SponsorSessionDetail) _then;

/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? url = freezed,Object? speakers = null,Object? venue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speakers>,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as SessionVenues?,
  ));
}
/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionVenuesCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $SessionVenuesCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorSessionDetail].
extension SponsorSessionDetailPatterns on SponsorSessionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSessionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSessionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSessionDetail value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSessionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSessionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSessionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url,  List<Speakers> speakers,  SessionVenues? venue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSessionDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.speakers,_that.venue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url,  List<Speakers> speakers,  SessionVenues? venue)  $default,) {final _that = this;
switch (_that) {
case _SponsorSessionDetail():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.speakers,_that.venue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url,  List<Speakers> speakers,  SessionVenues? venue)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSessionDetail() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.speakers,_that.venue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSessionDetail implements SponsorSessionDetail {
  const _SponsorSessionDetail({required this.id, required this.title, required this.description, @RequiredDateTimeConverter() required this.startsAt, @RequiredDateTimeConverter() required this.endsAt, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl, this.url, final  List<Speakers> speakers = const [], this.venue}): _speakers = speakers;
  factory _SponsorSessionDetail.fromJson(Map<String, dynamic> json) => _$SponsorSessionDetailFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@RequiredDateTimeConverter() final  DateTime startsAt;
@override@RequiredDateTimeConverter() final  DateTime endsAt;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;
@override final  String? url;
 final  List<Speakers> _speakers;
@override@JsonKey() List<Speakers> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  SessionVenues? venue;

/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSessionDetailCopyWith<_SponsorSessionDetail> get copyWith => __$SponsorSessionDetailCopyWithImpl<_SponsorSessionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSessionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSessionDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,url,const DeepCollectionEquality().hash(_speakers),venue);

@override
String toString() {
  return 'SponsorSessionDetail(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, url: $url, speakers: $speakers, venue: $venue)';
}


}

/// @nodoc
abstract mixin class _$SponsorSessionDetailCopyWith<$Res> implements $SponsorSessionDetailCopyWith<$Res> {
  factory _$SponsorSessionDetailCopyWith(_SponsorSessionDetail value, $Res Function(_SponsorSessionDetail) _then) = __$SponsorSessionDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, String? url, List<Speakers> speakers, SessionVenues? venue
});


@override $SessionVenuesCopyWith<$Res>? get venue;

}
/// @nodoc
class __$SponsorSessionDetailCopyWithImpl<$Res>
    implements _$SponsorSessionDetailCopyWith<$Res> {
  __$SponsorSessionDetailCopyWithImpl(this._self, this._then);

  final _SponsorSessionDetail _self;
  final $Res Function(_SponsorSessionDetail) _then;

/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? url = freezed,Object? speakers = null,Object? venue = freezed,}) {
  return _then(_SponsorSessionDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speakers>,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as SessionVenues?,
  ));
}

/// Create a copy of SponsorSessionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionVenuesCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $SessionVenuesCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}

// dart format on
