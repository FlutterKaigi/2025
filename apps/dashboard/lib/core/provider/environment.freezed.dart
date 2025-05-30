// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 String get appIdSuffix; String get appName; String get flavor; String get supabaseUrl; String get supabaseKey;
/// Create a copy of Environment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvironmentCopyWith<Environment> get copyWith => _$EnvironmentCopyWithImpl<Environment>(this as Environment, _$identity);

  /// Serializes this Environment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Environment&&(identical(other.appIdSuffix, appIdSuffix) || other.appIdSuffix == appIdSuffix)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseKey, supabaseKey) || other.supabaseKey == supabaseKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIdSuffix,appName,flavor,supabaseUrl,supabaseKey);

@override
String toString() {
  return 'Environment(appIdSuffix: $appIdSuffix, appName: $appName, flavor: $flavor, supabaseUrl: $supabaseUrl, supabaseKey: $supabaseKey)';
}


}

/// @nodoc
abstract mixin class $EnvironmentCopyWith<$Res>  {
  factory $EnvironmentCopyWith(Environment value, $Res Function(Environment) _then) = _$EnvironmentCopyWithImpl;
@useResult
$Res call({
 String appIdSuffix, String appName, String flavor, String supabaseUrl, String supabaseKey
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
@pragma('vm:prefer-inline') @override $Res call({Object? appIdSuffix = null,Object? appName = null,Object? flavor = null,Object? supabaseUrl = null,Object? supabaseKey = null,}) {
  return _then(_self.copyWith(
appIdSuffix: null == appIdSuffix ? _self.appIdSuffix : appIdSuffix // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as String,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseKey: null == supabaseKey ? _self.supabaseKey : supabaseKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Environment implements Environment {
  const _Environment({required this.appIdSuffix, required this.appName, required this.flavor, required this.supabaseUrl, required this.supabaseKey});
  factory _Environment.fromJson(Map<String, dynamic> json) => _$EnvironmentFromJson(json);

@override final  String appIdSuffix;
@override final  String appName;
@override final  String flavor;
@override final  String supabaseUrl;
@override final  String supabaseKey;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Environment&&(identical(other.appIdSuffix, appIdSuffix) || other.appIdSuffix == appIdSuffix)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseKey, supabaseKey) || other.supabaseKey == supabaseKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIdSuffix,appName,flavor,supabaseUrl,supabaseKey);

@override
String toString() {
  return 'Environment._internal(appIdSuffix: $appIdSuffix, appName: $appName, flavor: $flavor, supabaseUrl: $supabaseUrl, supabaseKey: $supabaseKey)';
}


}

/// @nodoc
abstract mixin class _$EnvironmentCopyWith<$Res> implements $EnvironmentCopyWith<$Res> {
  factory _$EnvironmentCopyWith(_Environment value, $Res Function(_Environment) _then) = __$EnvironmentCopyWithImpl;
@override @useResult
$Res call({
 String appIdSuffix, String appName, String flavor, String supabaseUrl, String supabaseKey
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
@override @pragma('vm:prefer-inline') $Res call({Object? appIdSuffix = null,Object? appName = null,Object? flavor = null,Object? supabaseUrl = null,Object? supabaseKey = null,}) {
  return _then(_Environment(
appIdSuffix: null == appIdSuffix ? _self.appIdSuffix : appIdSuffix // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,flavor: null == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as String,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseKey: null == supabaseKey ? _self.supabaseKey : supabaseKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
