// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Environment {

 String get appIdSuffix; String get appName; String get flavor; String get supabaseUrl; String get supabaseKey; String get bffBaseUrl; String get withdrawalFormUrl;
/// Create a copy of Environment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvironmentCopyWith<Environment> get copyWith => _$EnvironmentCopyWithImpl<Environment>(this as Environment, _$identity);

  /// Serializes this Environment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Environment&&(identical(other.appIdSuffix, appIdSuffix) || other.appIdSuffix == appIdSuffix)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseKey, supabaseKey) || other.supabaseKey == supabaseKey)&&(identical(other.bffBaseUrl, bffBaseUrl) || other.bffBaseUrl == bffBaseUrl)&&(identical(other.withdrawalFormUrl, withdrawalFormUrl) || other.withdrawalFormUrl == withdrawalFormUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIdSuffix,appName,flavor,supabaseUrl,supabaseKey,bffBaseUrl,withdrawalFormUrl);

@override
String toString() {
  return 'Environment(appIdSuffix: $appIdSuffix, appName: $appName, flavor: $flavor, supabaseUrl: $supabaseUrl, supabaseKey: $supabaseKey, bffBaseUrl: $bffBaseUrl, withdrawalFormUrl: $withdrawalFormUrl)';
}


}

/// @nodoc
abstract mixin class $EnvironmentCopyWith<$Res>  {
  factory $EnvironmentCopyWith(Environment value, $Res Function(Environment) _then) = _$EnvironmentCopyWithImpl;
@useResult
$Res call({
 String appIdSuffix, String appName, String flavor, String supabaseUrl, String supabaseKey, String bffBaseUrl, String withdrawalFormUrl
});




}
/// @nodoc
class _$EnvironmentCopyWithImpl<$Res>
    implements $EnvironmentCopyWith<$Res> {
  _$EnvironmentCopyWithImpl(this._self, this._then);

  final Environment _self;
  final $Res Function(Environment) _then;

/// Create a copy of Environment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appIdSuffix = null,Object? appName = null,Object? flavor = null,Object? supabaseUrl = null,Object? supabaseKey = null,Object? bffBaseUrl = null,Object? withdrawalFormUrl = null,}) {
  return _then(_self.copyWith(
appIdSuffix: null == appIdSuffix ? _self.appIdSuffix : appIdSuffix // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as String,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseKey: null == supabaseKey ? _self.supabaseKey : supabaseKey // ignore: cast_nullable_to_non_nullable
as String,bffBaseUrl: null == bffBaseUrl ? _self.bffBaseUrl : bffBaseUrl // ignore: cast_nullable_to_non_nullable
as String,withdrawalFormUrl: null == withdrawalFormUrl ? _self.withdrawalFormUrl : withdrawalFormUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Environment].
extension EnvironmentPatterns on Environment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Environment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Environment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Environment value)  $default,){
final _that = this;
switch (_that) {
case _Environment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Environment value)?  $default,){
final _that = this;
switch (_that) {
case _Environment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appIdSuffix,  String appName,  String flavor,  String supabaseUrl,  String supabaseKey,  String bffBaseUrl,  String withdrawalFormUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Environment() when $default != null:
return $default(_that.appIdSuffix,_that.appName,_that.flavor,_that.supabaseUrl,_that.supabaseKey,_that.bffBaseUrl,_that.withdrawalFormUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appIdSuffix,  String appName,  String flavor,  String supabaseUrl,  String supabaseKey,  String bffBaseUrl,  String withdrawalFormUrl)  $default,) {final _that = this;
switch (_that) {
case _Environment():
return $default(_that.appIdSuffix,_that.appName,_that.flavor,_that.supabaseUrl,_that.supabaseKey,_that.bffBaseUrl,_that.withdrawalFormUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appIdSuffix,  String appName,  String flavor,  String supabaseUrl,  String supabaseKey,  String bffBaseUrl,  String withdrawalFormUrl)?  $default,) {final _that = this;
switch (_that) {
case _Environment() when $default != null:
return $default(_that.appIdSuffix,_that.appName,_that.flavor,_that.supabaseUrl,_that.supabaseKey,_that.bffBaseUrl,_that.withdrawalFormUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Environment implements Environment {
  const _Environment({required this.appIdSuffix, required this.appName, required this.flavor, required this.supabaseUrl, required this.supabaseKey, required this.bffBaseUrl, required this.withdrawalFormUrl});
  factory _Environment.fromJson(Map<String, dynamic> json) => _$EnvironmentFromJson(json);

@override final  String appIdSuffix;
@override final  String appName;
@override final  String flavor;
@override final  String supabaseUrl;
@override final  String supabaseKey;
@override final  String bffBaseUrl;
@override final  String withdrawalFormUrl;

/// Create a copy of Environment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvironmentCopyWith<_Environment> get copyWith => __$EnvironmentCopyWithImpl<_Environment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnvironmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Environment&&(identical(other.appIdSuffix, appIdSuffix) || other.appIdSuffix == appIdSuffix)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseKey, supabaseKey) || other.supabaseKey == supabaseKey)&&(identical(other.bffBaseUrl, bffBaseUrl) || other.bffBaseUrl == bffBaseUrl)&&(identical(other.withdrawalFormUrl, withdrawalFormUrl) || other.withdrawalFormUrl == withdrawalFormUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIdSuffix,appName,flavor,supabaseUrl,supabaseKey,bffBaseUrl,withdrawalFormUrl);

@override
String toString() {
  return 'Environment(appIdSuffix: $appIdSuffix, appName: $appName, flavor: $flavor, supabaseUrl: $supabaseUrl, supabaseKey: $supabaseKey, bffBaseUrl: $bffBaseUrl, withdrawalFormUrl: $withdrawalFormUrl)';
}


}

/// @nodoc
abstract mixin class _$EnvironmentCopyWith<$Res> implements $EnvironmentCopyWith<$Res> {
  factory _$EnvironmentCopyWith(_Environment value, $Res Function(_Environment) _then) = __$EnvironmentCopyWithImpl;
@override @useResult
$Res call({
 String appIdSuffix, String appName, String flavor, String supabaseUrl, String supabaseKey, String bffBaseUrl, String withdrawalFormUrl
});




}
/// @nodoc
class __$EnvironmentCopyWithImpl<$Res>
    implements _$EnvironmentCopyWith<$Res> {
  __$EnvironmentCopyWithImpl(this._self, this._then);

  final _Environment _self;
  final $Res Function(_Environment) _then;

/// Create a copy of Environment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appIdSuffix = null,Object? appName = null,Object? flavor = null,Object? supabaseUrl = null,Object? supabaseKey = null,Object? bffBaseUrl = null,Object? withdrawalFormUrl = null,}) {
  return _then(_Environment(
appIdSuffix: null == appIdSuffix ? _self.appIdSuffix : appIdSuffix // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as String,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseKey: null == supabaseKey ? _self.supabaseKey : supabaseKey // ignore: cast_nullable_to_non_nullable
as String,bffBaseUrl: null == bffBaseUrl ? _self.bffBaseUrl : bffBaseUrl // ignore: cast_nullable_to_non_nullable
as String,withdrawalFormUrl: null == withdrawalFormUrl ? _self.withdrawalFormUrl : withdrawalFormUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
