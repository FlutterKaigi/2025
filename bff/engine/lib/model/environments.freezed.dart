// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Environments {

 String get supabaseUrl; String get supabaseServiceRoleKey; String? get cfVersionMetadataId; String? get cfVersionMetadataTag; String? get cfVersionMetadataTimestamp; String get postgresUrl; String get internalApiUrl; String get xApiKey; String get logoBaseUrl; String get cloudlfareAccountId; String get r2BucketName; String get r2AccessKeyId; String get r2SecretAccessKey;
/// Create a copy of Environments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvironmentsCopyWith<Environments> get copyWith => _$EnvironmentsCopyWithImpl<Environments>(this as Environments, _$identity);

  /// Serializes this Environments to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Environments&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseServiceRoleKey, supabaseServiceRoleKey) || other.supabaseServiceRoleKey == supabaseServiceRoleKey)&&(identical(other.cfVersionMetadataId, cfVersionMetadataId) || other.cfVersionMetadataId == cfVersionMetadataId)&&(identical(other.cfVersionMetadataTag, cfVersionMetadataTag) || other.cfVersionMetadataTag == cfVersionMetadataTag)&&(identical(other.cfVersionMetadataTimestamp, cfVersionMetadataTimestamp) || other.cfVersionMetadataTimestamp == cfVersionMetadataTimestamp)&&(identical(other.postgresUrl, postgresUrl) || other.postgresUrl == postgresUrl)&&(identical(other.internalApiUrl, internalApiUrl) || other.internalApiUrl == internalApiUrl)&&(identical(other.xApiKey, xApiKey) || other.xApiKey == xApiKey)&&(identical(other.logoBaseUrl, logoBaseUrl) || other.logoBaseUrl == logoBaseUrl)&&(identical(other.cloudlfareAccountId, cloudlfareAccountId) || other.cloudlfareAccountId == cloudlfareAccountId)&&(identical(other.r2BucketName, r2BucketName) || other.r2BucketName == r2BucketName)&&(identical(other.r2AccessKeyId, r2AccessKeyId) || other.r2AccessKeyId == r2AccessKeyId)&&(identical(other.r2SecretAccessKey, r2SecretAccessKey) || other.r2SecretAccessKey == r2SecretAccessKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,supabaseUrl,supabaseServiceRoleKey,cfVersionMetadataId,cfVersionMetadataTag,cfVersionMetadataTimestamp,postgresUrl,internalApiUrl,xApiKey,logoBaseUrl,cloudlfareAccountId,r2BucketName,r2AccessKeyId,r2SecretAccessKey);

@override
String toString() {
  return 'Environments(supabaseUrl: $supabaseUrl, supabaseServiceRoleKey: $supabaseServiceRoleKey, cfVersionMetadataId: $cfVersionMetadataId, cfVersionMetadataTag: $cfVersionMetadataTag, cfVersionMetadataTimestamp: $cfVersionMetadataTimestamp, postgresUrl: $postgresUrl, internalApiUrl: $internalApiUrl, xApiKey: $xApiKey, logoBaseUrl: $logoBaseUrl, cloudlfareAccountId: $cloudlfareAccountId, r2BucketName: $r2BucketName, r2AccessKeyId: $r2AccessKeyId, r2SecretAccessKey: $r2SecretAccessKey)';
}


}

/// @nodoc
abstract mixin class $EnvironmentsCopyWith<$Res>  {
  factory $EnvironmentsCopyWith(Environments value, $Res Function(Environments) _then) = _$EnvironmentsCopyWithImpl;
@useResult
$Res call({
 String supabaseUrl, String supabaseServiceRoleKey, String? cfVersionMetadataId, String? cfVersionMetadataTag, String? cfVersionMetadataTimestamp, String postgresUrl, String internalApiUrl, String xApiKey, String logoBaseUrl, String cloudlfareAccountId, String r2BucketName, String r2AccessKeyId, String r2SecretAccessKey
});




}
/// @nodoc
class _$EnvironmentsCopyWithImpl<$Res>
    implements $EnvironmentsCopyWith<$Res> {
  _$EnvironmentsCopyWithImpl(this._self, this._then);

  final Environments _self;
  final $Res Function(Environments) _then;

/// Create a copy of Environments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supabaseUrl = null,Object? supabaseServiceRoleKey = null,Object? cfVersionMetadataId = freezed,Object? cfVersionMetadataTag = freezed,Object? cfVersionMetadataTimestamp = freezed,Object? postgresUrl = null,Object? internalApiUrl = null,Object? xApiKey = null,Object? logoBaseUrl = null,Object? cloudlfareAccountId = null,Object? r2BucketName = null,Object? r2AccessKeyId = null,Object? r2SecretAccessKey = null,}) {
  return _then(_self.copyWith(
supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseServiceRoleKey: null == supabaseServiceRoleKey ? _self.supabaseServiceRoleKey : supabaseServiceRoleKey // ignore: cast_nullable_to_non_nullable
as String,cfVersionMetadataId: freezed == cfVersionMetadataId ? _self.cfVersionMetadataId : cfVersionMetadataId // ignore: cast_nullable_to_non_nullable
as String?,cfVersionMetadataTag: freezed == cfVersionMetadataTag ? _self.cfVersionMetadataTag : cfVersionMetadataTag // ignore: cast_nullable_to_non_nullable
as String?,cfVersionMetadataTimestamp: freezed == cfVersionMetadataTimestamp ? _self.cfVersionMetadataTimestamp : cfVersionMetadataTimestamp // ignore: cast_nullable_to_non_nullable
as String?,postgresUrl: null == postgresUrl ? _self.postgresUrl : postgresUrl // ignore: cast_nullable_to_non_nullable
as String,internalApiUrl: null == internalApiUrl ? _self.internalApiUrl : internalApiUrl // ignore: cast_nullable_to_non_nullable
as String,xApiKey: null == xApiKey ? _self.xApiKey : xApiKey // ignore: cast_nullable_to_non_nullable
as String,logoBaseUrl: null == logoBaseUrl ? _self.logoBaseUrl : logoBaseUrl // ignore: cast_nullable_to_non_nullable
as String,cloudlfareAccountId: null == cloudlfareAccountId ? _self.cloudlfareAccountId : cloudlfareAccountId // ignore: cast_nullable_to_non_nullable
as String,r2BucketName: null == r2BucketName ? _self.r2BucketName : r2BucketName // ignore: cast_nullable_to_non_nullable
as String,r2AccessKeyId: null == r2AccessKeyId ? _self.r2AccessKeyId : r2AccessKeyId // ignore: cast_nullable_to_non_nullable
as String,r2SecretAccessKey: null == r2SecretAccessKey ? _self.r2SecretAccessKey : r2SecretAccessKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Environments].
extension EnvironmentsPatterns on Environments {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Environments value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Environments() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Environments value)  $default,){
final _that = this;
switch (_that) {
case _Environments():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Environments value)?  $default,){
final _that = this;
switch (_that) {
case _Environments() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String supabaseUrl,  String supabaseServiceRoleKey,  String? cfVersionMetadataId,  String? cfVersionMetadataTag,  String? cfVersionMetadataTimestamp,  String postgresUrl,  String internalApiUrl,  String xApiKey,  String logoBaseUrl,  String cloudlfareAccountId,  String r2BucketName,  String r2AccessKeyId,  String r2SecretAccessKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Environments() when $default != null:
return $default(_that.supabaseUrl,_that.supabaseServiceRoleKey,_that.cfVersionMetadataId,_that.cfVersionMetadataTag,_that.cfVersionMetadataTimestamp,_that.postgresUrl,_that.internalApiUrl,_that.xApiKey,_that.logoBaseUrl,_that.cloudlfareAccountId,_that.r2BucketName,_that.r2AccessKeyId,_that.r2SecretAccessKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String supabaseUrl,  String supabaseServiceRoleKey,  String? cfVersionMetadataId,  String? cfVersionMetadataTag,  String? cfVersionMetadataTimestamp,  String postgresUrl,  String internalApiUrl,  String xApiKey,  String logoBaseUrl,  String cloudlfareAccountId,  String r2BucketName,  String r2AccessKeyId,  String r2SecretAccessKey)  $default,) {final _that = this;
switch (_that) {
case _Environments():
return $default(_that.supabaseUrl,_that.supabaseServiceRoleKey,_that.cfVersionMetadataId,_that.cfVersionMetadataTag,_that.cfVersionMetadataTimestamp,_that.postgresUrl,_that.internalApiUrl,_that.xApiKey,_that.logoBaseUrl,_that.cloudlfareAccountId,_that.r2BucketName,_that.r2AccessKeyId,_that.r2SecretAccessKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String supabaseUrl,  String supabaseServiceRoleKey,  String? cfVersionMetadataId,  String? cfVersionMetadataTag,  String? cfVersionMetadataTimestamp,  String postgresUrl,  String internalApiUrl,  String xApiKey,  String logoBaseUrl,  String cloudlfareAccountId,  String r2BucketName,  String r2AccessKeyId,  String r2SecretAccessKey)?  $default,) {final _that = this;
switch (_that) {
case _Environments() when $default != null:
return $default(_that.supabaseUrl,_that.supabaseServiceRoleKey,_that.cfVersionMetadataId,_that.cfVersionMetadataTag,_that.cfVersionMetadataTimestamp,_that.postgresUrl,_that.internalApiUrl,_that.xApiKey,_that.logoBaseUrl,_that.cloudlfareAccountId,_that.r2BucketName,_that.r2AccessKeyId,_that.r2SecretAccessKey);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class _Environments extends Environments {
  const _Environments({required this.supabaseUrl, required this.supabaseServiceRoleKey, required this.cfVersionMetadataId, required this.cfVersionMetadataTag, required this.cfVersionMetadataTimestamp, required this.postgresUrl, required this.internalApiUrl, required this.xApiKey, required this.logoBaseUrl, required this.cloudlfareAccountId, required this.r2BucketName, required this.r2AccessKeyId, required this.r2SecretAccessKey}): super._();
  factory _Environments.fromJson(Map<String, dynamic> json) => _$EnvironmentsFromJson(json);

@override final  String supabaseUrl;
@override final  String supabaseServiceRoleKey;
@override final  String? cfVersionMetadataId;
@override final  String? cfVersionMetadataTag;
@override final  String? cfVersionMetadataTimestamp;
@override final  String postgresUrl;
@override final  String internalApiUrl;
@override final  String xApiKey;
@override final  String logoBaseUrl;
@override final  String cloudlfareAccountId;
@override final  String r2BucketName;
@override final  String r2AccessKeyId;
@override final  String r2SecretAccessKey;

/// Create a copy of Environments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvironmentsCopyWith<_Environments> get copyWith => __$EnvironmentsCopyWithImpl<_Environments>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnvironmentsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Environments&&(identical(other.supabaseUrl, supabaseUrl) || other.supabaseUrl == supabaseUrl)&&(identical(other.supabaseServiceRoleKey, supabaseServiceRoleKey) || other.supabaseServiceRoleKey == supabaseServiceRoleKey)&&(identical(other.cfVersionMetadataId, cfVersionMetadataId) || other.cfVersionMetadataId == cfVersionMetadataId)&&(identical(other.cfVersionMetadataTag, cfVersionMetadataTag) || other.cfVersionMetadataTag == cfVersionMetadataTag)&&(identical(other.cfVersionMetadataTimestamp, cfVersionMetadataTimestamp) || other.cfVersionMetadataTimestamp == cfVersionMetadataTimestamp)&&(identical(other.postgresUrl, postgresUrl) || other.postgresUrl == postgresUrl)&&(identical(other.internalApiUrl, internalApiUrl) || other.internalApiUrl == internalApiUrl)&&(identical(other.xApiKey, xApiKey) || other.xApiKey == xApiKey)&&(identical(other.logoBaseUrl, logoBaseUrl) || other.logoBaseUrl == logoBaseUrl)&&(identical(other.cloudlfareAccountId, cloudlfareAccountId) || other.cloudlfareAccountId == cloudlfareAccountId)&&(identical(other.r2BucketName, r2BucketName) || other.r2BucketName == r2BucketName)&&(identical(other.r2AccessKeyId, r2AccessKeyId) || other.r2AccessKeyId == r2AccessKeyId)&&(identical(other.r2SecretAccessKey, r2SecretAccessKey) || other.r2SecretAccessKey == r2SecretAccessKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,supabaseUrl,supabaseServiceRoleKey,cfVersionMetadataId,cfVersionMetadataTag,cfVersionMetadataTimestamp,postgresUrl,internalApiUrl,xApiKey,logoBaseUrl,cloudlfareAccountId,r2BucketName,r2AccessKeyId,r2SecretAccessKey);

@override
String toString() {
  return 'Environments(supabaseUrl: $supabaseUrl, supabaseServiceRoleKey: $supabaseServiceRoleKey, cfVersionMetadataId: $cfVersionMetadataId, cfVersionMetadataTag: $cfVersionMetadataTag, cfVersionMetadataTimestamp: $cfVersionMetadataTimestamp, postgresUrl: $postgresUrl, internalApiUrl: $internalApiUrl, xApiKey: $xApiKey, logoBaseUrl: $logoBaseUrl, cloudlfareAccountId: $cloudlfareAccountId, r2BucketName: $r2BucketName, r2AccessKeyId: $r2AccessKeyId, r2SecretAccessKey: $r2SecretAccessKey)';
}


}

/// @nodoc
abstract mixin class _$EnvironmentsCopyWith<$Res> implements $EnvironmentsCopyWith<$Res> {
  factory _$EnvironmentsCopyWith(_Environments value, $Res Function(_Environments) _then) = __$EnvironmentsCopyWithImpl;
@override @useResult
$Res call({
 String supabaseUrl, String supabaseServiceRoleKey, String? cfVersionMetadataId, String? cfVersionMetadataTag, String? cfVersionMetadataTimestamp, String postgresUrl, String internalApiUrl, String xApiKey, String logoBaseUrl, String cloudlfareAccountId, String r2BucketName, String r2AccessKeyId, String r2SecretAccessKey
});




}
/// @nodoc
class __$EnvironmentsCopyWithImpl<$Res>
    implements _$EnvironmentsCopyWith<$Res> {
  __$EnvironmentsCopyWithImpl(this._self, this._then);

  final _Environments _self;
  final $Res Function(_Environments) _then;

/// Create a copy of Environments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? supabaseUrl = null,Object? supabaseServiceRoleKey = null,Object? cfVersionMetadataId = freezed,Object? cfVersionMetadataTag = freezed,Object? cfVersionMetadataTimestamp = freezed,Object? postgresUrl = null,Object? internalApiUrl = null,Object? xApiKey = null,Object? logoBaseUrl = null,Object? cloudlfareAccountId = null,Object? r2BucketName = null,Object? r2AccessKeyId = null,Object? r2SecretAccessKey = null,}) {
  return _then(_Environments(
supabaseUrl: null == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as String,supabaseServiceRoleKey: null == supabaseServiceRoleKey ? _self.supabaseServiceRoleKey : supabaseServiceRoleKey // ignore: cast_nullable_to_non_nullable
as String,cfVersionMetadataId: freezed == cfVersionMetadataId ? _self.cfVersionMetadataId : cfVersionMetadataId // ignore: cast_nullable_to_non_nullable
as String?,cfVersionMetadataTag: freezed == cfVersionMetadataTag ? _self.cfVersionMetadataTag : cfVersionMetadataTag // ignore: cast_nullable_to_non_nullable
as String?,cfVersionMetadataTimestamp: freezed == cfVersionMetadataTimestamp ? _self.cfVersionMetadataTimestamp : cfVersionMetadataTimestamp // ignore: cast_nullable_to_non_nullable
as String?,postgresUrl: null == postgresUrl ? _self.postgresUrl : postgresUrl // ignore: cast_nullable_to_non_nullable
as String,internalApiUrl: null == internalApiUrl ? _self.internalApiUrl : internalApiUrl // ignore: cast_nullable_to_non_nullable
as String,xApiKey: null == xApiKey ? _self.xApiKey : xApiKey // ignore: cast_nullable_to_non_nullable
as String,logoBaseUrl: null == logoBaseUrl ? _self.logoBaseUrl : logoBaseUrl // ignore: cast_nullable_to_non_nullable
as String,cloudlfareAccountId: null == cloudlfareAccountId ? _self.cloudlfareAccountId : cloudlfareAccountId // ignore: cast_nullable_to_non_nullable
as String,r2BucketName: null == r2BucketName ? _self.r2BucketName : r2BucketName // ignore: cast_nullable_to_non_nullable
as String,r2AccessKeyId: null == r2AccessKeyId ? _self.r2AccessKeyId : r2AccessKeyId // ignore: cast_nullable_to_non_nullable
as String,r2SecretAccessKey: null == r2SecretAccessKey ? _self.r2SecretAccessKey : r2SecretAccessKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
