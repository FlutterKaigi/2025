// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionDetailResponse {

 String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; List<Speaker> get speakers; String? get videoUrl; Sponsor? get sponsor;
/// Create a copy of SessionDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDetailResponseCopyWith<SessionDetailResponse> get copyWith => _$SessionDetailResponseCopyWithImpl<SessionDetailResponse>(this as SessionDetailResponse, _$identity);

  /// Serializes this SessionDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(speakers),videoUrl,sponsor);

@override
String toString() {
  return 'SessionDetailResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionDetailResponseCopyWith<$Res>  {
  factory $SessionDetailResponseCopyWith(SessionDetailResponse value, $Res Function(SessionDetailResponse) _then) = _$SessionDetailResponseCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Sponsor? sponsor
});


$SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class _$SessionDetailResponseCopyWithImpl<$Res>
    implements $SessionDetailResponseCopyWith<$Res> {
  _$SessionDetailResponseCopyWithImpl(this._self, this._then);

  final SessionDetailResponse _self;
  final $Res Function(SessionDetailResponse) _then;

/// Create a copy of SessionDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? sponsor = freezed,}) {
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
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}
/// Create a copy of SessionDetailResponse
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


/// Adds pattern-matching-related methods to [SessionDetailResponse].
extension SessionDetailResponsePatterns on SessionDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Sponsor? sponsor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDetailResponse() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.sponsor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Sponsor? sponsor)  $default,) {final _that = this;
switch (_that) {
case _SessionDetailResponse():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.sponsor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  List<Speaker> speakers,  String? videoUrl,  Sponsor? sponsor)?  $default,) {final _that = this;
switch (_that) {
case _SessionDetailResponse() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDetailResponse implements SessionDetailResponse {
  const _SessionDetailResponse({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.isLightningTalk, required this.isBeginnersLightningTalk, required this.isHandsOn, required final  List<Speaker> speakers, this.videoUrl, this.sponsor}): _speakers = speakers;
  factory _SessionDetailResponse.fromJson(Map<String, dynamic> json) => _$SessionDetailResponseFromJson(json);

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
@override final  Sponsor? sponsor;

/// Create a copy of SessionDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDetailResponseCopyWith<_SessionDetailResponse> get copyWith => __$SessionDetailResponseCopyWithImpl<_SessionDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(_speakers),videoUrl,sponsor);

@override
String toString() {
  return 'SessionDetailResponse(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionDetailResponseCopyWith<$Res> implements $SessionDetailResponseCopyWith<$Res> {
  factory _$SessionDetailResponseCopyWith(_SessionDetailResponse value, $Res Function(_SessionDetailResponse) _then) = __$SessionDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Sponsor? sponsor
});


@override $SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class __$SessionDetailResponseCopyWithImpl<$Res>
    implements _$SessionDetailResponseCopyWith<$Res> {
  __$SessionDetailResponseCopyWithImpl(this._self, this._then);

  final _SessionDetailResponse _self;
  final $Res Function(_SessionDetailResponse) _then;

/// Create a copy of SessionDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? sponsor = freezed,}) {
  return _then(_SessionDetailResponse(
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
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor?,
  ));
}

/// Create a copy of SessionDetailResponse
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
