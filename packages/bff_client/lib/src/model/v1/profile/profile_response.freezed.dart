// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResponse {

 Profiles get profile; List<UserSnsLinks> get snsLinks; bool get canEditNameplate; String? get nameplateNote;
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<ProfileResponse> get copyWith => _$ProfileResponseCopyWithImpl<ProfileResponse>(this as ProfileResponse, _$identity);

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResponse&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.snsLinks, snsLinks)&&(identical(other.canEditNameplate, canEditNameplate) || other.canEditNameplate == canEditNameplate)&&(identical(other.nameplateNote, nameplateNote) || other.nameplateNote == nameplateNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(snsLinks),canEditNameplate,nameplateNote);

@override
String toString() {
  return 'ProfileResponse(profile: $profile, snsLinks: $snsLinks, canEditNameplate: $canEditNameplate, nameplateNote: $nameplateNote)';
}


}

/// @nodoc
abstract mixin class $ProfileResponseCopyWith<$Res>  {
  factory $ProfileResponseCopyWith(ProfileResponse value, $Res Function(ProfileResponse) _then) = _$ProfileResponseCopyWithImpl;
@useResult
$Res call({
 Profiles profile, List<UserSnsLinks> snsLinks, bool canEditNameplate, String? nameplateNote
});


$ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._self, this._then);

  final ProfileResponse _self;
  final $Res Function(ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? snsLinks = null,Object? canEditNameplate = null,Object? nameplateNote = freezed,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self.snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<UserSnsLinks>,canEditNameplate: null == canEditNameplate ? _self.canEditNameplate : canEditNameplate // ignore: cast_nullable_to_non_nullable
as bool,nameplateNote: freezed == nameplateNote ? _self.nameplateNote : nameplateNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfilesCopyWith<$Res> get profile {
  
  return $ProfilesCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileResponse].
extension ProfileResponsePatterns on ProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profiles profile,  List<UserSnsLinks> snsLinks,  bool canEditNameplate,  String? nameplateNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.profile,_that.snsLinks,_that.canEditNameplate,_that.nameplateNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profiles profile,  List<UserSnsLinks> snsLinks,  bool canEditNameplate,  String? nameplateNote)  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse():
return $default(_that.profile,_that.snsLinks,_that.canEditNameplate,_that.nameplateNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profiles profile,  List<UserSnsLinks> snsLinks,  bool canEditNameplate,  String? nameplateNote)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.profile,_that.snsLinks,_that.canEditNameplate,_that.nameplateNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResponse implements ProfileResponse {
  const _ProfileResponse({required this.profile, required final  List<UserSnsLinks> snsLinks, required this.canEditNameplate, this.nameplateNote}): _snsLinks = snsLinks;
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override final  Profiles profile;
 final  List<UserSnsLinks> _snsLinks;
@override List<UserSnsLinks> get snsLinks {
  if (_snsLinks is EqualUnmodifiableListView) return _snsLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snsLinks);
}

@override final  bool canEditNameplate;
@override final  String? nameplateNote;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResponseCopyWith<_ProfileResponse> get copyWith => __$ProfileResponseCopyWithImpl<_ProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResponse&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other._snsLinks, _snsLinks)&&(identical(other.canEditNameplate, canEditNameplate) || other.canEditNameplate == canEditNameplate)&&(identical(other.nameplateNote, nameplateNote) || other.nameplateNote == nameplateNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(_snsLinks),canEditNameplate,nameplateNote);

@override
String toString() {
  return 'ProfileResponse(profile: $profile, snsLinks: $snsLinks, canEditNameplate: $canEditNameplate, nameplateNote: $nameplateNote)';
}


}

/// @nodoc
abstract mixin class _$ProfileResponseCopyWith<$Res> implements $ProfileResponseCopyWith<$Res> {
  factory _$ProfileResponseCopyWith(_ProfileResponse value, $Res Function(_ProfileResponse) _then) = __$ProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 Profiles profile, List<UserSnsLinks> snsLinks, bool canEditNameplate, String? nameplateNote
});


@override $ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileResponseCopyWithImpl<$Res>
    implements _$ProfileResponseCopyWith<$Res> {
  __$ProfileResponseCopyWithImpl(this._self, this._then);

  final _ProfileResponse _self;
  final $Res Function(_ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? snsLinks = null,Object? canEditNameplate = null,Object? nameplateNote = freezed,}) {
  return _then(_ProfileResponse(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self._snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<UserSnsLinks>,canEditNameplate: null == canEditNameplate ? _self.canEditNameplate : canEditNameplate // ignore: cast_nullable_to_non_nullable
as bool,nameplateNote: freezed == nameplateNote ? _self.nameplateNote : nameplateNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfilesCopyWith<$Res> get profile {
  
  return $ProfilesCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
