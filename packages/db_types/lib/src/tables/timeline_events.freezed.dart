// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineEvents {

 String get id; String get title; DateTime get startsAt; DateTime? get endsAt; String? get venueId; String? get url; DateTime get createdAt;
/// Create a copy of TimelineEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineEventsCopyWith<TimelineEvents> get copyWith => _$TimelineEventsCopyWithImpl<TimelineEvents>(this as TimelineEvents, _$identity);

  /// Serializes this TimelineEvents to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineEvents&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startsAt,endsAt,venueId,url,createdAt);

@override
String toString() {
  return 'TimelineEvents(id: $id, title: $title, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, url: $url, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TimelineEventsCopyWith<$Res>  {
  factory $TimelineEventsCopyWith(TimelineEvents value, $Res Function(TimelineEvents) _then) = _$TimelineEventsCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime startsAt, DateTime? endsAt, String? venueId, String? url, DateTime createdAt
});




}
/// @nodoc
class _$TimelineEventsCopyWithImpl<$Res>
    implements $TimelineEventsCopyWith<$Res> {
  _$TimelineEventsCopyWithImpl(this._self, this._then);

  final TimelineEvents _self;
  final $Res Function(TimelineEvents) _then;

/// Create a copy of TimelineEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? startsAt = null,Object? endsAt = freezed,Object? venueId = freezed,Object? url = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineEvents].
extension TimelineEventsPatterns on TimelineEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineEvents value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineEvents() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineEvents value)  $default,){
final _that = this;
switch (_that) {
case _TimelineEvents():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineEvents value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineEvents() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime startsAt,  DateTime? endsAt,  String? venueId,  String? url,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineEvents() when $default != null:
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.url,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime startsAt,  DateTime? endsAt,  String? venueId,  String? url,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TimelineEvents():
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.url,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime startsAt,  DateTime? endsAt,  String? venueId,  String? url,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TimelineEvents() when $default != null:
return $default(_that.id,_that.title,_that.startsAt,_that.endsAt,_that.venueId,_that.url,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineEvents implements TimelineEvents {
  const _TimelineEvents({required this.id, required this.title, required this.startsAt, this.endsAt, this.venueId, this.url, required this.createdAt});
  factory _TimelineEvents.fromJson(Map<String, dynamic> json) => _$TimelineEventsFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime startsAt;
@override final  DateTime? endsAt;
@override final  String? venueId;
@override final  String? url;
@override final  DateTime createdAt;

/// Create a copy of TimelineEvents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineEventsCopyWith<_TimelineEvents> get copyWith => __$TimelineEventsCopyWithImpl<_TimelineEvents>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineEventsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineEvents&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,startsAt,endsAt,venueId,url,createdAt);

@override
String toString() {
  return 'TimelineEvents(id: $id, title: $title, startsAt: $startsAt, endsAt: $endsAt, venueId: $venueId, url: $url, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TimelineEventsCopyWith<$Res> implements $TimelineEventsCopyWith<$Res> {
  factory _$TimelineEventsCopyWith(_TimelineEvents value, $Res Function(_TimelineEvents) _then) = __$TimelineEventsCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime startsAt, DateTime? endsAt, String? venueId, String? url, DateTime createdAt
});




}
/// @nodoc
class __$TimelineEventsCopyWithImpl<$Res>
    implements _$TimelineEventsCopyWith<$Res> {
  __$TimelineEventsCopyWithImpl(this._self, this._then);

  final _TimelineEvents _self;
  final $Res Function(_TimelineEvents) _then;

/// Create a copy of TimelineEvents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? startsAt = null,Object? endsAt = freezed,Object? venueId = freezed,Object? url = freezed,Object? createdAt = null,}) {
  return _then(_TimelineEvents(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,venueId: freezed == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
