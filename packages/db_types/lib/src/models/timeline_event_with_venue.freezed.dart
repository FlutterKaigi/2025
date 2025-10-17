// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_event_with_venue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineEventWithVenue {

 String get id; String get title;@RequiredDateTimeConverter() DateTime get startsAt;@DateTimeConverter() DateTime? get endsAt; String? get venueId;@RequiredDateTimeConverter() DateTime get createdAt; SessionVenues? get venue;
/// Create a copy of TimelineEventWithVenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineEventWithVenueCopyWith<TimelineEventWithVenue> get copyWith => _$TimelineEventWithVenueCopyWithImpl<TimelineEventWithVenue>(this as TimelineEventWithVenue, _$identity);

  /// Serializes this TimelineEventWithVenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineEventWithVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startsAt,endsAt,venueId,createdAt,venue);

@override
String toString() {
  return 'TimelineEventWithVenue(id: $id, title: $title, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, createdAt: $createdAt, venue: $venue)';
}


}

/// @nodoc
abstract mixin class $TimelineEventWithVenueCopyWith<$Res>  {
  factory $TimelineEventWithVenueCopyWith(TimelineEventWithVenue value, $Res Function(TimelineEventWithVenue) _then) = _$TimelineEventWithVenueCopyWithImpl;
@useResult
$Res call({
 String id, String title,@RequiredDateTimeConverter() DateTime startsAt,@DateTimeConverter() DateTime? endsAt, String? venueId,@RequiredDateTimeConverter() DateTime createdAt, SessionVenues? venue
});


$SessionVenuesCopyWith<$Res>? get venue;

}
/// @nodoc
class _$TimelineEventWithVenueCopyWithImpl<$Res>
    implements $TimelineEventWithVenueCopyWith<$Res> {
  _$TimelineEventWithVenueCopyWithImpl(this._self, this._then);

  final TimelineEventWithVenue _self;
  final $Res Function(TimelineEventWithVenue) _then;

/// Create a copy of TimelineEventWithVenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? startsAt = null,Object? endsAt = freezed,Object? venueId = freezed,Object? createdAt = null,Object? venue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as SessionVenues?,
  ));
}
/// Create a copy of TimelineEventWithVenue
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


/// Adds pattern-matching-related methods to [TimelineEventWithVenue].
extension TimelineEventWithVenuePatterns on TimelineEventWithVenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineEventWithVenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineEventWithVenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineEventWithVenue value)  $default,){
final _that = this;
switch (_that) {
case _TimelineEventWithVenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineEventWithVenue value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineEventWithVenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @RequiredDateTimeConverter()  DateTime startsAt, @DateTimeConverter()  DateTime? endsAt,  String? venueId, @RequiredDateTimeConverter()  DateTime createdAt,  SessionVenues? venue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineEventWithVenue() when $default != null:
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.venue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @RequiredDateTimeConverter()  DateTime startsAt, @DateTimeConverter()  DateTime? endsAt,  String? venueId, @RequiredDateTimeConverter()  DateTime createdAt,  SessionVenues? venue)  $default,) {final _that = this;
switch (_that) {
case _TimelineEventWithVenue():
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.venue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @RequiredDateTimeConverter()  DateTime startsAt, @DateTimeConverter()  DateTime? endsAt,  String? venueId, @RequiredDateTimeConverter()  DateTime createdAt,  SessionVenues? venue)?  $default,) {final _that = this;
switch (_that) {
case _TimelineEventWithVenue() when $default != null:
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.createdAt,_that.venue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineEventWithVenue implements TimelineEventWithVenue {
  const _TimelineEventWithVenue({required this.id, required this.title, @RequiredDateTimeConverter() required this.startsAt, @DateTimeConverter() this.endsAt, this.venueId, @RequiredDateTimeConverter() required this.createdAt, this.venue});
  factory _TimelineEventWithVenue.fromJson(Map<String, dynamic> json) => _$TimelineEventWithVenueFromJson(json);

@override final  String id;
@override final  String title;
@override@RequiredDateTimeConverter() final  DateTime startsAt;
@override@DateTimeConverter() final  DateTime? endsAt;
@override final  String? venueId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override final  SessionVenues? venue;

/// Create a copy of TimelineEventWithVenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineEventWithVenueCopyWith<_TimelineEventWithVenue> get copyWith => __$TimelineEventWithVenueCopyWithImpl<_TimelineEventWithVenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineEventWithVenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineEventWithVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.venue, venue) || other.venue == venue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startsAt,endsAt,venueId,createdAt,venue);

@override
String toString() {
  return 'TimelineEventWithVenue(id: $id, title: $title, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, createdAt: $createdAt, venue: $venue)';
}


}

/// @nodoc
abstract mixin class _$TimelineEventWithVenueCopyWith<$Res> implements $TimelineEventWithVenueCopyWith<$Res> {
  factory _$TimelineEventWithVenueCopyWith(_TimelineEventWithVenue value, $Res Function(_TimelineEventWithVenue) _then) = __$TimelineEventWithVenueCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@RequiredDateTimeConverter() DateTime startsAt,@DateTimeConverter() DateTime? endsAt, String? venueId,@RequiredDateTimeConverter() DateTime createdAt, SessionVenues? venue
});


@override $SessionVenuesCopyWith<$Res>? get venue;

}
/// @nodoc
class __$TimelineEventWithVenueCopyWithImpl<$Res>
    implements _$TimelineEventWithVenueCopyWith<$Res> {
  __$TimelineEventWithVenueCopyWithImpl(this._self, this._then);

  final _TimelineEventWithVenue _self;
  final $Res Function(_TimelineEventWithVenue) _then;

/// Create a copy of TimelineEventWithVenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? startsAt = null,Object? endsAt = freezed,Object? venueId = freezed,Object? createdAt = null,Object? venue = freezed,}) {
  return _then(_TimelineEventWithVenue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as SessionVenues?,
  ));
}

/// Create a copy of TimelineEventWithVenue
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
