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

 String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; DateTime get createdAt; String? get videoUrl;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,createdAt,videoUrl);

@override
String toString() {
  return 'Session(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, createdAt: $createdAt, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, DateTime createdAt, String? videoUrl
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? createdAt = null,Object? videoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  DateTime createdAt,  String? videoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.createdAt,_that.videoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  DateTime createdAt,  String? videoUrl)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.createdAt,_that.videoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime startsAt,  DateTime endsAt,  bool isLightningTalk,  bool isBeginnersLightningTalk,  bool isHandsOn,  DateTime createdAt,  String? videoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.createdAt,_that.videoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session implements Session {
  const _Session({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.isLightningTalk, required this.isBeginnersLightningTalk, required this.isHandsOn, required this.createdAt, this.videoUrl});
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  bool isLightningTalk;
@override final  bool isBeginnersLightningTalk;
@override final  bool isHandsOn;
@override final  DateTime createdAt;
@override final  String? videoUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,createdAt,videoUrl);

@override
String toString() {
  return 'Session(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, createdAt: $createdAt, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, DateTime createdAt, String? videoUrl
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? createdAt = null,Object? videoUrl = freezed,}) {
  return _then(_Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,isLightningTalk: null == isLightningTalk ? _self.isLightningTalk : isLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isBeginnersLightningTalk: null == isBeginnersLightningTalk ? _self.isBeginnersLightningTalk : isBeginnersLightningTalk // ignore: cast_nullable_to_non_nullable
as bool,isHandsOn: null == isHandsOn ? _self.isHandsOn : isHandsOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Speaker {

 String get id; String get name; String? get avatarUrl; String? get xId;
/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerCopyWith<Speaker> get copyWith => _$SpeakerCopyWithImpl<Speaker>(this as Speaker, _$identity);

  /// Serializes this Speaker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Speaker&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,xId);

@override
String toString() {
  return 'Speaker(id: $id, name: $name, avatarUrl: $avatarUrl, xId: $xId)';
}


}

/// @nodoc
abstract mixin class $SpeakerCopyWith<$Res>  {
  factory $SpeakerCopyWith(Speaker value, $Res Function(Speaker) _then) = _$SpeakerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarUrl, String? xId
});




}
/// @nodoc
class _$SpeakerCopyWithImpl<$Res>
    implements $SpeakerCopyWith<$Res> {
  _$SpeakerCopyWithImpl(this._self, this._then);

  final Speaker _self;
  final $Res Function(Speaker) _then;

/// Create a copy of Speaker
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


/// Adds pattern-matching-related methods to [Speaker].
extension SpeakerPatterns on Speaker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Speaker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Speaker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Speaker value)  $default,){
final _that = this;
switch (_that) {
case _Speaker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Speaker value)?  $default,){
final _that = this;
switch (_that) {
case _Speaker() when $default != null:
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
case _Speaker() when $default != null:
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
case _Speaker():
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
case _Speaker() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.xId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Speaker implements Speaker {
  const _Speaker({required this.id, required this.name, this.avatarUrl, this.xId});
  factory _Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? avatarUrl;
@override final  String? xId;

/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerCopyWith<_Speaker> get copyWith => __$SpeakerCopyWithImpl<_Speaker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Speaker&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,xId);

@override
String toString() {
  return 'Speaker(id: $id, name: $name, avatarUrl: $avatarUrl, xId: $xId)';
}


}

/// @nodoc
abstract mixin class _$SpeakerCopyWith<$Res> implements $SpeakerCopyWith<$Res> {
  factory _$SpeakerCopyWith(_Speaker value, $Res Function(_Speaker) _then) = __$SpeakerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarUrl, String? xId
});




}
/// @nodoc
class __$SpeakerCopyWithImpl<$Res>
    implements _$SpeakerCopyWith<$Res> {
  __$SpeakerCopyWithImpl(this._self, this._then);

  final _Speaker _self;
  final $Res Function(_Speaker) _then;

/// Create a copy of Speaker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? xId = freezed,}) {
  return _then(_Speaker(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,xId: freezed == xId ? _self.xId : xId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Venue {

 String get id; String get name;
/// Create a copy of Venue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenueCopyWith<Venue> get copyWith => _$VenueCopyWithImpl<Venue>(this as Venue, _$identity);

  /// Serializes this Venue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Venue&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Venue(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $VenueCopyWith<$Res>  {
  factory $VenueCopyWith(Venue value, $Res Function(Venue) _then) = _$VenueCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$VenueCopyWithImpl<$Res>
    implements $VenueCopyWith<$Res> {
  _$VenueCopyWithImpl(this._self, this._then);

  final Venue _self;
  final $Res Function(Venue) _then;

/// Create a copy of Venue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Venue].
extension VenuePatterns on Venue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Venue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Venue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Venue value)  $default,){
final _that = this;
switch (_that) {
case _Venue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Venue value)?  $default,){
final _that = this;
switch (_that) {
case _Venue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Venue() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _Venue():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Venue() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Venue implements Venue {
  const _Venue({required this.id, required this.name});
  factory _Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of Venue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenueCopyWith<_Venue> get copyWith => __$VenueCopyWithImpl<_Venue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Venue&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Venue(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$VenueCopyWith<$Res> implements $VenueCopyWith<$Res> {
  factory _$VenueCopyWith(_Venue value, $Res Function(_Venue) _then) = __$VenueCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$VenueCopyWithImpl<$Res>
    implements _$VenueCopyWith<$Res> {
  __$VenueCopyWithImpl(this._self, this._then);

  final _Venue _self;
  final $Res Function(_Venue) _then;

/// Create a copy of Venue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Venue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Sponsor {

 int get id; String get name; String get logoUrl; String get slug; String get prText; String get websiteUrl; String get sponsorType; String get displayOrder; List<String> get optionPlanTypes; String? get basicPlanType;
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCopyWith<Sponsor> get copyWith => _$SponsorCopyWithImpl<Sponsor>(this as Sponsor, _$identity);

  /// Serializes this Sponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.prText, prText) || other.prText == prText)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other.optionPlanTypes, optionPlanTypes)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,slug,prText,websiteUrl,sponsorType,displayOrder,const DeepCollectionEquality().hash(optionPlanTypes),basicPlanType);

@override
String toString() {
  return 'Sponsor(id: $id, name: $name, logoUrl: $logoUrl, slug: $slug, prText: $prText, websiteUrl: $websiteUrl, sponsorType: $sponsorType, displayOrder: $displayOrder, optionPlanTypes: $optionPlanTypes, basicPlanType: $basicPlanType)';
}


}

/// @nodoc
abstract mixin class $SponsorCopyWith<$Res>  {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) _then) = _$SponsorCopyWithImpl;
@useResult
$Res call({
 int id, String name, String logoUrl, String slug, String prText, String websiteUrl, String sponsorType, String displayOrder, List<String> optionPlanTypes, String? basicPlanType
});




}
/// @nodoc
class _$SponsorCopyWithImpl<$Res>
    implements $SponsorCopyWith<$Res> {
  _$SponsorCopyWithImpl(this._self, this._then);

  final Sponsor _self;
  final $Res Function(Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? slug = null,Object? prText = null,Object? websiteUrl = null,Object? sponsorType = null,Object? displayOrder = null,Object? optionPlanTypes = null,Object? basicPlanType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,prText: null == prText ? _self.prText : prText // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as String,optionPlanTypes: null == optionPlanTypes ? _self.optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<String>,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sponsor].
extension SponsorPatterns on Sponsor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sponsor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sponsor value)  $default,){
final _that = this;
switch (_that) {
case _Sponsor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sponsor value)?  $default,){
final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String logoUrl,  String slug,  String prText,  String websiteUrl,  String sponsorType,  String displayOrder,  List<String> optionPlanTypes,  String? basicPlanType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.displayOrder,_that.optionPlanTypes,_that.basicPlanType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String logoUrl,  String slug,  String prText,  String websiteUrl,  String sponsorType,  String displayOrder,  List<String> optionPlanTypes,  String? basicPlanType)  $default,) {final _that = this;
switch (_that) {
case _Sponsor():
return $default(_that.id,_that.name,_that.logoUrl,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.displayOrder,_that.optionPlanTypes,_that.basicPlanType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String logoUrl,  String slug,  String prText,  String websiteUrl,  String sponsorType,  String displayOrder,  List<String> optionPlanTypes,  String? basicPlanType)?  $default,) {final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.displayOrder,_that.optionPlanTypes,_that.basicPlanType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sponsor implements Sponsor {
  const _Sponsor({required this.id, required this.name, required this.logoUrl, required this.slug, required this.prText, required this.websiteUrl, required this.sponsorType, required this.displayOrder, required final  List<String> optionPlanTypes, this.basicPlanType}): _optionPlanTypes = optionPlanTypes;
  factory _Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);

@override final  int id;
@override final  String name;
@override final  String logoUrl;
@override final  String slug;
@override final  String prText;
@override final  String websiteUrl;
@override final  String sponsorType;
@override final  String displayOrder;
 final  List<String> _optionPlanTypes;
@override List<String> get optionPlanTypes {
  if (_optionPlanTypes is EqualUnmodifiableListView) return _optionPlanTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionPlanTypes);
}

@override final  String? basicPlanType;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorCopyWith<_Sponsor> get copyWith => __$SponsorCopyWithImpl<_Sponsor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.prText, prText) || other.prText == prText)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other._optionPlanTypes, _optionPlanTypes)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,slug,prText,websiteUrl,sponsorType,displayOrder,const DeepCollectionEquality().hash(_optionPlanTypes),basicPlanType);

@override
String toString() {
  return 'Sponsor(id: $id, name: $name, logoUrl: $logoUrl, slug: $slug, prText: $prText, websiteUrl: $websiteUrl, sponsorType: $sponsorType, displayOrder: $displayOrder, optionPlanTypes: $optionPlanTypes, basicPlanType: $basicPlanType)';
}


}

/// @nodoc
abstract mixin class _$SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$SponsorCopyWith(_Sponsor value, $Res Function(_Sponsor) _then) = __$SponsorCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String logoUrl, String slug, String prText, String websiteUrl, String sponsorType, String displayOrder, List<String> optionPlanTypes, String? basicPlanType
});




}
/// @nodoc
class __$SponsorCopyWithImpl<$Res>
    implements _$SponsorCopyWith<$Res> {
  __$SponsorCopyWithImpl(this._self, this._then);

  final _Sponsor _self;
  final $Res Function(_Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? slug = null,Object? prText = null,Object? websiteUrl = null,Object? sponsorType = null,Object? displayOrder = null,Object? optionPlanTypes = null,Object? basicPlanType = freezed,}) {
  return _then(_Sponsor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,prText: null == prText ? _self.prText : prText // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as String,optionPlanTypes: null == optionPlanTypes ? _self._optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<String>,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SessionWithSpeakers {

 String get id; String get title; String get description; DateTime get startsAt; DateTime get endsAt; bool get isLightningTalk; bool get isBeginnersLightningTalk; bool get isHandsOn; List<Speaker> get speakers; String? get videoUrl; Sponsor? get sponsor;
/// Create a copy of SessionWithSpeakers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionWithSpeakersCopyWith<SessionWithSpeakers> get copyWith => _$SessionWithSpeakersCopyWithImpl<SessionWithSpeakers>(this as SessionWithSpeakers, _$identity);

  /// Serializes this SessionWithSpeakers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionWithSpeakers&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other.speakers, speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(speakers),videoUrl,sponsor);

@override
String toString() {
  return 'SessionWithSpeakers(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class $SessionWithSpeakersCopyWith<$Res>  {
  factory $SessionWithSpeakersCopyWith(SessionWithSpeakers value, $Res Function(SessionWithSpeakers) _then) = _$SessionWithSpeakersCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Sponsor? sponsor
});


$SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class _$SessionWithSpeakersCopyWithImpl<$Res>
    implements $SessionWithSpeakersCopyWith<$Res> {
  _$SessionWithSpeakersCopyWithImpl(this._self, this._then);

  final SessionWithSpeakers _self;
  final $Res Function(SessionWithSpeakers) _then;

/// Create a copy of SessionWithSpeakers
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
/// Create a copy of SessionWithSpeakers
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


/// Adds pattern-matching-related methods to [SessionWithSpeakers].
extension SessionWithSpeakersPatterns on SessionWithSpeakers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionWithSpeakers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionWithSpeakers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionWithSpeakers value)  $default,){
final _that = this;
switch (_that) {
case _SessionWithSpeakers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionWithSpeakers value)?  $default,){
final _that = this;
switch (_that) {
case _SessionWithSpeakers() when $default != null:
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
case _SessionWithSpeakers() when $default != null:
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
case _SessionWithSpeakers():
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
case _SessionWithSpeakers() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.isLightningTalk,_that.isBeginnersLightningTalk,_that.isHandsOn,_that.speakers,_that.videoUrl,_that.sponsor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionWithSpeakers implements SessionWithSpeakers {
  const _SessionWithSpeakers({required this.id, required this.title, required this.description, required this.startsAt, required this.endsAt, required this.isLightningTalk, required this.isBeginnersLightningTalk, required this.isHandsOn, required final  List<Speaker> speakers, this.videoUrl, this.sponsor}): _speakers = speakers;
  factory _SessionWithSpeakers.fromJson(Map<String, dynamic> json) => _$SessionWithSpeakersFromJson(json);

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

/// Create a copy of SessionWithSpeakers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionWithSpeakersCopyWith<_SessionWithSpeakers> get copyWith => __$SessionWithSpeakersCopyWithImpl<_SessionWithSpeakers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionWithSpeakersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionWithSpeakers&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.isLightningTalk, isLightningTalk) || other.isLightningTalk == isLightningTalk)&&(identical(other.isBeginnersLightningTalk, isBeginnersLightningTalk) || other.isBeginnersLightningTalk == isBeginnersLightningTalk)&&(identical(other.isHandsOn, isHandsOn) || other.isHandsOn == isHandsOn)&&const DeepCollectionEquality().equals(other._speakers, _speakers)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startsAt,endsAt,isLightningTalk,isBeginnersLightningTalk,isHandsOn,const DeepCollectionEquality().hash(_speakers),videoUrl,sponsor);

@override
String toString() {
  return 'SessionWithSpeakers(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, isLightningTalk: $isLightningTalk, isBeginnersLightningTalk: $isBeginnersLightningTalk, isHandsOn: $isHandsOn, speakers: $speakers, videoUrl: $videoUrl, sponsor: $sponsor)';
}


}

/// @nodoc
abstract mixin class _$SessionWithSpeakersCopyWith<$Res> implements $SessionWithSpeakersCopyWith<$Res> {
  factory _$SessionWithSpeakersCopyWith(_SessionWithSpeakers value, $Res Function(_SessionWithSpeakers) _then) = __$SessionWithSpeakersCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime startsAt, DateTime endsAt, bool isLightningTalk, bool isBeginnersLightningTalk, bool isHandsOn, List<Speaker> speakers, String? videoUrl, Sponsor? sponsor
});


@override $SponsorCopyWith<$Res>? get sponsor;

}
/// @nodoc
class __$SessionWithSpeakersCopyWithImpl<$Res>
    implements _$SessionWithSpeakersCopyWith<$Res> {
  __$SessionWithSpeakersCopyWithImpl(this._self, this._then);

  final _SessionWithSpeakers _self;
  final $Res Function(_SessionWithSpeakers) _then;

/// Create a copy of SessionWithSpeakers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? endsAt = null,Object? isLightningTalk = null,Object? isBeginnersLightningTalk = null,Object? isHandsOn = null,Object? speakers = null,Object? videoUrl = freezed,Object? sponsor = freezed,}) {
  return _then(_SessionWithSpeakers(
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

/// Create a copy of SessionWithSpeakers
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
