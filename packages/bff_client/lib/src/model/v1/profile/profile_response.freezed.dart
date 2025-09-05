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

 Profiles get profile; List<SnsLink> get snsLinks; bool get canEditNameplate; String? get nameplateNote;
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
 Profiles profile, List<SnsLink> snsLinks, bool canEditNameplate, String? nameplateNote
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
as List<SnsLink>,canEditNameplate: null == canEditNameplate ? _self.canEditNameplate : canEditNameplate // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profiles profile,  List<SnsLink> snsLinks,  bool canEditNameplate,  String? nameplateNote)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profiles profile,  List<SnsLink> snsLinks,  bool canEditNameplate,  String? nameplateNote)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profiles profile,  List<SnsLink> snsLinks,  bool canEditNameplate,  String? nameplateNote)?  $default,) {final _that = this;
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
  const _ProfileResponse({required this.profile, required final  List<SnsLink> snsLinks, required this.canEditNameplate, this.nameplateNote}): _snsLinks = snsLinks;
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override final  Profiles profile;
 final  List<SnsLink> _snsLinks;
@override List<SnsLink> get snsLinks {
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
 Profiles profile, List<SnsLink> snsLinks, bool canEditNameplate, String? nameplateNote
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
as List<SnsLink>,canEditNameplate: null == canEditNameplate ? _self.canEditNameplate : canEditNameplate // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$Profiles {

 String get id; String get name; String get comment; bool get isAdult; DateTime get createdAt; DateTime get updatedAt; Uri? get avatarUrl;
/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilesCopyWith<Profiles> get copyWith => _$ProfilesCopyWithImpl<Profiles>(this as Profiles, _$identity);

  /// Serializes this Profiles to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profiles&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,comment,isAdult,createdAt,updatedAt,avatarUrl);

@override
String toString() {
  return 'Profiles(id: $id, name: $name, comment: $comment, isAdult: $isAdult, createdAt: $createdAt, updatedAt: $updatedAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProfilesCopyWith<$Res>  {
  factory $ProfilesCopyWith(Profiles value, $Res Function(Profiles) _then) = _$ProfilesCopyWithImpl;
@useResult
$Res call({
 String id, String name, String comment, bool isAdult, DateTime createdAt, DateTime updatedAt, Uri? avatarUrl
});




}
/// @nodoc
class _$ProfilesCopyWithImpl<$Res>
    implements $ProfilesCopyWith<$Res> {
  _$ProfilesCopyWithImpl(this._self, this._then);

  final Profiles _self;
  final $Res Function(Profiles) _then;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? comment = null,Object? isAdult = null,Object? createdAt = null,Object? updatedAt = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}

}


/// Adds pattern-matching-related methods to [Profiles].
extension ProfilesPatterns on Profiles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profiles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profiles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profiles value)  $default,){
final _that = this;
switch (_that) {
case _Profiles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profiles value)?  $default,){
final _that = this;
switch (_that) {
case _Profiles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String comment,  bool isAdult,  DateTime createdAt,  DateTime updatedAt,  Uri? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profiles() when $default != null:
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.createdAt,_that.updatedAt,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String comment,  bool isAdult,  DateTime createdAt,  DateTime updatedAt,  Uri? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _Profiles():
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.createdAt,_that.updatedAt,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String comment,  bool isAdult,  DateTime createdAt,  DateTime updatedAt,  Uri? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _Profiles() when $default != null:
return $default(_that.id,_that.name,_that.comment,_that.isAdult,_that.createdAt,_that.updatedAt,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profiles implements Profiles {
  const _Profiles({required this.id, required this.name, required this.comment, required this.isAdult, required this.createdAt, required this.updatedAt, required this.avatarUrl});
  factory _Profiles.fromJson(Map<String, dynamic> json) => _$ProfilesFromJson(json);

@override final  String id;
@override final  String name;
@override final  String comment;
@override final  bool isAdult;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  Uri? avatarUrl;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilesCopyWith<_Profiles> get copyWith => __$ProfilesCopyWithImpl<_Profiles>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfilesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profiles&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,comment,isAdult,createdAt,updatedAt,avatarUrl);

@override
String toString() {
  return 'Profiles(id: $id, name: $name, comment: $comment, isAdult: $isAdult, createdAt: $createdAt, updatedAt: $updatedAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfilesCopyWith<$Res> implements $ProfilesCopyWith<$Res> {
  factory _$ProfilesCopyWith(_Profiles value, $Res Function(_Profiles) _then) = __$ProfilesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String comment, bool isAdult, DateTime createdAt, DateTime updatedAt, Uri? avatarUrl
});




}
/// @nodoc
class __$ProfilesCopyWithImpl<$Res>
    implements _$ProfilesCopyWith<$Res> {
  __$ProfilesCopyWithImpl(this._self, this._then);

  final _Profiles _self;
  final $Res Function(_Profiles) _then;

/// Create a copy of Profiles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? comment = null,Object? isAdult = null,Object? createdAt = null,Object? updatedAt = null,Object? avatarUrl = freezed,}) {
  return _then(_Profiles(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

// dart format on
