// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_share_websocket_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ProfileShareWebsocketPayload _$ProfileShareWebsocketPayloadFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'ADD':
          return ProfileShareAddWebsocketPayload.fromJson(
            json
          );
                case 'UPDATE':
          return ProfileShareUpdateWebsocketPayload.fromJson(
            json
          );
                case 'DELETE':
          return ProfileShareDeleteWebsocketPayload.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ProfileShareWebsocketPayload',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProfileShareWebsocketPayload {



  /// Serializes this ProfileShareWebsocketPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareWebsocketPayload);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileShareWebsocketPayload()';
}


}

/// @nodoc
class $ProfileShareWebsocketPayloadCopyWith<$Res>  {
$ProfileShareWebsocketPayloadCopyWith(ProfileShareWebsocketPayload _, $Res Function(ProfileShareWebsocketPayload) __);
}


/// Adds pattern-matching-related methods to [ProfileShareWebsocketPayload].
extension ProfileShareWebsocketPayloadPatterns on ProfileShareWebsocketPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileShareAddWebsocketPayload value)?  add,TResult Function( ProfileShareUpdateWebsocketPayload value)?  update,TResult Function( ProfileShareDeleteWebsocketPayload value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload() when add != null:
return add(_that);case ProfileShareUpdateWebsocketPayload() when update != null:
return update(_that);case ProfileShareDeleteWebsocketPayload() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileShareAddWebsocketPayload value)  add,required TResult Function( ProfileShareUpdateWebsocketPayload value)  update,required TResult Function( ProfileShareDeleteWebsocketPayload value)  delete,}){
final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload():
return add(_that);case ProfileShareUpdateWebsocketPayload():
return update(_that);case ProfileShareDeleteWebsocketPayload():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileShareAddWebsocketPayload value)?  add,TResult? Function( ProfileShareUpdateWebsocketPayload value)?  update,TResult? Function( ProfileShareDeleteWebsocketPayload value)?  delete,}){
final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload() when add != null:
return add(_that);case ProfileShareUpdateWebsocketPayload() when update != null:
return update(_that);case ProfileShareDeleteWebsocketPayload() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProfileWithSns profileWithSns)?  add,TResult Function( ProfileWithSns profileWithSns)?  update,TResult Function( String profileId)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload() when add != null:
return add(_that.profileWithSns);case ProfileShareUpdateWebsocketPayload() when update != null:
return update(_that.profileWithSns);case ProfileShareDeleteWebsocketPayload() when delete != null:
return delete(_that.profileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProfileWithSns profileWithSns)  add,required TResult Function( ProfileWithSns profileWithSns)  update,required TResult Function( String profileId)  delete,}) {final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload():
return add(_that.profileWithSns);case ProfileShareUpdateWebsocketPayload():
return update(_that.profileWithSns);case ProfileShareDeleteWebsocketPayload():
return delete(_that.profileId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProfileWithSns profileWithSns)?  add,TResult? Function( ProfileWithSns profileWithSns)?  update,TResult? Function( String profileId)?  delete,}) {final _that = this;
switch (_that) {
case ProfileShareAddWebsocketPayload() when add != null:
return add(_that.profileWithSns);case ProfileShareUpdateWebsocketPayload() when update != null:
return update(_that.profileWithSns);case ProfileShareDeleteWebsocketPayload() when delete != null:
return delete(_that.profileId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ProfileShareAddWebsocketPayload implements ProfileShareWebsocketPayload {
  const ProfileShareAddWebsocketPayload({required this.profileWithSns, final  String? $type}): $type = $type ?? 'ADD';
  factory ProfileShareAddWebsocketPayload.fromJson(Map<String, dynamic> json) => _$ProfileShareAddWebsocketPayloadFromJson(json);

 final  ProfileWithSns profileWithSns;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareAddWebsocketPayloadCopyWith<ProfileShareAddWebsocketPayload> get copyWith => _$ProfileShareAddWebsocketPayloadCopyWithImpl<ProfileShareAddWebsocketPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareAddWebsocketPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareAddWebsocketPayload&&(identical(other.profileWithSns, profileWithSns) || other.profileWithSns == profileWithSns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileWithSns);

@override
String toString() {
  return 'ProfileShareWebsocketPayload.add(profileWithSns: $profileWithSns)';
}


}

/// @nodoc
abstract mixin class $ProfileShareAddWebsocketPayloadCopyWith<$Res> implements $ProfileShareWebsocketPayloadCopyWith<$Res> {
  factory $ProfileShareAddWebsocketPayloadCopyWith(ProfileShareAddWebsocketPayload value, $Res Function(ProfileShareAddWebsocketPayload) _then) = _$ProfileShareAddWebsocketPayloadCopyWithImpl;
@useResult
$Res call({
 ProfileWithSns profileWithSns
});


$ProfileWithSnsCopyWith<$Res> get profileWithSns;

}
/// @nodoc
class _$ProfileShareAddWebsocketPayloadCopyWithImpl<$Res>
    implements $ProfileShareAddWebsocketPayloadCopyWith<$Res> {
  _$ProfileShareAddWebsocketPayloadCopyWithImpl(this._self, this._then);

  final ProfileShareAddWebsocketPayload _self;
  final $Res Function(ProfileShareAddWebsocketPayload) _then;

/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileWithSns = null,}) {
  return _then(ProfileShareAddWebsocketPayload(
profileWithSns: null == profileWithSns ? _self.profileWithSns : profileWithSns // ignore: cast_nullable_to_non_nullable
as ProfileWithSns,
  ));
}

/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileWithSnsCopyWith<$Res> get profileWithSns {
  
  return $ProfileWithSnsCopyWith<$Res>(_self.profileWithSns, (value) {
    return _then(_self.copyWith(profileWithSns: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ProfileShareUpdateWebsocketPayload implements ProfileShareWebsocketPayload {
  const ProfileShareUpdateWebsocketPayload({required this.profileWithSns, final  String? $type}): $type = $type ?? 'UPDATE';
  factory ProfileShareUpdateWebsocketPayload.fromJson(Map<String, dynamic> json) => _$ProfileShareUpdateWebsocketPayloadFromJson(json);

 final  ProfileWithSns profileWithSns;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareUpdateWebsocketPayloadCopyWith<ProfileShareUpdateWebsocketPayload> get copyWith => _$ProfileShareUpdateWebsocketPayloadCopyWithImpl<ProfileShareUpdateWebsocketPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareUpdateWebsocketPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareUpdateWebsocketPayload&&(identical(other.profileWithSns, profileWithSns) || other.profileWithSns == profileWithSns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileWithSns);

@override
String toString() {
  return 'ProfileShareWebsocketPayload.update(profileWithSns: $profileWithSns)';
}


}

/// @nodoc
abstract mixin class $ProfileShareUpdateWebsocketPayloadCopyWith<$Res> implements $ProfileShareWebsocketPayloadCopyWith<$Res> {
  factory $ProfileShareUpdateWebsocketPayloadCopyWith(ProfileShareUpdateWebsocketPayload value, $Res Function(ProfileShareUpdateWebsocketPayload) _then) = _$ProfileShareUpdateWebsocketPayloadCopyWithImpl;
@useResult
$Res call({
 ProfileWithSns profileWithSns
});


$ProfileWithSnsCopyWith<$Res> get profileWithSns;

}
/// @nodoc
class _$ProfileShareUpdateWebsocketPayloadCopyWithImpl<$Res>
    implements $ProfileShareUpdateWebsocketPayloadCopyWith<$Res> {
  _$ProfileShareUpdateWebsocketPayloadCopyWithImpl(this._self, this._then);

  final ProfileShareUpdateWebsocketPayload _self;
  final $Res Function(ProfileShareUpdateWebsocketPayload) _then;

/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileWithSns = null,}) {
  return _then(ProfileShareUpdateWebsocketPayload(
profileWithSns: null == profileWithSns ? _self.profileWithSns : profileWithSns // ignore: cast_nullable_to_non_nullable
as ProfileWithSns,
  ));
}

/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileWithSnsCopyWith<$Res> get profileWithSns {
  
  return $ProfileWithSnsCopyWith<$Res>(_self.profileWithSns, (value) {
    return _then(_self.copyWith(profileWithSns: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ProfileShareDeleteWebsocketPayload implements ProfileShareWebsocketPayload {
  const ProfileShareDeleteWebsocketPayload({required this.profileId, final  String? $type}): $type = $type ?? 'DELETE';
  factory ProfileShareDeleteWebsocketPayload.fromJson(Map<String, dynamic> json) => _$ProfileShareDeleteWebsocketPayloadFromJson(json);

 final  String profileId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileShareDeleteWebsocketPayloadCopyWith<ProfileShareDeleteWebsocketPayload> get copyWith => _$ProfileShareDeleteWebsocketPayloadCopyWithImpl<ProfileShareDeleteWebsocketPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileShareDeleteWebsocketPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileShareDeleteWebsocketPayload&&(identical(other.profileId, profileId) || other.profileId == profileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId);

@override
String toString() {
  return 'ProfileShareWebsocketPayload.delete(profileId: $profileId)';
}


}

/// @nodoc
abstract mixin class $ProfileShareDeleteWebsocketPayloadCopyWith<$Res> implements $ProfileShareWebsocketPayloadCopyWith<$Res> {
  factory $ProfileShareDeleteWebsocketPayloadCopyWith(ProfileShareDeleteWebsocketPayload value, $Res Function(ProfileShareDeleteWebsocketPayload) _then) = _$ProfileShareDeleteWebsocketPayloadCopyWithImpl;
@useResult
$Res call({
 String profileId
});




}
/// @nodoc
class _$ProfileShareDeleteWebsocketPayloadCopyWithImpl<$Res>
    implements $ProfileShareDeleteWebsocketPayloadCopyWith<$Res> {
  _$ProfileShareDeleteWebsocketPayloadCopyWithImpl(this._self, this._then);

  final ProfileShareDeleteWebsocketPayload _self;
  final $Res Function(ProfileShareDeleteWebsocketPayload) _then;

/// Create a copy of ProfileShareWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,}) {
  return _then(ProfileShareDeleteWebsocketPayload(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
