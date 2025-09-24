// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speakers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Speakers {

 String get id; String get name; String? get avatarName; String? get xId;
/// Create a copy of Speakers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakersCopyWith<Speakers> get copyWith => _$SpeakersCopyWithImpl<Speakers>(this as Speakers, _$identity);

  /// Serializes this Speakers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Speakers&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarName, avatarName) || other.avatarName == avatarName)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarName,xId);

@override
String toString() {
  return 'Speakers(id: $id, name: $name, avatarName: $avatarName, xId: $xId)';
}


}

/// @nodoc
abstract mixin class $SpeakersCopyWith<$Res>  {
  factory $SpeakersCopyWith(Speakers value, $Res Function(Speakers) _then) = _$SpeakersCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarName, String? xId
});




}
/// @nodoc
class _$SpeakersCopyWithImpl<$Res>
    implements $SpeakersCopyWith<$Res> {
  _$SpeakersCopyWithImpl(this._self, this._then);

  final Speakers _self;
  final $Res Function(Speakers) _then;

/// Create a copy of Speakers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarName = freezed,Object? xId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarName: freezed == avatarName ? _self.avatarName : avatarName // ignore: cast_nullable_to_non_nullable
as String?,xId: freezed == xId ? _self.xId : xId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Speakers].
extension SpeakersPatterns on Speakers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Speakers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Speakers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Speakers value)  $default,){
final _that = this;
switch (_that) {
case _Speakers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Speakers value)?  $default,){
final _that = this;
switch (_that) {
case _Speakers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarName,  String? xId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Speakers() when $default != null:
return $default(_that.id,_that.name,_that.avatarName,_that.xId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarName,  String? xId)  $default,) {final _that = this;
switch (_that) {
case _Speakers():
return $default(_that.id,_that.name,_that.avatarName,_that.xId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatarName,  String? xId)?  $default,) {final _that = this;
switch (_that) {
case _Speakers() when $default != null:
return $default(_that.id,_that.name,_that.avatarName,_that.xId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Speakers implements Speakers {
  const _Speakers({required this.id, required this.name, this.avatarName, this.xId});
  factory _Speakers.fromJson(Map<String, dynamic> json) => _$SpeakersFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? avatarName;
@override final  String? xId;

/// Create a copy of Speakers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakersCopyWith<_Speakers> get copyWith => __$SpeakersCopyWithImpl<_Speakers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Speakers&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarName, avatarName) || other.avatarName == avatarName)&&(identical(other.xId, xId) || other.xId == xId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarName,xId);

@override
String toString() {
  return 'Speakers(id: $id, name: $name, avatarName: $avatarName, xId: $xId)';
}


}

/// @nodoc
abstract mixin class _$SpeakersCopyWith<$Res> implements $SpeakersCopyWith<$Res> {
  factory _$SpeakersCopyWith(_Speakers value, $Res Function(_Speakers) _then) = __$SpeakersCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarName, String? xId
});




}
/// @nodoc
class __$SpeakersCopyWithImpl<$Res>
    implements _$SpeakersCopyWith<$Res> {
  __$SpeakersCopyWithImpl(this._self, this._then);

  final _Speakers _self;
  final $Res Function(_Speakers) _then;

/// Create a copy of Speakers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarName = freezed,Object? xId = freezed,}) {
  return _then(_Speakers(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarName: freezed == avatarName ? _self.avatarName : avatarName // ignore: cast_nullable_to_non_nullable
as String?,xId: freezed == xId ? _self.xId : xId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
