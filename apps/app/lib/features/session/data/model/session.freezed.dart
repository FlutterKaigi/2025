// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Session {

 String get venue; String get venueId; String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; List<SessionType> get types; List<Speaker> get speakers; String? get videoUrl; String? get url; Sponsor? get sponsor;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(speakers),videoUrl,url,sponsor);

@override
String toString() {
  return 'Session(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, types: $types, speakers: $speakers, videoUrl: $videoUrl, url: $url, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String venue, String venueId, String id, String title, String description, DateTime startsAt, DateTime endsAt, List<SessionType> types, List<Speaker> speakers, String? videoUrl, String? url, Sponsor? sponsor
});


$SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? types = null,Object? speakers = null,Object? videoUrl = freezed,Object? url = freezed,Object? sponsor = freezed,}) {
  return _then(_self.copyWith(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<SessionType>,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}
/// Create a copy of Session
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


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  List<SessionType> types,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.types,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  List<SessionType> types,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.types,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String venue,  String venueId,  String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  List<SessionType> types,  List<Speaker> speakers,  String? videoUrl,  String? url,  Sponsor? sponsor)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.types,_that.speakers,_that.videoUrl,_that.url,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session implements Session {
  const _Session({required this.venue, required this.venueId, required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required final  List<SessionType> types, required final  List<Speaker> speakers, this.videoUrl, this.url, this.sponsor}): _types = types,_speakers = speakers;
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String venue;
@override final  String venueId;
@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
 final  List<SessionType> _types;
@override List<SessionType> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<Speaker> _speakers;
@override List<Speaker> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  String? videoUrl;
@override final  String? url;
@override final  Sponsor? sponsor;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_speakers),videoUrl,url,sponsor);

@override
String toString() {
  return 'Session(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, types: $types, speakers: $speakers, videoUrl: $videoUrl, url: $url, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String venue, String venueId, String id, String title, String description, DateTime startsAt, DateTime endsAt, List<SessionType> types, List<Speaker> speakers, String? videoUrl, String? url, Sponsor? sponsor
});


@override $SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? types = null,Object? speakers = null,Object? videoUrl = freezed,Object? url = freezed,Object? sponsor = freezed,}) {
  return _then(_Session(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<SessionType>,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}

/// Create a copy of Session
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
