// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'container_instance_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContainerInstanceStatus {

 ContainerInstanceStatusEnum get status; String? get error; Map<String, dynamic>? get output;
/// Create a copy of ContainerInstanceStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContainerInstanceStatusCopyWith<ContainerInstanceStatus> get copyWith => _$ContainerInstanceStatusCopyWithImpl<ContainerInstanceStatus>(this as ContainerInstanceStatus, _$identity);

  /// Serializes this ContainerInstanceStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContainerInstanceStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.output, output));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,error,const DeepCollectionEquality().hash(output));

@override
String toString() {
  return 'ContainerInstanceStatus(status: $status, error: $error, output: $output)';
}


}

/// @nodoc
abstract mixin class $ContainerInstanceStatusCopyWith<$Res>  {
  factory $ContainerInstanceStatusCopyWith(ContainerInstanceStatus value, $Res Function(ContainerInstanceStatus) _then) = _$ContainerInstanceStatusCopyWithImpl;
@useResult
$Res call({
 ContainerInstanceStatusEnum status, String? error, Map<String, dynamic>? output
});




}
/// @nodoc
class _$ContainerInstanceStatusCopyWithImpl<$Res>
    implements $ContainerInstanceStatusCopyWith<$Res> {
  _$ContainerInstanceStatusCopyWithImpl(this._self, this._then);

  final ContainerInstanceStatus _self;
  final $Res Function(ContainerInstanceStatus) _then;

/// Create a copy of ContainerInstanceStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = freezed,Object? output = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContainerInstanceStatusEnum,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,output: freezed == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContainerInstanceStatus].
extension ContainerInstanceStatusPatterns on ContainerInstanceStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContainerInstanceStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContainerInstanceStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContainerInstanceStatus value)  $default,){
final _that = this;
switch (_that) {
case _ContainerInstanceStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContainerInstanceStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ContainerInstanceStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContainerInstanceStatusEnum status,  String? error,  Map<String, dynamic>? output)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContainerInstanceStatus() when $default != null:
return $default(_that.status,_that.error,_that.output);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContainerInstanceStatusEnum status,  String? error,  Map<String, dynamic>? output)  $default,) {final _that = this;
switch (_that) {
case _ContainerInstanceStatus():
return $default(_that.status,_that.error,_that.output);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContainerInstanceStatusEnum status,  String? error,  Map<String, dynamic>? output)?  $default,) {final _that = this;
switch (_that) {
case _ContainerInstanceStatus() when $default != null:
return $default(_that.status,_that.error,_that.output);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContainerInstanceStatus implements ContainerInstanceStatus {
  const _ContainerInstanceStatus({required this.status, this.error, final  Map<String, dynamic>? output}): _output = output;
  factory _ContainerInstanceStatus.fromJson(Map<String, dynamic> json) => _$ContainerInstanceStatusFromJson(json);

@override final  ContainerInstanceStatusEnum status;
@override final  String? error;
 final  Map<String, dynamic>? _output;
@override Map<String, dynamic>? get output {
  final value = _output;
  if (value == null) return null;
  if (_output is EqualUnmodifiableMapView) return _output;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ContainerInstanceStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContainerInstanceStatusCopyWith<_ContainerInstanceStatus> get copyWith => __$ContainerInstanceStatusCopyWithImpl<_ContainerInstanceStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContainerInstanceStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContainerInstanceStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._output, _output));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,error,const DeepCollectionEquality().hash(_output));

@override
String toString() {
  return 'ContainerInstanceStatus(status: $status, error: $error, output: $output)';
}


}

/// @nodoc
abstract mixin class _$ContainerInstanceStatusCopyWith<$Res> implements $ContainerInstanceStatusCopyWith<$Res> {
  factory _$ContainerInstanceStatusCopyWith(_ContainerInstanceStatus value, $Res Function(_ContainerInstanceStatus) _then) = __$ContainerInstanceStatusCopyWithImpl;
@override @useResult
$Res call({
 ContainerInstanceStatusEnum status, String? error, Map<String, dynamic>? output
});




}
/// @nodoc
class __$ContainerInstanceStatusCopyWithImpl<$Res>
    implements _$ContainerInstanceStatusCopyWith<$Res> {
  __$ContainerInstanceStatusCopyWithImpl(this._self, this._then);

  final _ContainerInstanceStatus _self;
  final $Res Function(_ContainerInstanceStatus) _then;

/// Create a copy of ContainerInstanceStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = freezed,Object? output = freezed,}) {
  return _then(_ContainerInstanceStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContainerInstanceStatusEnum,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,output: freezed == output ? _self._output : output // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
