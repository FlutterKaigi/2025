// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_websocket_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserWebsocketPayload _$UserWebsocketPayloadFromJson(
  Map<String, dynamic> json
) {
    return UserWebsocketProfileSharePayload.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserWebsocketPayload {

 ProfileShareWebsocketPayload get profileShare;
/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketPayloadCopyWith<UserWebsocketPayload> get copyWith => _$UserWebsocketPayloadCopyWithImpl<UserWebsocketPayload>(this as UserWebsocketPayload, _$identity);

  /// Serializes this UserWebsocketPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketPayload&&(identical(other.profileShare, profileShare) || other.profileShare == profileShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileShare);

@override
String toString() {
  return 'UserWebsocketPayload(profileShare: $profileShare)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketPayloadCopyWith<$Res>  {
  factory $UserWebsocketPayloadCopyWith(UserWebsocketPayload value, $Res Function(UserWebsocketPayload) _then) = _$UserWebsocketPayloadCopyWithImpl;
@useResult
$Res call({
 ProfileShareWebsocketPayload profileShare
});


$ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare;

}
/// @nodoc
class _$UserWebsocketPayloadCopyWithImpl<$Res>
    implements $UserWebsocketPayloadCopyWith<$Res> {
  _$UserWebsocketPayloadCopyWithImpl(this._self, this._then);

  final UserWebsocketPayload _self;
  final $Res Function(UserWebsocketPayload) _then;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileShare = null,}) {
  return _then(_self.copyWith(
profileShare: null == profileShare ? _self.profileShare : profileShare // ignore: cast_nullable_to_non_nullable
as ProfileShareWebsocketPayload,
  ));
}
/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare {
  
  return $ProfileShareWebsocketPayloadCopyWith<$Res>(_self.profileShare, (value) {
    return _then(_self.copyWith(profileShare: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserWebsocketPayload].
extension UserWebsocketPayloadPatterns on UserWebsocketPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserWebsocketProfileSharePayload value)?  profileShare,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserWebsocketProfileSharePayload value)  profileShare,}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload():
return profileShare(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserWebsocketProfileSharePayload value)?  profileShare,}){
final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProfileShareWebsocketPayload profileShare)?  profileShare,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that.profileShare);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProfileShareWebsocketPayload profileShare)  profileShare,}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload():
return profileShare(_that.profileShare);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProfileShareWebsocketPayload profileShare)?  profileShare,}) {final _that = this;
switch (_that) {
case UserWebsocketProfileSharePayload() when profileShare != null:
return profileShare(_that.profileShare);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UserWebsocketProfileSharePayload implements UserWebsocketPayload {
  const UserWebsocketProfileSharePayload({required this.profileShare});
  factory UserWebsocketProfileSharePayload.fromJson(Map<String, dynamic> json) => _$UserWebsocketProfileSharePayloadFromJson(json);

@override final  ProfileShareWebsocketPayload profileShare;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWebsocketProfileSharePayloadCopyWith<UserWebsocketProfileSharePayload> get copyWith => _$UserWebsocketProfileSharePayloadCopyWithImpl<UserWebsocketProfileSharePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWebsocketProfileSharePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWebsocketProfileSharePayload&&(identical(other.profileShare, profileShare) || other.profileShare == profileShare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileShare);

@override
String toString() {
  return 'UserWebsocketPayload.profileShare(profileShare: $profileShare)';
}


}

/// @nodoc
abstract mixin class $UserWebsocketProfileSharePayloadCopyWith<$Res> implements $UserWebsocketPayloadCopyWith<$Res> {
  factory $UserWebsocketProfileSharePayloadCopyWith(UserWebsocketProfileSharePayload value, $Res Function(UserWebsocketProfileSharePayload) _then) = _$UserWebsocketProfileSharePayloadCopyWithImpl;
@override @useResult
$Res call({
 ProfileShareWebsocketPayload profileShare
});


@override $ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare;

}
/// @nodoc
class _$UserWebsocketProfileSharePayloadCopyWithImpl<$Res>
    implements $UserWebsocketProfileSharePayloadCopyWith<$Res> {
  _$UserWebsocketProfileSharePayloadCopyWithImpl(this._self, this._then);

  final UserWebsocketProfileSharePayload _self;
  final $Res Function(UserWebsocketProfileSharePayload) _then;

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileShare = null,}) {
  return _then(UserWebsocketProfileSharePayload(
profileShare: null == profileShare ? _self.profileShare : profileShare // ignore: cast_nullable_to_non_nullable
as ProfileShareWebsocketPayload,
  ));
}

/// Create a copy of UserWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileShareWebsocketPayloadCopyWith<$Res> get profileShare {
  
  return $ProfileShareWebsocketPayloadCopyWith<$Res>(_self.profileShare, (value) {
    return _then(_self.copyWith(profileShare: value));
  });
}
}

// dart format on
