// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_with_sns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileWithSns {

 Profiles get profile; List<SnsLink> get snsLinks;
/// Create a copy of ProfileWithSns
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileWithSnsCopyWith<ProfileWithSns> get copyWith => _$ProfileWithSnsCopyWithImpl<ProfileWithSns>(this as ProfileWithSns, _$identity);

  /// Serializes this ProfileWithSns to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileWithSns&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.snsLinks, snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(snsLinks));

@override
String toString() {
  return 'ProfileWithSns(profile: $profile, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class $ProfileWithSnsCopyWith<$Res>  {
  factory $ProfileWithSnsCopyWith(ProfileWithSns value, $Res Function(ProfileWithSns) _then) = _$ProfileWithSnsCopyWithImpl;
@useResult
$Res call({
 Profiles profile, List<SnsLink> snsLinks
});


$ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileWithSnsCopyWithImpl<$Res>
    implements $ProfileWithSnsCopyWith<$Res> {
  _$ProfileWithSnsCopyWithImpl(this._self, this._then);

  final ProfileWithSns _self;
  final $Res Function(ProfileWithSns) _then;

/// Create a copy of ProfileWithSns
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? snsLinks = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self.snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLink>,
  ));
}
/// Create a copy of ProfileWithSns
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfilesCopyWith<$Res> get profile {
  
  return $ProfilesCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileWithSns].
extension ProfileWithSnsPatterns on ProfileWithSns {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileWithSns value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileWithSns() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileWithSns value)  $default,){
final _that = this;
switch (_that) {
case _ProfileWithSns():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileWithSns value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileWithSns() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profiles profile,  List<SnsLink> snsLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileWithSns() when $default != null:
return $default(_that.profile,_that.snsLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profiles profile,  List<SnsLink> snsLinks)  $default,) {final _that = this;
switch (_that) {
case _ProfileWithSns():
return $default(_that.profile,_that.snsLinks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profiles profile,  List<SnsLink> snsLinks)?  $default,) {final _that = this;
switch (_that) {
case _ProfileWithSns() when $default != null:
return $default(_that.profile,_that.snsLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileWithSns implements ProfileWithSns {
  const _ProfileWithSns({required this.profile, required final  List<SnsLink> snsLinks}): _snsLinks = snsLinks;
  factory _ProfileWithSns.fromJson(Map<String, dynamic> json) => _$ProfileWithSnsFromJson(json);

@override final  Profiles profile;
 final  List<SnsLink> _snsLinks;
@override List<SnsLink> get snsLinks {
  if (_snsLinks is EqualUnmodifiableListView) return _snsLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snsLinks);
}


/// Create a copy of ProfileWithSns
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileWithSnsCopyWith<_ProfileWithSns> get copyWith => __$ProfileWithSnsCopyWithImpl<_ProfileWithSns>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileWithSnsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileWithSns&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other._snsLinks, _snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile,const DeepCollectionEquality().hash(_snsLinks));

@override
String toString() {
  return 'ProfileWithSns(profile: $profile, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class _$ProfileWithSnsCopyWith<$Res> implements $ProfileWithSnsCopyWith<$Res> {
  factory _$ProfileWithSnsCopyWith(_ProfileWithSns value, $Res Function(_ProfileWithSns) _then) = __$ProfileWithSnsCopyWithImpl;
@override @useResult
$Res call({
 Profiles profile, List<SnsLink> snsLinks
});


@override $ProfilesCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileWithSnsCopyWithImpl<$Res>
    implements _$ProfileWithSnsCopyWith<$Res> {
  __$ProfileWithSnsCopyWithImpl(this._self, this._then);

  final _ProfileWithSns _self;
  final $Res Function(_ProfileWithSns) _then;

/// Create a copy of ProfileWithSns
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? snsLinks = null,}) {
  return _then(_ProfileWithSns(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profiles,snsLinks: null == snsLinks ? _self._snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLink>,
  ));
}

/// Create a copy of ProfileWithSns
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
