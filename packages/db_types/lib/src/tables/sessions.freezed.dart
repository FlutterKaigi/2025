// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sessions {

 String get id; String get title; String get description;@RequiredDateTimeConverter() DateTime get startsAt;@RequiredDateTimeConverter() DateTime get endsAt; String get venueId; int? get sponsorId; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; String? get videoUrl; String? get url;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionsCopyWith<Sessions> get copyWith => _$SessionsCopyWithImpl<Sessions>(this as Sessions, _$identity);

  /// Serializes this Sessions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sessions&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.sponsorId, sponsorId) || other.sponsorId == sponsorId)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,venueId,sponsorId,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,url,createdAt);

@override
String toString() {
  return 'Sessions(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, sponsorId: $sponsorId, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, url: $url, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SessionsCopyWith<$Res>  {
  factory $SessionsCopyWith(Sessions value, $Res Function(Sessions) _then) = _$SessionsCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, String venueId, int? sponsorId, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, String? url,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SessionsCopyWithImpl<$Res>
    implements $SessionsCopyWith<$Res> {
  _$SessionsCopyWithImpl(this._self, this._then);

  final Sessions _self;
  final $Res Function(Sessions) _then;

/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? venueId = null,Object? sponsorId = freezed,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? url = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,sponsorId: freezed == sponsorId ? _self.sponsorId : sponsorId // ignore: cast_nullable_to_non_nullable
as int?,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sessions].
extension SessionsPatterns on Sessions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sessions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sessions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sessions value)  $default,){
final _that = this;
switch (_that) {
case _Sessions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sessions value)?  $default,){
final _that = this;
switch (_that) {
case _Sessions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  String venueId,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sessions() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  String venueId,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Sessions():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @RequiredDateTimeConverter()  DateTime startsAt, @RequiredDateTimeConverter()  DateTime endsAt,  String venueId,  int? sponsorId,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  String? videoUrl,  String? url, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Sessions() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.venueId,_that.sponsorId,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.videoUrl,_that.url,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sessions implements Sessions {
  const _Sessions({required this.id, required this.title, required this.description, @RequiredDateTimeConverter() required this.startsAt, @RequiredDateTimeConverter() required this.endsAt, required this.venueId, this.sponsorId, this.isLightningTalk = false, this.isBeginnersLightningTalk = false, this.isHandsOn = false, this.videoUrl, this.url, @RequiredDateTimeConverter() required this.createdAt});
  factory _Sessions.fromJson(Map<String, dynamic> json) => _$SessionsFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@RequiredDateTimeConverter() final  DateTime startsAt;
@override@RequiredDateTimeConverter() final  DateTime endsAt;
@override final  String venueId;
@override final  int? sponsorId;
@override@JsonKey() final  bool isLightningTalk;
@override@JsonKey() final  bool isBeginnersLightningTalk;
@override@JsonKey() final  bool isHandsOn;
@override final  String? videoUrl;
@override final  String? url;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionsCopyWith<_Sessions> get copyWith => __$SessionsCopyWithImpl<_Sessions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sessions&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.sponsorId, sponsorId) || other.sponsorId == sponsorId)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,venueId,sponsorId,isLightningTalk,isBeginnersLightningTalk,isHandsOn,videoUrl,url,createdAt);

@override
String toString() {
  return 'Sessions(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, sponsorId: $sponsorId, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, videoUrl: $videoUrl, url: $url, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SessionsCopyWith<$Res> implements $SessionsCopyWith<$Res> {
  factory _$SessionsCopyWith(_Sessions value, $Res Function(_Sessions) _then) = __$SessionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@RequiredDateTimeConverter() DateTime startsAt,@RequiredDateTimeConverter() DateTime endsAt, String venueId, int? sponsorId, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, String? videoUrl, String? url,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SessionsCopyWithImpl<$Res>
    implements _$SessionsCopyWith<$Res> {
  __$SessionsCopyWithImpl(this._self, this._then);

  final _Sessions _self;
  final $Res Function(_Sessions) _then;

/// Create a copy of Sessions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? venueId = null,Object? sponsorId = freezed,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? videoUrl = freezed,Object? url = freezed,Object? createdAt = null,}) {
  return _then(_Sessions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,sponsorId: freezed == sponsorId ? _self.sponsorId : sponsorId // ignore: cast_nullable_to_non_nullable
as int?,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
