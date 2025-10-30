// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimelineItem {

 DateTime get startsAt; DateTime get endsAt;
/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineItemCopyWith<TimelineItem> get copyWith => _$TimelineItemCopyWithImpl<TimelineItem>(this as TimelineItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineItem&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}


@override
int get hashCode => Object.hash(runtimeType,startsAt,endsAt);

@override
String toString() {
  return 'TimelineItem(startsAt: $startsAt, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class $TimelineItemCopyWith<$Res>  {
  factory $TimelineItemCopyWith(TimelineItem value, $Res Function(TimelineItem) _then) = _$TimelineItemCopyWithImpl;
@useResult
$Res call({
 DateTime startsAt, DateTime endsAt
});




}
/// @nodoc
class _$TimelineItemCopyWithImpl<$Res>
    implements $TimelineItemCopyWith<$Res> {
  _$TimelineItemCopyWithImpl(this._self, this._then);

  final TimelineItem _self;
  final $Res Function(TimelineItem) _then;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startsAt = null,Object? endsAt = null,}) {
  return _then(_self.copyWith(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineItem].
extension TimelineItemPatterns on TimelineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimelineItemEvent value)?  event,TResult Function( TimelineItemSession value)?  session,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimelineItemEvent() when event != null:
return event(_that);case TimelineItemSession() when session != null:
return session(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimelineItemEvent value)  event,required TResult Function( TimelineItemSession value)  session,}){
final _that = this;
switch (_that) {
case TimelineItemEvent():
return event(_that);case TimelineItemSession():
return session(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimelineItemEvent value)?  event,TResult? Function( TimelineItemSession value)?  session,}){
final _that = this;
switch (_that) {
case TimelineItemEvent() when event != null:
return event(_that);case TimelineItemSession() when session != null:
return session(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime startsAt,  DateTime endsAt,  String title,  Venue? venue)?  event,TResult Function( DateTime startsAt,  DateTime endsAt,  ScheduleSession session)?  session,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimelineItemEvent() when event != null:
return event(_that.startsAt,_that.endsAt,_that.title,_that.venue);case TimelineItemSession() when session != null:
return session(_that.startsAt,_that.endsAt,_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime startsAt,  DateTime endsAt,  String title,  Venue? venue)  event,required TResult Function( DateTime startsAt,  DateTime endsAt,  ScheduleSession session)  session,}) {final _that = this;
switch (_that) {
case TimelineItemEvent():
return event(_that.startsAt,_that.endsAt,_that.title,_that.venue);case TimelineItemSession():
return session(_that.startsAt,_that.endsAt,_that.session);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime startsAt,  DateTime endsAt,  String title,  Venue? venue)?  event,TResult? Function( DateTime startsAt,  DateTime endsAt,  ScheduleSession session)?  session,}) {final _that = this;
switch (_that) {
case TimelineItemEvent() when event != null:
return event(_that.startsAt,_that.endsAt,_that.title,_that.venue);case TimelineItemSession() when session != null:
return session(_that.startsAt,_that.endsAt,_that.session);case _:
  return null;

}
}

}

/// @nodoc


class TimelineItemEvent implements TimelineItem {
  const TimelineItemEvent({required this.startsAt, required this.endsAt, required this.title, this.venue});
  

@override final  DateTime startsAt;
@override final  DateTime endsAt;
 final  String title;
 final  Venue? venue;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineItemEventCopyWith<TimelineItemEvent> get copyWith => _$TimelineItemEventCopyWithImpl<TimelineItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineItemEvent&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.venue, venue) || other.venue == venue));
}


@override
int get hashCode => Object.hash(runtimeType,startsAt,endsAt,title,venue);

@override
String toString() {
  return 'TimelineItem.event(startsAt: $startsAt, endsAt: $endsAt, title: $title, venue: $venue)';
}


}

/// @nodoc
abstract mixin class $TimelineItemEventCopyWith<$Res> implements $TimelineItemCopyWith<$Res> {
  factory $TimelineItemEventCopyWith(TimelineItemEvent value, $Res Function(TimelineItemEvent) _then) = _$TimelineItemEventCopyWithImpl;
@override @useResult
$Res call({
 DateTime startsAt, DateTime endsAt, String title, Venue? venue
});


$VenueCopyWith<$Res>? get venue;

}
/// @nodoc
class _$TimelineItemEventCopyWithImpl<$Res>
    implements $TimelineItemEventCopyWith<$Res> {
  _$TimelineItemEventCopyWithImpl(this._self, this._then);

  final TimelineItemEvent _self;
  final $Res Function(TimelineItemEvent) _then;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startsAt = null,Object? endsAt = null,Object? title = null,Object? venue = freezed,}) {
  return _then(TimelineItemEvent(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as Venue?,
  ));
}

/// Create a copy of TimelineItem
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

/// @nodoc


class TimelineItemSession implements TimelineItem {
  const TimelineItemSession({required this.startsAt, required this.endsAt, required this.session});
  

@override final  DateTime startsAt;
@override final  DateTime endsAt;
 final  ScheduleSession session;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineItemSessionCopyWith<TimelineItemSession> get copyWith => _$TimelineItemSessionCopyWithImpl<TimelineItemSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineItemSession&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,startsAt,endsAt,session);

@override
String toString() {
  return 'TimelineItem.session(startsAt: $startsAt, endsAt: $endsAt, session: $session)';
}


}

/// @nodoc
abstract mixin class $TimelineItemSessionCopyWith<$Res> implements $TimelineItemCopyWith<$Res> {
  factory $TimelineItemSessionCopyWith(TimelineItemSession value, $Res Function(TimelineItemSession) _then) = _$TimelineItemSessionCopyWithImpl;
@override @useResult
$Res call({
 DateTime startsAt, DateTime endsAt, ScheduleSession session
});


$ScheduleSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$TimelineItemSessionCopyWithImpl<$Res>
    implements $TimelineItemSessionCopyWith<$Res> {
  _$TimelineItemSessionCopyWithImpl(this._self, this._then);

  final TimelineItemSession _self;
  final $Res Function(TimelineItemSession) _then;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startsAt = null,Object? endsAt = null,Object? session = null,}) {
  return _then(TimelineItemSession(
startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as ScheduleSession,
  ));
}

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleSessionCopyWith<$Res> get session {
  
  return $ScheduleSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
