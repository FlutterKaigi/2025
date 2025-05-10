// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyInvitation {

 int get companyId; String get key; DateTime get createdAt; DateTime get updatedAt; DateTime? get disabledAt;
/// Create a copy of CompanyInvitation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyInvitationCopyWith<CompanyInvitation> get copyWith => _$CompanyInvitationCopyWithImpl<CompanyInvitation>(this as CompanyInvitation, _$identity);

  /// Serializes this CompanyInvitation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInvitation&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.key, key) || other.key == key)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.disabledAt, disabledAt) || other.disabledAt == disabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,key,createdAt,updatedAt,disabledAt);

@override
String toString() {
  return 'CompanyInvitation(companyId: $companyId, key: $key, createdAt: $createdAt, updatedAt: $updatedAt, disabledAt: $disabledAt)';
}


}

/// @nodoc
abstract mixin class $CompanyInvitationCopyWith<$Res>  {
  factory $CompanyInvitationCopyWith(CompanyInvitation value, $Res Function(CompanyInvitation) _then) = _$CompanyInvitationCopyWithImpl;
@useResult
$Res call({
 int companyId, String key, DateTime createdAt, DateTime updatedAt, DateTime? disabledAt
});




}
/// @nodoc
class _$CompanyInvitationCopyWithImpl<$Res>
    implements $CompanyInvitationCopyWith<$Res> {
  _$CompanyInvitationCopyWithImpl(this._self, this._then);

  final CompanyInvitation _self;
  final $Res Function(CompanyInvitation) _then;

/// Create a copy of CompanyInvitation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyId = null,Object? key = null,Object? createdAt = null,Object? updatedAt = null,Object? disabledAt = freezed,}) {
  return _then(_self.copyWith(
companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,disabledAt: freezed == disabledAt ? _self.disabledAt : disabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CompanyInvitation implements CompanyInvitation {
  const _CompanyInvitation({required this.companyId, required this.key, required this.createdAt, required this.updatedAt, required this.disabledAt});
  factory _CompanyInvitation.fromJson(Map<String, dynamic> json) => _$CompanyInvitationFromJson(json);

@override final  int companyId;
@override final  String key;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? disabledAt;

/// Create a copy of CompanyInvitation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyInvitationCopyWith<_CompanyInvitation> get copyWith => __$CompanyInvitationCopyWithImpl<_CompanyInvitation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyInvitationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyInvitation&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.key, key) || other.key == key)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.disabledAt, disabledAt) || other.disabledAt == disabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,key,createdAt,updatedAt,disabledAt);

@override
String toString() {
  return 'CompanyInvitation(companyId: $companyId, key: $key, createdAt: $createdAt, updatedAt: $updatedAt, disabledAt: $disabledAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyInvitationCopyWith<$Res> implements $CompanyInvitationCopyWith<$Res> {
  factory _$CompanyInvitationCopyWith(_CompanyInvitation value, $Res Function(_CompanyInvitation) _then) = __$CompanyInvitationCopyWithImpl;
@override @useResult
$Res call({
 int companyId, String key, DateTime createdAt, DateTime updatedAt, DateTime? disabledAt
});




}
/// @nodoc
class __$CompanyInvitationCopyWithImpl<$Res>
    implements _$CompanyInvitationCopyWith<$Res> {
  __$CompanyInvitationCopyWithImpl(this._self, this._then);

  final _CompanyInvitation _self;
  final $Res Function(_CompanyInvitation) _then;

/// Create a copy of CompanyInvitation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyId = null,Object? key = null,Object? createdAt = null,Object? updatedAt = null,Object? disabledAt = freezed,}) {
  return _then(_CompanyInvitation(
companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,disabledAt: freezed == disabledAt ? _self.disabledAt : disabledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
