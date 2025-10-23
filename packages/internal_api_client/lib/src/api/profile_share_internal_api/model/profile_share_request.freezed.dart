// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_share_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileShareRequest {

 String get profileId; String get anotherProfileId;
/// Create a copy of ProfileShareRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareRequestCopyWith<ProfileShareRequest> get copyWith => _$ProfileShareRequestCopyWithImpl<ProfileShareRequest>(this as ProfileShareRequest, _$identity);

  /// Serializes this ProfileShareRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareRequest&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.anotherProfileId, anotherProfileId) || other.anotherProfileId == anotherProfileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,anotherProfileId);

@override
String toString() {
  return 'ProfileShareRequest(profileId: $profileId, anotherProfileId: $anotherProfileId)';
}


}

/// @nodoc
abstract mixin class $ProfileShareRequestCopyWith<$Res>  {
  factory $ProfileShareRequestCopyWith(ProfileShareRequest value, $Res Function(ProfileShareRequest) _then) = _$ProfileShareRequestCopyWithImpl;
@useResult
$Res call({
 String profileId, String anotherProfileId
});




}
/// @nodoc
class _$ProfileShareRequestCopyWithImpl<$Res>
    implements $ProfileShareRequestCopyWith<$Res> {
  _$ProfileShareRequestCopyWithImpl(this._self, this._then);

  final ProfileShareRequest _self;
  final $Res Function(ProfileShareRequest) _then;

/// Create a copy of ProfileShareRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? anotherProfileId = null,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,anotherProfileId: null == anotherProfileId ? _self.anotherProfileId : anotherProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileShareRequest].
extension ProfileShareRequestPatterns on ProfileShareRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileShareRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileShareRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileShareRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProfileShareRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileShareRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileShareRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String profileId,  String anotherProfileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileShareRequest() when $default != null:
return $default(_that.profileId,_that.anotherProfileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String profileId,  String anotherProfileId)  $default,) {final _that = this;
switch (_that) {
case _ProfileShareRequest():
return $default(_that.profileId,_that.anotherProfileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String profileId,  String anotherProfileId)?  $default,) {final _that = this;
switch (_that) {
case _ProfileShareRequest() when $default != null:
return $default(_that.profileId,_that.anotherProfileId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileShareRequest implements ProfileShareRequest {
  const _ProfileShareRequest({required this.profileId, required this.anotherProfileId});
  factory _ProfileShareRequest.fromJson(Map<String, dynamic> json) => _$ProfileShareRequestFromJson(json);

@override final  String profileId;
@override final  String anotherProfileId;

/// Create a copy of ProfileShareRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileShareRequestCopyWith<_ProfileShareRequest> get copyWith => __$ProfileShareRequestCopyWithImpl<_ProfileShareRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileShareRequest&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.anotherProfileId, anotherProfileId) || other.anotherProfileId == anotherProfileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,anotherProfileId);

@override
String toString() {
  return 'ProfileShareRequest(profileId: $profileId, anotherProfileId: $anotherProfileId)';
}


}

/// @nodoc
abstract mixin class _$ProfileShareRequestCopyWith<$Res> implements $ProfileShareRequestCopyWith<$Res> {
  factory _$ProfileShareRequestCopyWith(_ProfileShareRequest value, $Res Function(_ProfileShareRequest) _then) = __$ProfileShareRequestCopyWithImpl;
@override @useResult
$Res call({
 String profileId, String anotherProfileId
});




}
/// @nodoc
class __$ProfileShareRequestCopyWithImpl<$Res>
    implements _$ProfileShareRequestCopyWith<$Res> {
  __$ProfileShareRequestCopyWithImpl(this._self, this._then);

  final _ProfileShareRequest _self;
  final $Res Function(_ProfileShareRequest) _then;

/// Create a copy of ProfileShareRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? anotherProfileId = null,}) {
  return _then(_ProfileShareRequest(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,anotherProfileId: null == anotherProfileId ? _self.anotherProfileId : anotherProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
