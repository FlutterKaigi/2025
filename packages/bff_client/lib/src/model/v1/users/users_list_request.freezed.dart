// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersListRequest {

@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter() int get limit;@IntStringJsonConverter() int? get offset; String? get email; List<Role>? get roles;
/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListRequestCopyWith<UsersListRequest> get copyWith => _$UsersListRequestCopyWithImpl<UsersListRequest>(this as UsersListRequest, _$identity);

  /// Serializes this UsersListRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,email,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UsersListRequest(limit: $limit, offset: $offset, email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UsersListRequestCopyWith<$Res>  {
  factory $UsersListRequestCopyWith(UsersListRequest value, $Res Function(UsersListRequest) _then) = _$UsersListRequestCopyWithImpl;
@useResult
$Res call({
@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter() int limit,@IntStringJsonConverter() int? offset, String? email, List<Role>? roles
});




}
/// @nodoc
class _$UsersListRequestCopyWithImpl<$Res>
    implements $UsersListRequestCopyWith<$Res> {
  _$UsersListRequestCopyWithImpl(this._self, this._then);

  final UsersListRequest _self;
  final $Res Function(UsersListRequest) _then;

/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? offset = freezed,Object? email = freezed,Object? roles = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersListRequest].
extension UsersListRequestPatterns on UsersListRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersListRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersListRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersListRequest value)  $default,){
final _that = this;
switch (_that) {
case _UsersListRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersListRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UsersListRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter()  int limit, @IntStringJsonConverter()  int? offset,  String? email,  List<Role>? roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersListRequest() when $default != null:
return $default(_that.limit,_that.offset,_that.email,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter()  int limit, @IntStringJsonConverter()  int? offset,  String? email,  List<Role>? roles)  $default,) {final _that = this;
switch (_that) {
case _UsersListRequest():
return $default(_that.limit,_that.offset,_that.email,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter()  int limit, @IntStringJsonConverter()  int? offset,  String? email,  List<Role>? roles)?  $default,) {final _that = this;
switch (_that) {
case _UsersListRequest() when $default != null:
return $default(_that.limit,_that.offset,_that.email,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsersListRequest implements UsersListRequest {
  const _UsersListRequest({@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter() required this.limit, @IntStringJsonConverter() this.offset, this.email, final  List<Role>? roles}): _roles = roles;
  factory _UsersListRequest.fromJson(Map<String, dynamic> json) => _$UsersListRequestFromJson(json);

@override@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter() final  int limit;
@override@IntStringJsonConverter() final  int? offset;
@override final  String? email;
 final  List<Role>? _roles;
@override List<Role>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersListRequestCopyWith<_UsersListRequest> get copyWith => __$UsersListRequestCopyWithImpl<_UsersListRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersListRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListRequest&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,email,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UsersListRequest(limit: $limit, offset: $offset, email: $email, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UsersListRequestCopyWith<$Res> implements $UsersListRequestCopyWith<$Res> {
  factory _$UsersListRequestCopyWith(_UsersListRequest value, $Res Function(_UsersListRequest) _then) = __$UsersListRequestCopyWithImpl;
@override @useResult
$Res call({
@Assert('limit > 0', 'limit must be greater than 0')@Assert('limit <= 100', 'limit must be less than or equal to 100')@IntStringJsonConverter() int limit,@IntStringJsonConverter() int? offset, String? email, List<Role>? roles
});




}
/// @nodoc
class __$UsersListRequestCopyWithImpl<$Res>
    implements _$UsersListRequestCopyWith<$Res> {
  __$UsersListRequestCopyWithImpl(this._self, this._then);

  final _UsersListRequest _self;
  final $Res Function(_UsersListRequest) _then;

/// Create a copy of UsersListRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = freezed,Object? email = freezed,Object? roles = freezed,}) {
  return _then(_UsersListRequest(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<Role>?,
  ));
}


}

// dart format on
