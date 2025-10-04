// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_venues_with_sessions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionVenuesWithSessions {

 String get id; String get name; List<SessionWithDetails> get sessions;
/// Create a copy of SessionVenuesWithSessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionVenuesWithSessionsCopyWith<SessionVenuesWithSessions> get copyWith => _$SessionVenuesWithSessionsCopyWithImpl<SessionVenuesWithSessions>(this as SessionVenuesWithSessions, _$identity);

  /// Serializes this SessionVenuesWithSessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionVenuesWithSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'SessionVenuesWithSessions(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionVenuesWithSessionsCopyWith<$Res>  {
  factory $SessionVenuesWithSessionsCopyWith(SessionVenuesWithSessions value, $Res Function(SessionVenuesWithSessions) _then) = _$SessionVenuesWithSessionsCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SessionWithDetails> sessions
});




}
/// @nodoc
class _$SessionVenuesWithSessionsCopyWithImpl<$Res>
    implements $SessionVenuesWithSessionsCopyWith<$Res> {
  _$SessionVenuesWithSessionsCopyWithImpl(this._self, this._then);

  final SessionVenuesWithSessions _self;
  final $Res Function(SessionVenuesWithSessions) _then;

/// Create a copy of SessionVenuesWithSessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithDetails>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionVenuesWithSessions].
extension SessionVenuesWithSessionsPatterns on SessionVenuesWithSessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionVenuesWithSessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionVenuesWithSessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionVenuesWithSessions value)  $default,){
final _that = this;
switch (_that) {
case _SessionVenuesWithSessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionVenuesWithSessions value)?  $default,){
final _that = this;
switch (_that) {
case _SessionVenuesWithSessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithDetails> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionVenuesWithSessions() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithDetails> sessions)  $default,) {final _that = this;
switch (_that) {
case _SessionVenuesWithSessions():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SessionWithDetails> sessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionVenuesWithSessions() when $default != null:
return $default(_that.id,_that.name,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionVenuesWithSessions implements SessionVenuesWithSessions {
  const _SessionVenuesWithSessions({required this.id, required this.name, final  List<SessionWithDetails> sessions = const []}): _sessions = sessions;
  factory _SessionVenuesWithSessions.fromJson(Map<String, dynamic> json) => _$SessionVenuesWithSessionsFromJson(json);

@override final  String id;
@override final  String name;
 final  List<SessionWithDetails> _sessions;
@override@JsonKey() List<SessionWithDetails> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SessionVenuesWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionVenuesWithSessionsCopyWith<_SessionVenuesWithSessions> get copyWith => __$SessionVenuesWithSessionsCopyWithImpl<_SessionVenuesWithSessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionVenuesWithSessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionVenuesWithSessions&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionVenuesWithSessions(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SessionVenuesWithSessionsCopyWith<$Res> implements $SessionVenuesWithSessionsCopyWith<$Res> {
  factory _$SessionVenuesWithSessionsCopyWith(_SessionVenuesWithSessions value, $Res Function(_SessionVenuesWithSessions) _then) = __$SessionVenuesWithSessionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SessionWithDetails> sessions
});




}
/// @nodoc
class __$SessionVenuesWithSessionsCopyWithImpl<$Res>
    implements _$SessionVenuesWithSessionsCopyWith<$Res> {
  __$SessionVenuesWithSessionsCopyWithImpl(this._self, this._then);

  final _SessionVenuesWithSessions _self;
  final $Res Function(_SessionVenuesWithSessions) _then;

/// Create a copy of SessionVenuesWithSessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_SessionVenuesWithSessions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithDetails>,
  ));
}


}


/// @nodoc
mixin _$SessionWithDetails {

 String get id; String get title; String get description;@RequiredDateTimeConverter() DateTime get startsAt;@RequiredDateTimeConverter() DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl; List<Speakers> get speakers; CompanySponsorDetail? get sponsor;
/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionWithDetailsCopyWith<SessionWithDetails> get copyWith => _$SessionWithDetailsCopyWithImpl<SessionWithDetails>(this as SessionWithDetails, _$identity);

  /// Serializes this SessionWithDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionWithDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(speakers),sponsor);

@override
String toString() {
  return 'SessionWithDetails(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionWithDetailsCopyWith<$Res>  {
  factory $SessionWithDetailsCopyWith(SessionWithDetails value, $Res Function(SessionWithDetails) _then) = _$SessionWithDetailsCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<Speakers> speakers, CompanySponsorDetail? sponsor
});


$CompanySponsorDetailCopyWith<$Res>? get sponsor;

}
/// @nodoc
class _$SessionWithDetailsCopyWithImpl<$Res>
    implements $SessionWithDetailsCopyWith<$Res> {
  _$SessionWithDetailsCopyWithImpl(this._self, this._then);

  final SessionWithDetails _self;
  final $Res Function(SessionWithDetails) _then;

/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
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
as String?,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speakers>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as CompanySponsorDetail?,
  ));
}
/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $CompanySponsorDetailCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionWithDetails].
extension SessionWithDetailsPatterns on SessionWithDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionWithDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionWithDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionWithDetails value)  $default,){
final _that = this;
switch (_that) {
case _SessionWithDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionWithDetails value)?  $default,){
final _that = this;
switch (_that) {
case _SessionWithDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<Speakers> speakers,  CompanySponsorDetail? sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionWithDetails() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<Speakers> speakers,  CompanySponsorDetail? sponsor)  $default,) {final _that = this;
switch (_that) {
case _SessionWithDetails():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<Speakers> speakers,  CompanySponsorDetail? sponsor)?  $default,) {final _that = this;
switch (_that) {
case _SessionWithDetails() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionWithDetails implements SessionWithDetails {
  const _SessionWithDetails({required this.id, required this.title, required this.description, @RequiredDateTimeConverter() required this.startsAt, @RequiredDateTimeConverter() required this.endsAt, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl, final  List<Speakers> speakers = const [], this.sponsor}): _speakers = speakers;
  factory _SessionWithDetails.fromJson(Map<String, dynamic> json) => _$SessionWithDetailsFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@RequiredDateTimeConverter() final  DateTime startsAt;
@override@RequiredDateTimeConverter() final  DateTime endsAt;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;
 final  List<Speakers> _speakers;
@override@JsonKey() List<Speakers> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  CompanySponsorDetail? sponsor;

/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionWithDetailsCopyWith<_SessionWithDetails> get copyWith => __$SessionWithDetailsCopyWithImpl<_SessionWithDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionWithDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionWithDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(_speakers),sponsor);

@override
String toString() {
  return 'SessionWithDetails(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionWithDetailsCopyWith<$Res> implements $SessionWithDetailsCopyWith<$Res> {
  factory _$SessionWithDetailsCopyWith(_SessionWithDetails value, $Res Function(_SessionWithDetails) _then) = __$SessionWithDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<Speakers> speakers, CompanySponsorDetail? sponsor
});


@override $CompanySponsorDetailCopyWith<$Res>? get sponsor;

}
/// @nodoc
class __$SessionWithDetailsCopyWithImpl<$Res>
    implements _$SessionWithDetailsCopyWith<$Res> {
  __$SessionWithDetailsCopyWithImpl(this._self, this._then);

  final _SessionWithDetails _self;
  final $Res Function(_SessionWithDetails) _then;

/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
  return _then(_SessionWithDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speakers>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as CompanySponsorDetail?,
  ));
}

/// Create a copy of SessionWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $CompanySponsorDetailCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}

// dart format on
