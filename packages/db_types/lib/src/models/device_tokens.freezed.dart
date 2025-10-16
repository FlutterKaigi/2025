// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceTokens {

 Devices get device; DeviceApnsTokens? get apnsToken; DeviceFcmTokens? get fcmToken; List<DeviceApnsLiveActivityTokens> get apnsLiveActivityTokens;
/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceTokensCopyWith<DeviceTokens> get copyWith => _$DeviceTokensCopyWithImpl<DeviceTokens>(this as DeviceTokens, _$identity);

  /// Serializes this DeviceTokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceTokens&&(identical(other.device, device) || other.device == device)&&(identical(other.apnsToken, apnsToken) || other.apnsToken == apnsToken)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&const DeepCollectionEquality().equals(other.apnsLiveActivityTokens, apnsLiveActivityTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,apnsToken,fcmToken,const DeepCollectionEquality().hash(apnsLiveActivityTokens));

@override
String toString() {
  return 'DeviceTokens(device: $device, apnsToken: $apnsToken, fcmToken: $fcmToken, apnsLiveActivityTokens: $apnsLiveActivityTokens)';
}


}

/// @nodoc
abstract mixin class $DeviceTokensCopyWith<$Res>  {
  factory $DeviceTokensCopyWith(DeviceTokens value, $Res Function(DeviceTokens) _then) = _$DeviceTokensCopyWithImpl;
@useResult
$Res call({
 Devices device, DeviceApnsTokens? apnsToken, DeviceFcmTokens? fcmToken, List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens
});


$DevicesCopyWith<$Res> get device;$DeviceApnsTokensCopyWith<$Res>? get apnsToken;$DeviceFcmTokensCopyWith<$Res>? get fcmToken;

}
/// @nodoc
class _$DeviceTokensCopyWithImpl<$Res>
    implements $DeviceTokensCopyWith<$Res> {
  _$DeviceTokensCopyWithImpl(this._self, this._then);

  final DeviceTokens _self;
  final $Res Function(DeviceTokens) _then;

/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? apnsToken = freezed,Object? fcmToken = freezed,Object? apnsLiveActivityTokens = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Devices,apnsToken: freezed == apnsToken ? _self.apnsToken : apnsToken // ignore: cast_nullable_to_non_nullable
as DeviceApnsTokens?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as DeviceFcmTokens?,apnsLiveActivityTokens: null == apnsLiveActivityTokens ? _self.apnsLiveActivityTokens : apnsLiveActivityTokens // ignore: cast_nullable_to_non_nullable
as List<DeviceApnsLiveActivityTokens>,
  ));
}
/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevicesCopyWith<$Res> get device {
  
  return $DevicesCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceApnsTokensCopyWith<$Res>? get apnsToken {
    if (_self.apnsToken == null) {
    return null;
  }

  return $DeviceApnsTokensCopyWith<$Res>(_self.apnsToken!, (value) {
    return _then(_self.copyWith(apnsToken: value));
  });
}/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceFcmTokensCopyWith<$Res>? get fcmToken {
    if (_self.fcmToken == null) {
    return null;
  }

  return $DeviceFcmTokensCopyWith<$Res>(_self.fcmToken!, (value) {
    return _then(_self.copyWith(fcmToken: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceTokens].
extension DeviceTokensPatterns on DeviceTokens {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceTokens value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceTokens() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceTokens value)  $default,){
final _that = this;
switch (_that) {
case _DeviceTokens():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceTokens value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceTokens() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Devices device,  DeviceApnsTokens? apnsToken,  DeviceFcmTokens? fcmToken,  List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceTokens() when $default != null:
return $default(_that.device,_that.apnsToken,_that.fcmToken,_that.apnsLiveActivityTokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Devices device,  DeviceApnsTokens? apnsToken,  DeviceFcmTokens? fcmToken,  List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens)  $default,) {final _that = this;
switch (_that) {
case _DeviceTokens():
return $default(_that.device,_that.apnsToken,_that.fcmToken,_that.apnsLiveActivityTokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Devices device,  DeviceApnsTokens? apnsToken,  DeviceFcmTokens? fcmToken,  List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens)?  $default,) {final _that = this;
switch (_that) {
case _DeviceTokens() when $default != null:
return $default(_that.device,_that.apnsToken,_that.fcmToken,_that.apnsLiveActivityTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceTokens implements DeviceTokens {
  const _DeviceTokens({required this.device, required this.apnsToken, required this.fcmToken, required final  List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens}): _apnsLiveActivityTokens = apnsLiveActivityTokens;
  factory _DeviceTokens.fromJson(Map<String, dynamic> json) => _$DeviceTokensFromJson(json);

@override final  Devices device;
@override final  DeviceApnsTokens? apnsToken;
@override final  DeviceFcmTokens? fcmToken;
 final  List<DeviceApnsLiveActivityTokens> _apnsLiveActivityTokens;
@override List<DeviceApnsLiveActivityTokens> get apnsLiveActivityTokens {
  if (_apnsLiveActivityTokens is EqualUnmodifiableListView) return _apnsLiveActivityTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_apnsLiveActivityTokens);
}


/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceTokensCopyWith<_DeviceTokens> get copyWith => __$DeviceTokensCopyWithImpl<_DeviceTokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceTokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceTokens&&(identical(other.device, device) || other.device == device)&&(identical(other.apnsToken, apnsToken) || other.apnsToken == apnsToken)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&const DeepCollectionEquality().equals(other._apnsLiveActivityTokens, _apnsLiveActivityTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,apnsToken,fcmToken,const DeepCollectionEquality().hash(_apnsLiveActivityTokens));

@override
String toString() {
  return 'DeviceTokens(device: $device, apnsToken: $apnsToken, fcmToken: $fcmToken, apnsLiveActivityTokens: $apnsLiveActivityTokens)';
}


}

/// @nodoc
abstract mixin class _$DeviceTokensCopyWith<$Res> implements $DeviceTokensCopyWith<$Res> {
  factory _$DeviceTokensCopyWith(_DeviceTokens value, $Res Function(_DeviceTokens) _then) = __$DeviceTokensCopyWithImpl;
@override @useResult
$Res call({
 Devices device, DeviceApnsTokens? apnsToken, DeviceFcmTokens? fcmToken, List<DeviceApnsLiveActivityTokens> apnsLiveActivityTokens
});


@override $DevicesCopyWith<$Res> get device;@override $DeviceApnsTokensCopyWith<$Res>? get apnsToken;@override $DeviceFcmTokensCopyWith<$Res>? get fcmToken;

}
/// @nodoc
class __$DeviceTokensCopyWithImpl<$Res>
    implements _$DeviceTokensCopyWith<$Res> {
  __$DeviceTokensCopyWithImpl(this._self, this._then);

  final _DeviceTokens _self;
  final $Res Function(_DeviceTokens) _then;

/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? apnsToken = freezed,Object? fcmToken = freezed,Object? apnsLiveActivityTokens = null,}) {
  return _then(_DeviceTokens(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Devices,apnsToken: freezed == apnsToken ? _self.apnsToken : apnsToken // ignore: cast_nullable_to_non_nullable
as DeviceApnsTokens?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as DeviceFcmTokens?,apnsLiveActivityTokens: null == apnsLiveActivityTokens ? _self._apnsLiveActivityTokens : apnsLiveActivityTokens // ignore: cast_nullable_to_non_nullable
as List<DeviceApnsLiveActivityTokens>,
  ));
}

/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevicesCopyWith<$Res> get device {
  
  return $DevicesCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceApnsTokensCopyWith<$Res>? get apnsToken {
    if (_self.apnsToken == null) {
    return null;
  }

  return $DeviceApnsTokensCopyWith<$Res>(_self.apnsToken!, (value) {
    return _then(_self.copyWith(apnsToken: value));
  });
}/// Create a copy of DeviceTokens
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceFcmTokensCopyWith<$Res>? get fcmToken {
    if (_self.fcmToken == null) {
    return null;
  }

  return $DeviceFcmTokensCopyWith<$Res>(_self.fcmToken!, (value) {
    return _then(_self.copyWith(fcmToken: value));
  });
}
}

// dart format on
