// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cf_workers_env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CfWorkersEnv {

 String? get commitHash; String get supabaseUrl; String get supabaseServiceRoleKey;
/// Create a copy of CfWorkersEnv
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CfWorkersEnvCopyWith<CfWorkersEnv> get copyWith => _$CfWorkersEnvCopyWithImpl<CfWorkersEnv>(this as CfWorkersEnv, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CfWorkersEnv&&(identical(other.commitHash, commitHash) || other.commitHash == commitHash)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseServiceRoleKey, supabaseServiceRoleKey) || other.supabaseServiceRoleKey == supabaseServiceRoleKey));
}


@override
int get hashCode => Object.hash(runtimeType,commitHash,supabaseUrl,supabaseServiceRoleKey);

@override
String toString() {
  return 'CfWorkersEnv(commitHash: $commitHash, supabaseUrl: $supabaseUrl, supabaseServiceRoleKey: $supabaseServiceRoleKey)';
}


}

/// @nodoc
abstract mixin class $CfWorkersEnvCopyWith<$Res>  {
  factory $CfWorkersEnvCopyWith(CfWorkersEnv value, $Res Function(CfWorkersEnv) _then) = _$CfWorkersEnvCopyWithImpl;
@useResult
$Res call({
 String? commitHash, String supabaseUrl, String supabaseServiceRoleKey
});




}
/// @nodoc
class _$CfWorkersEnvCopyWithImpl<$Res>
    implements $CfWorkersEnvCopyWith<$Res> {
  _$CfWorkersEnvCopyWithImpl(this._self, this._then);

  final CfWorkersEnv _self;
  final $Res Function(CfWorkersEnv) _then;

/// Create a copy of CfWorkersEnv
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commitHash = freezed,Object? supabaseUrl = null,Object? supabaseServiceRoleKey = null,}) {
  return _then(_self.copyWith(
commitHash: freezed == commitHash ? _self.commitHash : commitHash // ignore: cast_nullable_to_non_nullable
as String?,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseServiceRoleKey: null == supabaseServiceRoleKey ? _self.supabaseServiceRoleKey : supabaseServiceRoleKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _CfWorkersEnv implements CfWorkersEnv {
  const _CfWorkersEnv({required this.commitHash, required this.supabaseUrl, required this.supabaseServiceRoleKey});
  

@override final  String? commitHash;
@override final  String supabaseUrl;
@override final  String supabaseServiceRoleKey;

/// Create a copy of CfWorkersEnv
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CfWorkersEnvCopyWith<_CfWorkersEnv> get copyWith => __$CfWorkersEnvCopyWithImpl<_CfWorkersEnv>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CfWorkersEnv&&(identical(other.commitHash, commitHash) || other.commitHash == commitHash)&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseServiceRoleKey, supabaseServiceRoleKey) || other.supabaseServiceRoleKey == supabaseServiceRoleKey));
}


@override
int get hashCode => Object.hash(runtimeType,commitHash,supabaseUrl,supabaseServiceRoleKey);

@override
String toString() {
  return 'CfWorkersEnv(commitHash: $commitHash, supabaseUrl: $supabaseUrl, supabaseServiceRoleKey: $supabaseServiceRoleKey)';
}


}

/// @nodoc
abstract mixin class _$CfWorkersEnvCopyWith<$Res> implements $CfWorkersEnvCopyWith<$Res> {
  factory _$CfWorkersEnvCopyWith(_CfWorkersEnv value, $Res Function(_CfWorkersEnv) _then) = __$CfWorkersEnvCopyWithImpl;
@override @useResult
$Res call({
 String? commitHash, String supabaseUrl, String supabaseServiceRoleKey
});




}
/// @nodoc
class __$CfWorkersEnvCopyWithImpl<$Res>
    implements _$CfWorkersEnvCopyWith<$Res> {
  __$CfWorkersEnvCopyWithImpl(this._self, this._then);

  final _CfWorkersEnv _self;
  final $Res Function(_CfWorkersEnv) _then;

/// Create a copy of CfWorkersEnv
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commitHash = freezed,Object? supabaseUrl = null,Object? supabaseServiceRoleKey = null,}) {
  return _then(_CfWorkersEnv(
commitHash: freezed == commitHash ? _self.commitHash : commitHash // ignore: cast_nullable_to_non_nullable
as String?,supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseServiceRoleKey: null == supabaseServiceRoleKey ? _self.supabaseServiceRoleKey : supabaseServiceRoleKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
