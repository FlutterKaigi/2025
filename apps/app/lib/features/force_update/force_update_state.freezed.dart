// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForceUpdateState {

 bool get isUpdateRequired; AppVersionResponse? get versionInfo; String? get platform;
/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateStateCopyWith<ForceUpdateState> get copyWith => _$ForceUpdateStateCopyWithImpl<ForceUpdateState>(this as ForceUpdateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateState&&(identical(other.isUpdateRequired, isUpdateRequired) || other.isUpdateRequired == isUpdateRequired)&&(identical(other.versionInfo, versionInfo) || other.versionInfo == versionInfo)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdateRequired,versionInfo,platform);

@override
String toString() {
  return 'ForceUpdateState(isUpdateRequired: $isUpdateRequired, versionInfo: $versionInfo, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateStateCopyWith<$Res>  {
  factory $ForceUpdateStateCopyWith(ForceUpdateState value, $Res Function(ForceUpdateState) _then) = _$ForceUpdateStateCopyWithImpl;
@useResult
$Res call({
 bool isUpdateRequired, AppVersionResponse? versionInfo, String? platform
});


$AppVersionResponseCopyWith<$Res>? get versionInfo;

}
/// @nodoc
class _$ForceUpdateStateCopyWithImpl<$Res>
    implements $ForceUpdateStateCopyWith<$Res> {
  _$ForceUpdateStateCopyWithImpl(this._self, this._then);

  final ForceUpdateState _self;
  final $Res Function(ForceUpdateState) _then;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isUpdateRequired = null,Object? versionInfo = freezed,Object? platform = freezed,}) {
  return _then(_self.copyWith(
isUpdateRequired: null == isUpdateRequired ? _self.isUpdateRequired : isUpdateRequired // ignore: cast_nullable_to_non_nullable
as bool,versionInfo: freezed == versionInfo ? _self.versionInfo : versionInfo // ignore: cast_nullable_to_non_nullable
as AppVersionResponse?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionResponseCopyWith<$Res>? get versionInfo {
    if (_self.versionInfo == null) {
    return null;
  }

  return $AppVersionResponseCopyWith<$Res>(_self.versionInfo!, (value) {
    return _then(_self.copyWith(versionInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForceUpdateState].
extension ForceUpdateStatePatterns on ForceUpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForceUpdateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForceUpdateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForceUpdateState value)  $default,){
final _that = this;
switch (_that) {
case _ForceUpdateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForceUpdateState value)?  $default,){
final _that = this;
switch (_that) {
case _ForceUpdateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isUpdateRequired,  AppVersionResponse? versionInfo,  String? platform)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForceUpdateState() when $default != null:
return $default(_that.isUpdateRequired,_that.versionInfo,_that.platform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isUpdateRequired,  AppVersionResponse? versionInfo,  String? platform)  $default,) {final _that = this;
switch (_that) {
case _ForceUpdateState():
return $default(_that.isUpdateRequired,_that.versionInfo,_that.platform);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isUpdateRequired,  AppVersionResponse? versionInfo,  String? platform)?  $default,) {final _that = this;
switch (_that) {
case _ForceUpdateState() when $default != null:
return $default(_that.isUpdateRequired,_that.versionInfo,_that.platform);case _:
  return null;

}
}

}

/// @nodoc


class _ForceUpdateState implements ForceUpdateState {
  const _ForceUpdateState({this.isUpdateRequired = false, this.versionInfo, this.platform});
  

@override@JsonKey() final  bool isUpdateRequired;
@override final  AppVersionResponse? versionInfo;
@override final  String? platform;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateStateCopyWith<_ForceUpdateState> get copyWith => __$ForceUpdateStateCopyWithImpl<_ForceUpdateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdateState&&(identical(other.isUpdateRequired, isUpdateRequired) || other.isUpdateRequired == isUpdateRequired)&&(identical(other.versionInfo, versionInfo) || other.versionInfo == versionInfo)&&(identical(other.platform, platform) || other.platform == platform));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdateRequired,versionInfo,platform);

@override
String toString() {
  return 'ForceUpdateState(isUpdateRequired: $isUpdateRequired, versionInfo: $versionInfo, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateStateCopyWith<$Res> implements $ForceUpdateStateCopyWith<$Res> {
  factory _$ForceUpdateStateCopyWith(_ForceUpdateState value, $Res Function(_ForceUpdateState) _then) = __$ForceUpdateStateCopyWithImpl;
@override @useResult
$Res call({
 bool isUpdateRequired, AppVersionResponse? versionInfo, String? platform
});


@override $AppVersionResponseCopyWith<$Res>? get versionInfo;

}
/// @nodoc
class __$ForceUpdateStateCopyWithImpl<$Res>
    implements _$ForceUpdateStateCopyWith<$Res> {
  __$ForceUpdateStateCopyWithImpl(this._self, this._then);

  final _ForceUpdateState _self;
  final $Res Function(_ForceUpdateState) _then;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isUpdateRequired = null,Object? versionInfo = freezed,Object? platform = freezed,}) {
  return _then(_ForceUpdateState(
isUpdateRequired: null == isUpdateRequired ? _self.isUpdateRequired : isUpdateRequired // ignore: cast_nullable_to_non_nullable
as bool,versionInfo: freezed == versionInfo ? _self.versionInfo : versionInfo // ignore: cast_nullable_to_non_nullable
as AppVersionResponse?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionResponseCopyWith<$Res>? get versionInfo {
    if (_self.versionInfo == null) {
    return null;
  }

  return $AppVersionResponseCopyWith<$Res>(_self.versionInfo!, (value) {
    return _then(_self.copyWith(versionInfo: value));
  });
}
}

// dart format on
