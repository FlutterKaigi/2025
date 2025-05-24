// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListItem {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt; List<UserRole> get roles;
/// Create a copy of UserListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListItemCopyWith<UserListItem> get copyWith => _$UserListItemCopyWithImpl<UserListItem>(this as UserListItem, _$identity);

  /// Serializes this UserListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserListItem(id: $id, createdAt: $createdAt, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserListItemCopyWith<$Res>  {
  factory $UserListItemCopyWith(UserListItem value, $Res Function(UserListItem) _then) = _$UserListItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt, List<UserRole> roles
});




}
/// @nodoc
class _$UserListItemCopyWithImpl<$Res>
    implements $UserListItemCopyWith<$Res> {
  _$UserListItemCopyWithImpl(this._self, this._then);

  final UserListItem _self;
  final $Res Function(UserListItem) _then;

/// Create a copy of UserListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? roles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserListItem implements UserListItem {
  const _UserListItem({required this.id, @JsonKey(name: 'created_at') required this.createdAt, required final  List<UserRole> roles}): _roles = roles;
  factory _UserListItem.fromJson(Map<String, dynamic> json) => _$UserListItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
 final  List<UserRole> _roles;
@override List<UserRole> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListItemCopyWith<_UserListItem> get copyWith => __$UserListItemCopyWithImpl<_UserListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserListItem(id: $id, createdAt: $createdAt, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserListItemCopyWith<$Res> implements $UserListItemCopyWith<$Res> {
  factory _$UserListItemCopyWith(_UserListItem value, $Res Function(_UserListItem) _then) = __$UserListItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt, List<UserRole> roles
});




}
/// @nodoc
class __$UserListItemCopyWithImpl<$Res>
    implements _$UserListItemCopyWith<$Res> {
  __$UserListItemCopyWithImpl(this._self, this._then);

  final _UserListItem _self;
  final $Res Function(_UserListItem) _then;

/// Create a copy of UserListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? roles = null,}) {
  return _then(_UserListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>,
  ));
}


}

// dart format on
