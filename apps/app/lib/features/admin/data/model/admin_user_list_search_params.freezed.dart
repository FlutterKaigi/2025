// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_list_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserListSearchParams {

 String? get email; List<Role>? get roles;
/// Create a copy of AdminUserListSearchParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserListSearchParamsCopyWith<AdminUserListSearchParams> get copyWith => _$AdminUserListSearchParamsCopyWithImpl<AdminUserListSearchParams>(this as AdminUserListSearchParams, _$identity);

  /// Serializes this AdminUserListSearchParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserListSearchParams&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'AdminUserListSearchParams(email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $AdminUserListSearchParamsCopyWith<$Res>  {
  factory $AdminUserListSearchParamsCopyWith(AdminUserListSearchParams value, $Res Function(AdminUserListSearchParams) _then) = _$AdminUserListSearchParamsCopyWithImpl;
@useResult
$Res call({
 String? email, List<Role>? roles
});




}
/// @nodoc
class _$AdminUserListSearchParamsCopyWithImpl<$Res>
    implements $AdminUserListSearchParamsCopyWith<$Res> {
  _$AdminUserListSearchParamsCopyWithImpl(this._self, this._then);

  final AdminUserListSearchParams _self;
  final $Res Function(AdminUserListSearchParams) _then;

/// Create a copy of AdminUserListSearchParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? roles = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserListSearchParams].
extension AdminUserListSearchParamsPatterns on AdminUserListSearchParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserListSearchParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserListSearchParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserListSearchParams value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserListSearchParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserListSearchParams value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserListSearchParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  List<Role>? roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserListSearchParams() when $default != null:
return $default(_that.email,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  List<Role>? roles)  $default,) {final _that = this;
switch (_that) {
case _AdminUserListSearchParams():
return $default(_that.email,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  List<Role>? roles)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserListSearchParams() when $default != null:
return $default(_that.email,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserListSearchParams implements AdminUserListSearchParams {
  const _AdminUserListSearchParams({this.email, final  List<Role>? roles}): _roles = roles;
  factory _AdminUserListSearchParams.fromJson(Map<String, dynamic> json) => _$AdminUserListSearchParamsFromJson(json);

@override final  String? email;
 final  List<Role>? _roles;
@override List<Role>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AdminUserListSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserListSearchParamsCopyWith<_AdminUserListSearchParams> get copyWith => __$AdminUserListSearchParamsCopyWithImpl<_AdminUserListSearchParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserListSearchParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserListSearchParams&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'AdminUserListSearchParams(email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$AdminUserListSearchParamsCopyWith<$Res> implements $AdminUserListSearchParamsCopyWith<$Res> {
  factory _$AdminUserListSearchParamsCopyWith(_AdminUserListSearchParams value, $Res Function(_AdminUserListSearchParams) _then) = __$AdminUserListSearchParamsCopyWithImpl;
@override @useResult
$Res call({
 String? email, List<Role>? roles
});




}
/// @nodoc
class __$AdminUserListSearchParamsCopyWithImpl<$Res>
    implements _$AdminUserListSearchParamsCopyWith<$Res> {
  __$AdminUserListSearchParamsCopyWithImpl(this._self, this._then);

  final _AdminUserListSearchParams _self;
  final $Res Function(_AdminUserListSearchParams) _then;

/// Create a copy of AdminUserListSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? roles = freezed,}) {
  return _then(_AdminUserListSearchParams(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}


}

// dart format on
