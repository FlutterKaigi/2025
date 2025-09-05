// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sns_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnsLink {

 SnsType get snsType; String get value;
/// Create a copy of SnsLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnsLinkCopyWith<SnsLink> get copyWith => _$SnsLinkCopyWithImpl<SnsLink>(this as SnsLink, _$identity);

  /// Serializes this SnsLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnsLink&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLink(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class $SnsLinkCopyWith<$Res>  {
  factory $SnsLinkCopyWith(SnsLink value, $Res Function(SnsLink) _then) = _$SnsLinkCopyWithImpl;
@useResult
$Res call({
 SnsType snsType, String value
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
@pragma('vm:prefer-inline') @override $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_self.copyWith(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnsType snsType,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
return $default(_that.snsType,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnsType snsType,  String value)  $default,) {final _that = this;
switch (_that) {
case _SnsLink():
return $default(_that.snsType,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnsType snsType,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SnsLink() when $default != null:
return $default(_that.snsType,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnsLink implements SnsLink {
  const _SnsLink({required this.snsType, required this.value});
  factory _SnsLink.fromJson(Map<String, dynamic> json) => _$SnsLinkFromJson(json);

@override final  SnsType snsType;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnsLink&&(identical(other.snsType, snsType) || other.snsType == snsType)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snsType,value);

@override
String toString() {
  return 'SnsLink(snsType: $snsType, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SnsLinkCopyWith<$Res> implements $SnsLinkCopyWith<$Res> {
  factory _$SnsLinkCopyWith(_SnsLink value, $Res Function(_SnsLink) _then) = __$SnsLinkCopyWithImpl;
@override @useResult
$Res call({
 SnsType snsType, String value
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
@override @pragma('vm:prefer-inline') $Res call({Object? snsType = null,Object? value = null,}) {
  return _then(_SnsLink(
snsType: null == snsType ? _self.snsType : snsType // ignore: cast_nullable_to_non_nullable
as SnsType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
