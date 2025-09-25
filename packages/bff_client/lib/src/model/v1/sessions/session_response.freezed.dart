// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionResponse {

 String get id; String get title; String get description; String get startsAt; String get endsAt; String get venueId; String get createdAt; int? get sponsorId; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl;
/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionResponseCopyWith<SessionResponse> get copyWith => _$SessionResponseCopyWithImpl<SessionResponse>(this as SessionResponse, _$identity);

  /// Serializes this SessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sponsorId, sponsorId) || other.sponsorId == sponsorId)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,venueId,createdAt,sponsorId,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl);

@override
String toString() {
  return 'SessionResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, createdAt: $createdAt, sponsorId: $sponsorId, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class $SessionResponseCopyWith<$Res>  {
  factory $SessionResponseCopyWith(SessionResponse value, $Res Function(SessionResponse) _then) = _$SessionResponseCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String startsAt, String endsAt, String venueId, String createdAt, int? sponsorId, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl
});




}
/// @nodoc
class _$SessionResponseCopyWithImpl<$Res>
    implements $SessionResponseCopyWith<$Res> {
  _$SessionResponseCopyWithImpl(this._self, this._then);

  final SessionResponse _self;
  final $Res Function(SessionResponse) _then;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? venueId = null,Object? createdAt = null,Object? sponsorId = freezed,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,sponsorId: freezed == sponsorId ? _self.sponsorId : sponsorId // ignore: cast_nullable_to_non_nullable
as int?,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionResponse].
extension SessionResponsePatterns on SessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String startsAt,  String endsAt,  String venueId,  String createdAt,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String startsAt,  String endsAt,  String venueId,  String createdAt,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl)  $default,) {final _that = this;
switch (_that) {
case _SessionResponse():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String startsAt,  String endsAt,  String venueId,  String createdAt,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl)?  $default,) {final _that = this;
switch (_that) {
case _SessionResponse() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionResponse implements SessionResponse {
  const _SessionResponse({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.venueId, required this.createdAt, this.sponsorId, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl});
  factory _SessionResponse.fromJson(Map<String, dynamic> json) => _$SessionResponseFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String startsAt;
@override final  String endsAt;
@override final  String venueId;
@override final  String createdAt;
@override final  int? sponsorId;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionResponseCopyWith<_SessionResponse> get copyWith => __$SessionResponseCopyWithImpl<_SessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sponsorId, sponsorId) || other.sponsorId == sponsorId)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,venueId,createdAt,sponsorId,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl);

@override
String toString() {
  return 'SessionResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, createdAt: $createdAt, sponsorId: $sponsorId, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class _$SessionResponseCopyWith<$Res> implements $SessionResponseCopyWith<$Res> {
  factory _$SessionResponseCopyWith(_SessionResponse value, $Res Function(_SessionResponse) _then) = __$SessionResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String startsAt, String endsAt, String venueId, String createdAt, int? sponsorId, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl
});




}
/// @nodoc
class __$SessionResponseCopyWithImpl<$Res>
    implements _$SessionResponseCopyWith<$Res> {
  __$SessionResponseCopyWithImpl(this._self, this._then);

  final _SessionResponse _self;
  final $Res Function(_SessionResponse) _then;

/// Create a copy of SessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? venueId = null,Object? createdAt = null,Object? sponsorId = freezed,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,}) {
  return _then(_SessionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,sponsorId: freezed == sponsorId ? _self.sponsorId : sponsorId // ignore: cast_nullable_to_non_nullable
as int?,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SessionsResponse {

 List<SessionResponse> get sessions;
/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsResponseCopyWith<SessionsResponse> get copyWith => _$SessionsResponseCopyWithImpl<SessionsResponse>(this as SessionsResponse, _$identity);

  /// Serializes this SessionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionsResponse&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'SessionsResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $SessionsResponseCopyWith<$Res>  {
  factory $SessionsResponseCopyWith(SessionsResponse value, $Res Function(SessionsResponse) _then) = _$SessionsResponseCopyWithImpl;
@useResult
$Res call({
 List<SessionResponse> sessions
});




}
/// @nodoc
class _$SessionsResponseCopyWithImpl<$Res>
    implements $SessionsResponseCopyWith<$Res> {
  _$SessionsResponseCopyWithImpl(this._self, this._then);

  final SessionsResponse _self;
  final $Res Function(SessionsResponse) _then;

/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionsResponse].
extension SessionsResponsePatterns on SessionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SessionResponse> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SessionResponse> sessions)  $default,) {final _that = this;
switch (_that) {
case _SessionsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SessionResponse> sessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionsResponse() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionsResponse implements SessionsResponse {
  const _SessionsResponse({final  List<SessionResponse> sessions = const []}): _sessions = sessions;
  factory _SessionsResponse.fromJson(Map<String, dynamic> json) => _$SessionsResponseFromJson(json);

 final  List<SessionResponse> _sessions;
@override@JsonKey() List<SessionResponse> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionsResponseCopyWith<_SessionsResponse> get copyWith => __$SessionsResponseCopyWithImpl<_SessionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionsResponse&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'SessionsResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$SessionsResponseCopyWith<$Res> implements $SessionsResponseCopyWith<$Res> {
  factory _$SessionsResponseCopyWith(_SessionsResponse value, $Res Function(_SessionsResponse) _then) = __$SessionsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SessionResponse> sessions
});




}
/// @nodoc
class __$SessionsResponseCopyWithImpl<$Res>
    implements _$SessionsResponseCopyWith<$Res> {
  __$SessionsResponseCopyWithImpl(this._self, this._then);

  final _SessionsResponse _self;
  final $Res Function(_SessionsResponse) _then;

/// Create a copy of SessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_SessionsResponse(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionResponse>,
  ));
}


}


/// @nodoc
mixin _$SpeakerResponse {

 String get id; String get name; String? get avatarUrl; String? get xId;
/// Create a copy of SpeakerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerResponseCopyWith<SpeakerResponse> get copyWith => _$SpeakerResponseCopyWithImpl<SpeakerResponse>(this as SpeakerResponse, _$identity);

  /// Serializes this SpeakerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,xId);

@override
String toString() {
  return 'SpeakerResponse(id: $id, name: $name, avatarUrl: $avatarUrl, xId: $xId)';
}


}

/// @nodoc
abstract mixin class $SpeakerResponseCopyWith<$Res>  {
  factory $SpeakerResponseCopyWith(SpeakerResponse value, $Res Function(SpeakerResponse) _then) = _$SpeakerResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarUrl, String? xId
});




}
/// @nodoc
class _$SpeakerResponseCopyWithImpl<$Res>
    implements $SpeakerResponseCopyWith<$Res> {
  _$SpeakerResponseCopyWithImpl(this._self, this._then);

  final SpeakerResponse _self;
  final $Res Function(SpeakerResponse) _then;

/// Create a copy of SpeakerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? xId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,xId: freezed == xId ? _self.xId : xId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeakerResponse].
extension SpeakerResponsePatterns on SpeakerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeakerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeakerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeakerResponse value)  $default,){
final _that = this;
switch (_that) {
case _SpeakerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeakerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SpeakerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String? xId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeakerResponse() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.xId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String? xId)  $default,) {final _that = this;
switch (_that) {
case _SpeakerResponse():
return $default(_that.id,_that.name,_that.avatarUrl,_that.xId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatarUrl,  String? xId)?  $default,) {final _that = this;
switch (_that) {
case _SpeakerResponse() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.xId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeakerResponse implements SpeakerResponse {
  const _SpeakerResponse({required this.id, required this.name, this.avatarUrl, this.xId});
  factory _SpeakerResponse.fromJson(Map<String, dynamic> json) => _$SpeakerResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? avatarUrl;
@override final  String? xId;

/// Create a copy of SpeakerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerResponseCopyWith<_SpeakerResponse> get copyWith => __$SpeakerResponseCopyWithImpl<_SpeakerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeakerResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,xId);

@override
String toString() {
  return 'SpeakerResponse(id: $id, name: $name, avatarUrl: $avatarUrl, xId: $xId)';
}


}

/// @nodoc
abstract mixin class _$SpeakerResponseCopyWith<$Res> implements $SpeakerResponseCopyWith<$Res> {
  factory _$SpeakerResponseCopyWith(_SpeakerResponse value, $Res Function(_SpeakerResponse) _then) = __$SpeakerResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarUrl, String? xId
});




}
/// @nodoc
class __$SpeakerResponseCopyWithImpl<$Res>
    implements _$SpeakerResponseCopyWith<$Res> {
  __$SpeakerResponseCopyWithImpl(this._self, this._then);

  final _SpeakerResponse _self;
  final $Res Function(_SpeakerResponse) _then;

/// Create a copy of SpeakerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? xId = freezed,}) {
  return _then(_SpeakerResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,xId: freezed == xId ? _self.xId : xId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SpeakersResponse {

 List<SpeakerResponse> get speakers;
/// Create a copy of SpeakersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakersResponseCopyWith<SpeakersResponse> get copyWith => _$SpeakersResponseCopyWithImpl<SpeakersResponse>(this as SpeakersResponse, _$identity);

  /// Serializes this SpeakersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakersResponse&&const DeepCollectionEquality().equals(other.speakers, speakers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(speakers));

@override
String toString() {
  return 'SpeakersResponse(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class $SpeakersResponseCopyWith<$Res>  {
  factory $SpeakersResponseCopyWith(SpeakersResponse value, $Res Function(SpeakersResponse) _then) = _$SpeakersResponseCopyWithImpl;
@useResult
$Res call({
 List<SpeakerResponse> speakers
});




}
/// @nodoc
class _$SpeakersResponseCopyWithImpl<$Res>
    implements $SpeakersResponseCopyWith<$Res> {
  _$SpeakersResponseCopyWithImpl(this._self, this._then);

  final SpeakersResponse _self;
  final $Res Function(SpeakersResponse) _then;

/// Create a copy of SpeakersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speakers = null,}) {
  return _then(_self.copyWith(
speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeakersResponse].
extension SpeakersResponsePatterns on SpeakersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeakersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeakersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeakersResponse value)  $default,){
final _that = this;
switch (_that) {
case _SpeakersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeakersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SpeakersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SpeakerResponse> speakers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeakersResponse() when $default != null:
return $default(_that.speakers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SpeakerResponse> speakers)  $default,) {final _that = this;
switch (_that) {
case _SpeakersResponse():
return $default(_that.speakers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SpeakerResponse> speakers)?  $default,) {final _that = this;
switch (_that) {
case _SpeakersResponse() when $default != null:
return $default(_that.speakers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeakersResponse implements SpeakersResponse {
  const _SpeakersResponse({final  List<SpeakerResponse> speakers = const []}): _speakers = speakers;
  factory _SpeakersResponse.fromJson(Map<String, dynamic> json) => _$SpeakersResponseFromJson(json);

 final  List<SpeakerResponse> _speakers;
@override@JsonKey() List<SpeakerResponse> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}


/// Create a copy of SpeakersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakersResponseCopyWith<_SpeakersResponse> get copyWith => __$SpeakersResponseCopyWithImpl<_SpeakersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeakersResponse&&const DeepCollectionEquality().equals(other._speakers, _speakers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_speakers));

@override
String toString() {
  return 'SpeakersResponse(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class _$SpeakersResponseCopyWith<$Res> implements $SpeakersResponseCopyWith<$Res> {
  factory _$SpeakersResponseCopyWith(_SpeakersResponse value, $Res Function(_SpeakersResponse) _then) = __$SpeakersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SpeakerResponse> speakers
});




}
/// @nodoc
class __$SpeakersResponseCopyWithImpl<$Res>
    implements _$SpeakersResponseCopyWith<$Res> {
  __$SpeakersResponseCopyWithImpl(this._self, this._then);

  final _SpeakersResponse _self;
  final $Res Function(_SpeakersResponse) _then;

/// Create a copy of SpeakersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speakers = null,}) {
  return _then(_SpeakersResponse(
speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,
  ));
}


}


/// @nodoc
mixin _$SessionWithDetailsResponse {

 String get id; String get title; String get description; String get startsAt; String get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl; List<SpeakerResponse> get speakers; dynamic get sponsor;
/// Create a copy of SessionWithDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionWithDetailsResponseCopyWith<SessionWithDetailsResponse> get copyWith => _$SessionWithDetailsResponseCopyWithImpl<SessionWithDetailsResponse>(this as SessionWithDetailsResponse, _$identity);

  /// Serializes this SessionWithDetailsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionWithDetailsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&const DeepCollectionEquality().equals(other.sponsor, sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(speakers),const DeepCollectionEquality().hash(sponsor));

@override
String toString() {
  return 'SessionWithDetailsResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionWithDetailsResponseCopyWith<$Res>  {
  factory $SessionWithDetailsResponseCopyWith(SessionWithDetailsResponse value, $Res Function(SessionWithDetailsResponse) _then) = _$SessionWithDetailsResponseCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String startsAt, String endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<SpeakerResponse> speakers, dynamic sponsor
});




}
/// @nodoc
class _$SessionWithDetailsResponseCopyWithImpl<$Res>
    implements $SessionWithDetailsResponseCopyWith<$Res> {
  _$SessionWithDetailsResponseCopyWithImpl(this._self, this._then);

  final SessionWithDetailsResponse _self;
  final $Res Function(SessionWithDetailsResponse) _then;

/// Create a copy of SessionWithDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionWithDetailsResponse].
extension SessionWithDetailsResponsePatterns on SessionWithDetailsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionWithDetailsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionWithDetailsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionWithDetailsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionWithDetailsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionWithDetailsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionWithDetailsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionWithDetailsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)  $default,) {final _that = this;
switch (_that) {
case _SessionWithDetailsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)?  $default,) {final _that = this;
switch (_that) {
case _SessionWithDetailsResponse() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionWithDetailsResponse implements SessionWithDetailsResponse {
  const _SessionWithDetailsResponse({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl, final  List<SpeakerResponse> speakers = const [], this.sponsor}): _speakers = speakers;
  factory _SessionWithDetailsResponse.fromJson(Map<String, dynamic> json) => _$SessionWithDetailsResponseFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String startsAt;
@override final  String endsAt;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;
 final  List<SpeakerResponse> _speakers;
@override@JsonKey() List<SpeakerResponse> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  dynamic sponsor;

/// Create a copy of SessionWithDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionWithDetailsResponseCopyWith<_SessionWithDetailsResponse> get copyWith => __$SessionWithDetailsResponseCopyWithImpl<_SessionWithDetailsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionWithDetailsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionWithDetailsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&const DeepCollectionEquality().equals(other.sponsor, sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(_speakers),const DeepCollectionEquality().hash(sponsor));

@override
String toString() {
  return 'SessionWithDetailsResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionWithDetailsResponseCopyWith<$Res> implements $SessionWithDetailsResponseCopyWith<$Res> {
  factory _$SessionWithDetailsResponseCopyWith(_SessionWithDetailsResponse value, $Res Function(_SessionWithDetailsResponse) _then) = __$SessionWithDetailsResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String startsAt, String endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<SpeakerResponse> speakers, dynamic sponsor
});




}
/// @nodoc
class __$SessionWithDetailsResponseCopyWithImpl<$Res>
    implements _$SessionWithDetailsResponseCopyWith<$Res> {
  __$SessionWithDetailsResponseCopyWithImpl(this._self, this._then);

  final _SessionWithDetailsResponse _self;
  final $Res Function(_SessionWithDetailsResponse) _then;

/// Create a copy of SessionWithDetailsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
  return _then(_SessionWithDetailsResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$VenueWithSessionsResponse {

 String get id; String get name; List<SessionWithDetailsResponse> get sessions;
/// Create a copy of VenueWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenueWithSessionsResponseCopyWith<VenueWithSessionsResponse> get copyWith => _$VenueWithSessionsResponseCopyWithImpl<VenueWithSessionsResponse>(this as VenueWithSessionsResponse, _$identity);

  /// Serializes this VenueWithSessionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VenueWithSessionsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'VenueWithSessionsResponse(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $VenueWithSessionsResponseCopyWith<$Res>  {
  factory $VenueWithSessionsResponseCopyWith(VenueWithSessionsResponse value, $Res Function(VenueWithSessionsResponse) _then) = _$VenueWithSessionsResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<SessionWithDetailsResponse> sessions
});




}
/// @nodoc
class _$VenueWithSessionsResponseCopyWithImpl<$Res>
    implements $VenueWithSessionsResponseCopyWith<$Res> {
  _$VenueWithSessionsResponseCopyWithImpl(this._self, this._then);

  final VenueWithSessionsResponse _self;
  final $Res Function(VenueWithSessionsResponse) _then;

/// Create a copy of VenueWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithDetailsResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [VenueWithSessionsResponse].
extension VenueWithSessionsResponsePatterns on VenueWithSessionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VenueWithSessionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VenueWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VenueWithSessionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _VenueWithSessionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VenueWithSessionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VenueWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithDetailsResponse> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VenueWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<SessionWithDetailsResponse> sessions)  $default,) {final _that = this;
switch (_that) {
case _VenueWithSessionsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<SessionWithDetailsResponse> sessions)?  $default,) {final _that = this;
switch (_that) {
case _VenueWithSessionsResponse() when $default != null:
return $default(_that.id,_that.name,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VenueWithSessionsResponse implements VenueWithSessionsResponse {
  const _VenueWithSessionsResponse({required this.id, required this.name, final  List<SessionWithDetailsResponse> sessions = const []}): _sessions = sessions;
  factory _VenueWithSessionsResponse.fromJson(Map<String, dynamic> json) => _$VenueWithSessionsResponseFromJson(json);

@override final  String id;
@override final  String name;
 final  List<SessionWithDetailsResponse> _sessions;
@override@JsonKey() List<SessionWithDetailsResponse> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of VenueWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenueWithSessionsResponseCopyWith<_VenueWithSessionsResponse> get copyWith => __$VenueWithSessionsResponseCopyWithImpl<_VenueWithSessionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenueWithSessionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VenueWithSessionsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'VenueWithSessionsResponse(id: $id, name: $name, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$VenueWithSessionsResponseCopyWith<$Res> implements $VenueWithSessionsResponseCopyWith<$Res> {
  factory _$VenueWithSessionsResponseCopyWith(_VenueWithSessionsResponse value, $Res Function(_VenueWithSessionsResponse) _then) = __$VenueWithSessionsResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<SessionWithDetailsResponse> sessions
});




}
/// @nodoc
class __$VenueWithSessionsResponseCopyWithImpl<$Res>
    implements _$VenueWithSessionsResponseCopyWith<$Res> {
  __$VenueWithSessionsResponseCopyWithImpl(this._self, this._then);

  final _VenueWithSessionsResponse _self;
  final $Res Function(_VenueWithSessionsResponse) _then;

/// Create a copy of VenueWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sessions = null,}) {
  return _then(_VenueWithSessionsResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionWithDetailsResponse>,
  ));
}


}


/// @nodoc
mixin _$VenuesWithSessionsResponse {

 List<VenueWithSessionsResponse> get venues;
/// Create a copy of VenuesWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenuesWithSessionsResponseCopyWith<VenuesWithSessionsResponse> get copyWith => _$VenuesWithSessionsResponseCopyWithImpl<VenuesWithSessionsResponse>(this as VenuesWithSessionsResponse, _$identity);

  /// Serializes this VenuesWithSessionsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VenuesWithSessionsResponse&&const DeepCollectionEquality().equals(other.venues, venues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(venues));

@override
String toString() {
  return 'VenuesWithSessionsResponse(venues: $venues)';
}


}

/// @nodoc
abstract mixin class $VenuesWithSessionsResponseCopyWith<$Res>  {
  factory $VenuesWithSessionsResponseCopyWith(VenuesWithSessionsResponse value, $Res Function(VenuesWithSessionsResponse) _then) = _$VenuesWithSessionsResponseCopyWithImpl;
@useResult
$Res call({
 List<VenueWithSessionsResponse> venues
});




}
/// @nodoc
class _$VenuesWithSessionsResponseCopyWithImpl<$Res>
    implements $VenuesWithSessionsResponseCopyWith<$Res> {
  _$VenuesWithSessionsResponseCopyWithImpl(this._self, this._then);

  final VenuesWithSessionsResponse _self;
  final $Res Function(VenuesWithSessionsResponse) _then;

/// Create a copy of VenuesWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? venues = null,}) {
  return _then(_self.copyWith(
venues: null == venues ? _self.venues : venues // ignore: cast_nullable_to_non_nullable
as List<VenueWithSessionsResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [VenuesWithSessionsResponse].
extension VenuesWithSessionsResponsePatterns on VenuesWithSessionsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VenuesWithSessionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VenuesWithSessionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VenuesWithSessionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VenueWithSessionsResponse> venues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VenueWithSessionsResponse> venues)  $default,) {final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VenueWithSessionsResponse> venues)?  $default,) {final _that = this;
switch (_that) {
case _VenuesWithSessionsResponse() when $default != null:
return $default(_that.venues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VenuesWithSessionsResponse implements VenuesWithSessionsResponse {
  const _VenuesWithSessionsResponse({final  List<VenueWithSessionsResponse> venues = const []}): _venues = venues;
  factory _VenuesWithSessionsResponse.fromJson(Map<String, dynamic> json) => _$VenuesWithSessionsResponseFromJson(json);

 final  List<VenueWithSessionsResponse> _venues;
@override@JsonKey() List<VenueWithSessionsResponse> get venues {
  if (_venues is EqualUnmodifiableListView) return _venues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_venues);
}


/// Create a copy of VenuesWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenuesWithSessionsResponseCopyWith<_VenuesWithSessionsResponse> get copyWith => __$VenuesWithSessionsResponseCopyWithImpl<_VenuesWithSessionsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenuesWithSessionsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VenuesWithSessionsResponse&&const DeepCollectionEquality().equals(other._venues, _venues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_venues));

@override
String toString() {
  return 'VenuesWithSessionsResponse(venues: $venues)';
}


}

/// @nodoc
abstract mixin class _$VenuesWithSessionsResponseCopyWith<$Res> implements $VenuesWithSessionsResponseCopyWith<$Res> {
  factory _$VenuesWithSessionsResponseCopyWith(_VenuesWithSessionsResponse value, $Res Function(_VenuesWithSessionsResponse) _then) = __$VenuesWithSessionsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<VenueWithSessionsResponse> venues
});




}
/// @nodoc
class __$VenuesWithSessionsResponseCopyWithImpl<$Res>
    implements _$VenuesWithSessionsResponseCopyWith<$Res> {
  __$VenuesWithSessionsResponseCopyWithImpl(this._self, this._then);

  final _VenuesWithSessionsResponse _self;
  final $Res Function(_VenuesWithSessionsResponse) _then;

/// Create a copy of VenuesWithSessionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? venues = null,}) {
  return _then(_VenuesWithSessionsResponse(
venues: null == venues ? _self._venues : venues // ignore: cast_nullable_to_non_nullable
as List<VenueWithSessionsResponse>,
  ));
}


}


/// @nodoc
mixin _$SessionScheduleItemResponse {

 String get venue; String get venueId; String get id; String get title; String get description; String get startsAt; String get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl; List<SpeakerResponse> get speakers; dynamic get sponsor;
/// Create a copy of SessionScheduleItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionScheduleItemResponseCopyWith<SessionScheduleItemResponse> get copyWith => _$SessionScheduleItemResponseCopyWithImpl<SessionScheduleItemResponse>(this as SessionScheduleItemResponse, _$identity);

  /// Serializes this SessionScheduleItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionScheduleItemResponse&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&const DeepCollectionEquality().equals(other.sponsor, sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(speakers),const DeepCollectionEquality().hash(sponsor));

@override
String toString() {
  return 'SessionScheduleItemResponse(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionScheduleItemResponseCopyWith<$Res>  {
  factory $SessionScheduleItemResponseCopyWith(SessionScheduleItemResponse value, $Res Function(SessionScheduleItemResponse) _then) = _$SessionScheduleItemResponseCopyWithImpl;
@useResult
$Res call({
 String venue, String venueId, String id, String title, String description, String startsAt, String endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<SpeakerResponse> speakers, dynamic sponsor
});




}
/// @nodoc
class _$SessionScheduleItemResponseCopyWithImpl<$Res>
    implements $SessionScheduleItemResponseCopyWith<$Res> {
  _$SessionScheduleItemResponseCopyWithImpl(this._self, this._then);

  final SessionScheduleItemResponse _self;
  final $Res Function(SessionScheduleItemResponse) _then;

/// Create a copy of SessionScheduleItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
  return _then(_self.copyWith(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionScheduleItemResponse].
extension SessionScheduleItemResponsePatterns on SessionScheduleItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionScheduleItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionScheduleItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionScheduleItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionScheduleItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionScheduleItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionScheduleItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionScheduleItemResponse() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String venue,  String venueId,  String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)  $default,) {final _that = this;
switch (_that) {
case _SessionScheduleItemResponse():
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String venue,  String venueId,  String id,  String title,  String description,  String startsAt,  String endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  List<SpeakerResponse> speakers,  dynamic sponsor)?  $default,) {final _that = this;
switch (_that) {
case _SessionScheduleItemResponse() when $default != null:
return $default(_that.venue,_that.venueId,_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.speakers,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionScheduleItemResponse implements SessionScheduleItemResponse {
  const _SessionScheduleItemResponse({required this.venue, required this.venueId, required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl, final  List<SpeakerResponse> speakers = const [], this.sponsor}): _speakers = speakers;
  factory _SessionScheduleItemResponse.fromJson(Map<String, dynamic> json) => _$SessionScheduleItemResponseFromJson(json);

@override final  String venue;
@override final  String venueId;
@override final  String id;
@override final  String title;
@override final  String description;
@override final  String startsAt;
@override final  String endsAt;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;
 final  List<SpeakerResponse> _speakers;
@override@JsonKey() List<SpeakerResponse> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}

@override final  dynamic sponsor;

/// Create a copy of SessionScheduleItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionScheduleItemResponseCopyWith<_SessionScheduleItemResponse> get copyWith => __$SessionScheduleItemResponseCopyWithImpl<_SessionScheduleItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionScheduleItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionScheduleItemResponse&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&const DeepCollectionEquality().equals(other.sponsor, sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,venue,venueId,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,const DeepCollectionEquality().hash(_speakers),const DeepCollectionEquality().hash(sponsor));

@override
String toString() {
  return 'SessionScheduleItemResponse(venue: $venue, venueId: $venueId, id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, speakers: $speakers, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionScheduleItemResponseCopyWith<$Res> implements $SessionScheduleItemResponseCopyWith<$Res> {
  factory _$SessionScheduleItemResponseCopyWith(_SessionScheduleItemResponse value, $Res Function(_SessionScheduleItemResponse) _then) = __$SessionScheduleItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String venue, String venueId, String id, String title, String description, String startsAt, String endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, List<SpeakerResponse> speakers, dynamic sponsor
});




}
/// @nodoc
class __$SessionScheduleItemResponseCopyWithImpl<$Res>
    implements _$SessionScheduleItemResponseCopyWith<$Res> {
  __$SessionScheduleItemResponseCopyWithImpl(this._self, this._then);

  final _SessionScheduleItemResponse _self;
  final $Res Function(_SessionScheduleItemResponse) _then;

/// Create a copy of SessionScheduleItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? venue = null,Object? venueId = null,Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? speakers = null,Object? sponsor = freezed,}) {
  return _then(_SessionScheduleItemResponse(
venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<SpeakerResponse>,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$SessionScheduleResponse {

 Map<String, List<SessionScheduleItemResponse>> get schedule;
/// Create a copy of SessionScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionScheduleResponseCopyWith<SessionScheduleResponse> get copyWith => _$SessionScheduleResponseCopyWithImpl<SessionScheduleResponse>(this as SessionScheduleResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionScheduleResponse&&const DeepCollectionEquality().equals(other.schedule, schedule));
}


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
 Map<String, List<SessionScheduleItemResponse>> schedule
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
as Map<String, List<SessionScheduleItemResponse>>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, List<SessionScheduleItemResponse>> schedule)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, List<SessionScheduleItemResponse>> schedule)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, List<SessionScheduleItemResponse>> schedule)?  $default,) {final _that = this;
switch (_that) {
case _SessionScheduleResponse() when $default != null:
return $default(_that.schedule);case _:
  return null;

}
}

}

/// @nodoc


class _SessionScheduleResponse implements SessionScheduleResponse {
  const _SessionScheduleResponse({final  Map<String, List<SessionScheduleItemResponse>> schedule = const <String, List<SessionScheduleItemResponse>>{}}): _schedule = schedule;
  

 final  Map<String, List<SessionScheduleItemResponse>> _schedule;
@override@JsonKey() Map<String, List<SessionScheduleItemResponse>> get schedule {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionScheduleResponse&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}


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
 Map<String, List<SessionScheduleItemResponse>> schedule
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
as Map<String, List<SessionScheduleItemResponse>>,
  ));
}


}

// dart format on
