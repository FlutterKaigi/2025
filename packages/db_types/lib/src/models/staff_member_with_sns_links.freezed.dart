// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_member_with_sns_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffMemberWithSnsLinks {

 String get id; String get name; String get iconName; String get iconUrl; String? get greeting; List<SnsLink> get snsLinks;
/// Create a copy of StaffMemberWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffMemberWithSnsLinksCopyWith<StaffMemberWithSnsLinks> get copyWith => _$StaffMemberWithSnsLinksCopyWithImpl<StaffMemberWithSnsLinks>(this as StaffMemberWithSnsLinks, _$identity);

  /// Serializes this StaffMemberWithSnsLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffMemberWithSnsLinks&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&const DeepCollectionEquality().equals(other.snsLinks, snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconName,iconUrl,greeting,const DeepCollectionEquality().hash(snsLinks));

@override
String toString() {
  return 'StaffMemberWithSnsLinks(id: $id, name: $name, iconName: $iconName, iconUrl: $iconUrl, greeting: $greeting, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class $StaffMemberWithSnsLinksCopyWith<$Res>  {
  factory $StaffMemberWithSnsLinksCopyWith(StaffMemberWithSnsLinks value, $Res Function(StaffMemberWithSnsLinks) _then) = _$StaffMemberWithSnsLinksCopyWithImpl;
@useResult
$Res call({
 String id, String name, String iconName, String iconUrl, String? greeting, List<SnsLink> snsLinks
});




}
/// @nodoc
class _$StaffMemberWithSnsLinksCopyWithImpl<$Res>
    implements $StaffMemberWithSnsLinksCopyWith<$Res> {
  _$StaffMemberWithSnsLinksCopyWithImpl(this._self, this._then);

  final StaffMemberWithSnsLinks _self;
  final $Res Function(StaffMemberWithSnsLinks) _then;

/// Create a copy of StaffMemberWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconName = null,Object? iconUrl = null,Object? greeting = freezed,Object? snsLinks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,greeting: freezed == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as String?,snsLinks: null == snsLinks ? _self.snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLink>,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffMemberWithSnsLinks].
extension StaffMemberWithSnsLinksPatterns on StaffMemberWithSnsLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffMemberWithSnsLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffMemberWithSnsLinks value)  $default,){
final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffMemberWithSnsLinks value)?  $default,){
final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String iconName,  String iconUrl,  String? greeting,  List<SnsLink> snsLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks() when $default != null:
return $default(_that.id,_that.name,_that.iconName,_that.iconUrl,_that.greeting,_that.snsLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String iconName,  String iconUrl,  String? greeting,  List<SnsLink> snsLinks)  $default,) {final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks():
return $default(_that.id,_that.name,_that.iconName,_that.iconUrl,_that.greeting,_that.snsLinks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String iconName,  String iconUrl,  String? greeting,  List<SnsLink> snsLinks)?  $default,) {final _that = this;
switch (_that) {
case _StaffMemberWithSnsLinks() when $default != null:
return $default(_that.id,_that.name,_that.iconName,_that.iconUrl,_that.greeting,_that.snsLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffMemberWithSnsLinks implements StaffMemberWithSnsLinks {
  const _StaffMemberWithSnsLinks({required this.id, required this.name, required this.iconName, required this.iconUrl, this.greeting, required final  List<SnsLink> snsLinks}): _snsLinks = snsLinks;
  factory _StaffMemberWithSnsLinks.fromJson(Map<String, dynamic> json) => _$StaffMemberWithSnsLinksFromJson(json);

@override final  String id;
@override final  String name;
@override final  String iconName;
@override final  String iconUrl;
@override final  String? greeting;
 final  List<SnsLink> _snsLinks;
@override List<SnsLink> get snsLinks {
  if (_snsLinks is EqualUnmodifiableListView) return _snsLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snsLinks);
}


/// Create a copy of StaffMemberWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffMemberWithSnsLinksCopyWith<_StaffMemberWithSnsLinks> get copyWith => __$StaffMemberWithSnsLinksCopyWithImpl<_StaffMemberWithSnsLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffMemberWithSnsLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffMemberWithSnsLinks&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&const DeepCollectionEquality().equals(other._snsLinks, _snsLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconName,iconUrl,greeting,const DeepCollectionEquality().hash(_snsLinks));

@override
String toString() {
  return 'StaffMemberWithSnsLinks(id: $id, name: $name, iconName: $iconName, iconUrl: $iconUrl, greeting: $greeting, snsLinks: $snsLinks)';
}


}

/// @nodoc
abstract mixin class _$StaffMemberWithSnsLinksCopyWith<$Res> implements $StaffMemberWithSnsLinksCopyWith<$Res> {
  factory _$StaffMemberWithSnsLinksCopyWith(_StaffMemberWithSnsLinks value, $Res Function(_StaffMemberWithSnsLinks) _then) = __$StaffMemberWithSnsLinksCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String iconName, String iconUrl, String? greeting, List<SnsLink> snsLinks
});




}
/// @nodoc
class __$StaffMemberWithSnsLinksCopyWithImpl<$Res>
    implements _$StaffMemberWithSnsLinksCopyWith<$Res> {
  __$StaffMemberWithSnsLinksCopyWithImpl(this._self, this._then);

  final _StaffMemberWithSnsLinks _self;
  final $Res Function(_StaffMemberWithSnsLinks) _then;

/// Create a copy of StaffMemberWithSnsLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconName = null,Object? iconUrl = null,Object? greeting = freezed,Object? snsLinks = null,}) {
  return _then(_StaffMemberWithSnsLinks(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,greeting: freezed == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as String?,snsLinks: null == snsLinks ? _self._snsLinks : snsLinks // ignore: cast_nullable_to_non_nullable
as List<SnsLink>,
  ));
}


}


/// @nodoc
mixin _$SnsLink {

 SnsType get type; String get value;
/// Create a copy of SnsLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnsLinkCopyWith<SnsLink> get copyWith => _$SnsLinkCopyWithImpl<SnsLink>(this as SnsLink, _$identity);

  /// Serializes this SnsLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnsLink&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,value);

@override
String toString() {
  return 'SnsLink(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $SnsLinkCopyWith<$Res>  {
  factory $SnsLinkCopyWith(SnsLink value, $Res Function(SnsLink) _then) = _$SnsLinkCopyWithImpl;
@useResult
$Res call({
 SnsType type, String value
});




}
/// @nodoc
class _$SnsLinkCopyWithImpl<$Res>
    implements $SnsLinkCopyWith<$Res> {
  _$SnsLinkCopyWithImpl(this._self, this._then);

  final SnsLink _self;
  final $Res Function(SnsLink) _then;

/// Create a copy of SnsLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? value = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnsType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnsLink].
extension SnsLinkPatterns on SnsLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnsLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnsLink value)  $default,){
final _that = this;
switch (_that) {
case _SnsLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnsLink value)?  $default,){
final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnsType type,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnsType type,  String value)  $default,) {final _that = this;
switch (_that) {
case _SnsLink():
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnsType type,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
return $default(_that.type,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnsLink implements SnsLink {
  const _SnsLink({required this.type, required this.value});
  factory _SnsLink.fromJson(Map<String, dynamic> json) => _$SnsLinkFromJson(json);

@override final  SnsType type;
@override final  String value;

/// Create a copy of SnsLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnsLinkCopyWith<_SnsLink> get copyWith => __$SnsLinkCopyWithImpl<_SnsLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnsLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnsLink&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,value);

@override
String toString() {
  return 'SnsLink(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SnsLinkCopyWith<$Res> implements $SnsLinkCopyWith<$Res> {
  factory _$SnsLinkCopyWith(_SnsLink value, $Res Function(_SnsLink) _then) = __$SnsLinkCopyWithImpl;
@override @useResult
$Res call({
 SnsType type, String value
});




}
/// @nodoc
class __$SnsLinkCopyWithImpl<$Res>
    implements _$SnsLinkCopyWith<$Res> {
  __$SnsLinkCopyWithImpl(this._self, this._then);

  final _SnsLink _self;
  final $Res Function(_SnsLink) _then;

/// Create a copy of SnsLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? value = null,}) {
  return _then(_SnsLink(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnsType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
