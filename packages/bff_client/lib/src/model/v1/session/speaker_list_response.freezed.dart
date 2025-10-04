// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeakerListResponse {

 List<Speaker> get speakers;
/// Create a copy of SpeakerListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerListResponseCopyWith<SpeakerListResponse> get copyWith => _$SpeakerListResponseCopyWithImpl<SpeakerListResponse>(this as SpeakerListResponse, _$identity);

  /// Serializes this SpeakerListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerListResponse&&const DeepCollectionEquality().equals(other.speakers, speakers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(speakers));

@override
String toString() {
  return 'SpeakerListResponse(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class $SpeakerListResponseCopyWith<$Res>  {
  factory $SpeakerListResponseCopyWith(SpeakerListResponse value, $Res Function(SpeakerListResponse) _then) = _$SpeakerListResponseCopyWithImpl;
@useResult
$Res call({
 List<Speaker> speakers
});




}
/// @nodoc
class _$SpeakerListResponseCopyWithImpl<$Res>
    implements $SpeakerListResponseCopyWith<$Res> {
  _$SpeakerListResponseCopyWithImpl(this._self, this._then);

  final SpeakerListResponse _self;
  final $Res Function(SpeakerListResponse) _then;

/// Create a copy of SpeakerListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speakers = null,}) {
  return _then(_self.copyWith(
speakers: null == speakers ? _self.speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeakerListResponse].
extension SpeakerListResponsePatterns on SpeakerListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeakerListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeakerListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeakerListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SpeakerListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeakerListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SpeakerListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Speaker> speakers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeakerListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Speaker> speakers)  $default,) {final _that = this;
switch (_that) {
case _SpeakerListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Speaker> speakers)?  $default,) {final _that = this;
switch (_that) {
case _SpeakerListResponse() when $default != null:
return $default(_that.speakers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeakerListResponse implements SpeakerListResponse {
  const _SpeakerListResponse({required final  List<Speaker> speakers}): _speakers = speakers;
  factory _SpeakerListResponse.fromJson(Map<String, dynamic> json) => _$SpeakerListResponseFromJson(json);

 final  List<Speaker> _speakers;
@override List<Speaker> get speakers {
  if (_speakers is EqualUnmodifiableListView) return _speakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_speakers);
}


/// Create a copy of SpeakerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerListResponseCopyWith<_SpeakerListResponse> get copyWith => __$SpeakerListResponseCopyWithImpl<_SpeakerListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeakerListResponse&&const DeepCollectionEquality().equals(other._speakers, _speakers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_speakers));

@override
String toString() {
  return 'SpeakerListResponse(speakers: $speakers)';
}


}

/// @nodoc
abstract mixin class _$SpeakerListResponseCopyWith<$Res> implements $SpeakerListResponseCopyWith<$Res> {
  factory _$SpeakerListResponseCopyWith(_SpeakerListResponse value, $Res Function(_SpeakerListResponse) _then) = __$SpeakerListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Speaker> speakers
});




}
/// @nodoc
class __$SpeakerListResponseCopyWithImpl<$Res>
    implements _$SpeakerListResponseCopyWith<$Res> {
  __$SpeakerListResponseCopyWithImpl(this._self, this._then);

  final _SpeakerListResponse _self;
  final $Res Function(_SpeakerListResponse) _then;

/// Create a copy of SpeakerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speakers = null,}) {
  return _then(_SpeakerListResponse(
speakers: null == speakers ? _self._speakers : speakers // ignore: cast_nullable_to_non_nullable
as List<Speaker>,
  ));
}


}

// dart format on
