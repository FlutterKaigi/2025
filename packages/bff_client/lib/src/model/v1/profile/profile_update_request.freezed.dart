// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileUpdateRequest {

 String? get name; String? get comment; bool? get isAdult; List<SnsLinkRequest>? get snsLinks;
/// Create a copy of ProfileUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdateRequestCopyWith<ProfileUpdateRequest> get copyWith => _$ProfileUpdateRequestCopyWithImpl<ProfileUpdateRequest>(this as ProfileUpdateRequest, _$identity);

  /// Serializes this ProfileUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&const DeepCollectionEquality().equals(other.snsLinks, snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comment,isAdult,const DeepCollectionEquality().hash(snsLinks));

@override
String toString() {
  return 'ProfileUpdateRequest(name: $name, comment: $comment, isAdult: $isAdult, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdateRequestCopyWith<$Res>  {
  factory $ProfileUpdateRequestCopyWith(ProfileUpdateRequest value, $Res Function(ProfileUpdateRequest) _then) = _$ProfileUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? comment, bool? isAdult, List<SnsLinkRequest>? snsLinks
});




}
/// @nodoc
class _$ProfileUpdateRequestCopyWithImpl<$Res>
    implements $ProfileUpdateRequestCopyWith<$Res> {
  _$ProfileUpdateRequestCopyWithImpl(this._self, this._then);

  final ProfileUpdateRequest _self;
  final $Res Function(ProfileUpdateRequest) _then;

/// Create a copy of ProfileUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? comment = freezed,Object? isAdult = freezed,Object? snsLinks = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool?,snsLinks: freezed == snsLinks ? _self.snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLinkRequest>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileUpdateRequest].
extension ProfileUpdateRequestPatterns on ProfileUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? comment,  bool? isAdult,  List<SnsLinkRequest>? snsLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUpdateRequest() when $default != null:
return $default(_that.name,_that.comment,_that.isAdult,_that.snsLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? comment,  bool? isAdult,  List<SnsLinkRequest>? snsLinks)  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateRequest():
return $default(_that.name,_that.comment,_that.isAdult,_that.snsLinks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? comment,  bool? isAdult,  List<SnsLinkRequest>? snsLinks)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUpdateRequest() when $default != null:
return $default(_that.name,_that.comment,_that.isAdult,_that.snsLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileUpdateRequest implements ProfileUpdateRequest {
  const _ProfileUpdateRequest({this.name, this.comment, this.isAdult, final  List<SnsLinkRequest>? snsLinks}): _snsLinks = snsLinks;
  factory _ProfileUpdateRequest.fromJson(Map<String, dynamic> json) => _$ProfileUpdateRequestFromJson(json);

@override final  String? name;
@override final  String? comment;
@override final  bool? isAdult;
 final  List<SnsLinkRequest>? _snsLinks;
@override List<SnsLinkRequest>? get snsLinks {
  final value = _snsLinks;
  if (value == null) return null;
  if (_snsLinks is EqualUnmodifiableListView) return _snsLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProfileUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdateRequestCopyWith<_ProfileUpdateRequest> get copyWith => __$ProfileUpdateRequestCopyWithImpl<_ProfileUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&const DeepCollectionEquality().equals(other._snsLinks, _snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comment,isAdult,const DeepCollectionEquality().hash(_snsLinks));

@override
String toString() {
  return 'ProfileUpdateRequest(name: $name, comment: $comment, isAdult: $isAdult, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdateRequestCopyWith<$Res> implements $ProfileUpdateRequestCopyWith<$Res> {
  factory _$ProfileUpdateRequestCopyWith(_ProfileUpdateRequest value, $Res Function(_ProfileUpdateRequest) _then) = __$ProfileUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? comment, bool? isAdult, List<SnsLinkRequest>? snsLinks
});




}
/// @nodoc
class __$ProfileUpdateRequestCopyWithImpl<$Res>
    implements _$ProfileUpdateRequestCopyWith<$Res> {
  __$ProfileUpdateRequestCopyWithImpl(this._self, this._then);

  final _ProfileUpdateRequest _self;
  final $Res Function(_ProfileUpdateRequest) _then;

/// Create a copy of ProfileUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? comment = freezed,Object? isAdult = freezed,Object? snsLinks = freezed,}) {
  return _then(_ProfileUpdateRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool?,snsLinks: freezed == snsLinks ? _self._snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLinkRequest>?,
  ));
}


}

// dart format on
