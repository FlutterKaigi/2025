// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_with_sns_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileWithSnsLinks {

 Profiles get profile; List<UserSnsLinks> get snsLinks; String? get avatarUrl;
/// Create a copy of ProfileWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileWithSnsLinksCopyWith<ProfileWithSnsLinks> get copyWith => _$ProfileWithSnsLinksCopyWithImpl<ProfileWithSnsLinks>(this as ProfileWithSnsLinks, _$identity);

  /// Serializes this ProfileWithSnsLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileWithSnsLinks&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.snsLinks, snsLinks)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(snsLinks),avatarUrl);

@override
String toString() {
  return 'ProfileWithSnsLinks(profile: $profile, snsLinks: $snsLinks, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileWithSnsLinksCopyWith<$Res>  {
  factory $ProfileWithSnsLinksCopyWith(ProfileWithSnsLinks value, $Res Function(ProfileWithSnsLinks) _then) = _$ProfileWithSnsLinksCopyWithImpl;
@useResult
$Res call({
 Profiles profile, List<UserSnsLinks> snsLinks, String? avatarUrl
});


$ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileWithSnsLinksCopyWithImpl<$Res>
    implements $ProfileWithSnsLinksCopyWith<$Res> {
  _$ProfileWithSnsLinksCopyWithImpl(this._self, this._then);

  final ProfileWithSnsLinks _self;
  final $Res Function(ProfileWithSnsLinks) _then;

/// Create a copy of ProfileWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? snsLinks = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self.snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<UserSnsLinks>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfilesCopyWith<$Res> get profile {
  
  return $ProfilesCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileWithSnsLinks].
extension ProfileWithSnsLinksPatterns on ProfileWithSnsLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileWithSnsLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileWithSnsLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileWithSnsLinks value)  $default,){
final _that = this;
switch (_that) {
case _ProfileWithSnsLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileWithSnsLinks value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileWithSnsLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profiles profile,  List<UserSnsLinks> snsLinks,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileWithSnsLinks() when $default != null:
return $default(_that.profile,_that.snsLinks,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profiles profile,  List<UserSnsLinks> snsLinks,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ProfileWithSnsLinks():
return $default(_that.profile,_that.snsLinks,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profiles profile,  List<UserSnsLinks> snsLinks,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProfileWithSnsLinks() when $default != null:
return $default(_that.profile,_that.snsLinks,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileWithSnsLinks implements ProfileWithSnsLinks {
  const _ProfileWithSnsLinks({required this.profile, required final  List<UserSnsLinks> snsLinks, required this.avatarUrl}): _snsLinks = snsLinks;
  factory _ProfileWithSnsLinks.fromJson(Map<String, dynamic> json) => _$ProfileWithSnsLinksFromJson(json);

@override final  Profiles profile;
 final  List<UserSnsLinks> _snsLinks;
@override List<UserSnsLinks> get snsLinks {
  if (_snsLinks is EqualUnmodifiableListView) return _snsLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snsLinks);
}

@override final  String? avatarUrl;

/// Create a copy of ProfileWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileWithSnsLinksCopyWith<_ProfileWithSnsLinks> get copyWith => __$ProfileWithSnsLinksCopyWithImpl<_ProfileWithSnsLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileWithSnsLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileWithSnsLinks&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other._snsLinks, _snsLinks)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(_snsLinks),avatarUrl);

@override
String toString() {
  return 'ProfileWithSnsLinks(profile: $profile, snsLinks: $snsLinks, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfileWithSnsLinksCopyWith<$Res> implements $ProfileWithSnsLinksCopyWith<$Res> {
  factory _$ProfileWithSnsLinksCopyWith(_ProfileWithSnsLinks value, $Res Function(_ProfileWithSnsLinks) _then) = __$ProfileWithSnsLinksCopyWithImpl;
@override @useResult
$Res call({
 Profiles profile, List<UserSnsLinks> snsLinks, String? avatarUrl
});


@override $ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileWithSnsLinksCopyWithImpl<$Res>
    implements _$ProfileWithSnsLinksCopyWith<$Res> {
  __$ProfileWithSnsLinksCopyWithImpl(this._self, this._then);

  final _ProfileWithSnsLinks _self;
  final $Res Function(_ProfileWithSnsLinks) _then;

/// Create a copy of ProfileWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? snsLinks = null,Object? avatarUrl = freezed,}) {
  return _then(_ProfileWithSnsLinks(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self._snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<UserSnsLinks>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileWithSnsLinks
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
