// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_share_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileShareCountResponse {

 int get count;
/// Create a copy of ProfileShareCountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareCountResponseCopyWith<ProfileShareCountResponse> get copyWith => _$ProfileShareCountResponseCopyWithImpl<ProfileShareCountResponse>(this as ProfileShareCountResponse, _$identity);

  /// Serializes this ProfileShareCountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareCountResponse&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'ProfileShareCountResponse(count: $count)';
}


}

/// @nodoc
abstract mixin class $ProfileShareCountResponseCopyWith<$Res>  {
  factory $ProfileShareCountResponseCopyWith(ProfileShareCountResponse value, $Res Function(ProfileShareCountResponse) _then) = _$ProfileShareCountResponseCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$ProfileShareCountResponseCopyWithImpl<$Res>
    implements $ProfileShareCountResponseCopyWith<$Res> {
  _$ProfileShareCountResponseCopyWithImpl(this._self, this._then);

  final ProfileShareCountResponse _self;
  final $Res Function(ProfileShareCountResponse) _then;

/// Create a copy of ProfileShareCountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileShareCountResponse].
extension ProfileShareCountResponsePatterns on ProfileShareCountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileShareCountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileShareCountResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileShareCountResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileShareCountResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileShareCountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileShareCountResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileShareCountResponse() when $default != null:
return $default(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _ProfileShareCountResponse():
return $default(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _ProfileShareCountResponse() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileShareCountResponse implements ProfileShareCountResponse {
  const _ProfileShareCountResponse({required this.count});
  factory _ProfileShareCountResponse.fromJson(Map<String, dynamic> json) => _$ProfileShareCountResponseFromJson(json);

@override final  int count;

/// Create a copy of ProfileShareCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileShareCountResponseCopyWith<_ProfileShareCountResponse> get copyWith => __$ProfileShareCountResponseCopyWithImpl<_ProfileShareCountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareCountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileShareCountResponse&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'ProfileShareCountResponse(count: $count)';
}


}

/// @nodoc
abstract mixin class _$ProfileShareCountResponseCopyWith<$Res> implements $ProfileShareCountResponseCopyWith<$Res> {
  factory _$ProfileShareCountResponseCopyWith(_ProfileShareCountResponse value, $Res Function(_ProfileShareCountResponse) _then) = __$ProfileShareCountResponseCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$ProfileShareCountResponseCopyWithImpl<$Res>
    implements _$ProfileShareCountResponseCopyWith<$Res> {
  __$ProfileShareCountResponseCopyWithImpl(this._self, this._then);

  final _ProfileShareCountResponse _self;
  final $Res Function(_ProfileShareCountResponse) _then;

/// Create a copy of ProfileShareCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_ProfileShareCountResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
