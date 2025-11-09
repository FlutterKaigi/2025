// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_log_put_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntryLogPutResponse {

 bool get success; EntryLog get entryLog;
/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryLogPutResponseCopyWith<EntryLogPutResponse> get copyWith => _$EntryLogPutResponseCopyWithImpl<EntryLogPutResponse>(this as EntryLogPutResponse, _$identity);

  /// Serializes this EntryLogPutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryLogPutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,entryLog);

@override
String toString() {
  return 'EntryLogPutResponse(success: $success, entryLog: $entryLog)';
}


}

/// @nodoc
abstract mixin class $EntryLogPutResponseCopyWith<$Res>  {
  factory $EntryLogPutResponseCopyWith(EntryLogPutResponse value, $Res Function(EntryLogPutResponse) _then) = _$EntryLogPutResponseCopyWithImpl;
@useResult
$Res call({
 bool success, EntryLog entryLog
});


$EntryLogCopyWith<$Res> get entryLog;

}
/// @nodoc
class _$EntryLogPutResponseCopyWithImpl<$Res>
    implements $EntryLogPutResponseCopyWith<$Res> {
  _$EntryLogPutResponseCopyWithImpl(this._self, this._then);

  final EntryLogPutResponse _self;
  final $Res Function(EntryLogPutResponse) _then;

/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? entryLog = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,entryLog: null == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLog,
  ));
}
/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogCopyWith<$Res> get entryLog {
  
  return $EntryLogCopyWith<$Res>(_self.entryLog, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}
}


/// Adds pattern-matching-related methods to [EntryLogPutResponse].
extension EntryLogPutResponsePatterns on EntryLogPutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryLogPutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryLogPutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryLogPutResponse value)  $default,){
final _that = this;
switch (_that) {
case _EntryLogPutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryLogPutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EntryLogPutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  EntryLog entryLog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryLogPutResponse() when $default != null:
return $default(_that.success,_that.entryLog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  EntryLog entryLog)  $default,) {final _that = this;
switch (_that) {
case _EntryLogPutResponse():
return $default(_that.success,_that.entryLog);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  EntryLog entryLog)?  $default,) {final _that = this;
switch (_that) {
case _EntryLogPutResponse() when $default != null:
return $default(_that.success,_that.entryLog);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntryLogPutResponse implements EntryLogPutResponse {
  const _EntryLogPutResponse({required this.success, required this.entryLog});
  factory _EntryLogPutResponse.fromJson(Map<String, dynamic> json) => _$EntryLogPutResponseFromJson(json);

@override final  bool success;
@override final  EntryLog entryLog;

/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryLogPutResponseCopyWith<_EntryLogPutResponse> get copyWith => __$EntryLogPutResponseCopyWithImpl<_EntryLogPutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryLogPutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryLogPutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,entryLog);

@override
String toString() {
  return 'EntryLogPutResponse(success: $success, entryLog: $entryLog)';
}


}

/// @nodoc
abstract mixin class _$EntryLogPutResponseCopyWith<$Res> implements $EntryLogPutResponseCopyWith<$Res> {
  factory _$EntryLogPutResponseCopyWith(_EntryLogPutResponse value, $Res Function(_EntryLogPutResponse) _then) = __$EntryLogPutResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, EntryLog entryLog
});


@override $EntryLogCopyWith<$Res> get entryLog;

}
/// @nodoc
class __$EntryLogPutResponseCopyWithImpl<$Res>
    implements _$EntryLogPutResponseCopyWith<$Res> {
  __$EntryLogPutResponseCopyWithImpl(this._self, this._then);

  final _EntryLogPutResponse _self;
  final $Res Function(_EntryLogPutResponse) _then;

/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? entryLog = null,}) {
  return _then(_EntryLogPutResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,entryLog: null == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLog,
  ));
}

/// Create a copy of EntryLogPutResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogCopyWith<$Res> get entryLog {
  
  return $EntryLogCopyWith<$Res>(_self.entryLog, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}
}

// dart format on
