// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'individuals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Individuals {

 int get id; String get userId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Individuals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualsCopyWith<Individuals> get copyWith => _$IndividualsCopyWithImpl<Individuals>(this as Individuals, _$identity);

  /// Serializes this Individuals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Individuals&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,createdAt,updatedAt);

@override
String toString() {
  return 'Individuals(id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IndividualsCopyWith<$Res>  {
  factory $IndividualsCopyWith(Individuals value, $Res Function(Individuals) _then) = _$IndividualsCopyWithImpl;
@useResult
$Res call({
 int id, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$IndividualsCopyWithImpl<$Res>
    implements $IndividualsCopyWith<$Res> {
  _$IndividualsCopyWithImpl(this._self, this._then);

  final Individuals _self;
  final $Res Function(Individuals) _then;

/// Create a copy of Individuals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Individuals implements Individuals {
  const _Individuals({required this.id, required this.userId, required this.createdAt, required this.updatedAt});
  factory _Individuals.fromJson(Map<String, dynamic> json) => _$IndividualsFromJson(json);

@override final  int id;
@override final  String userId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Individuals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualsCopyWith<_Individuals> get copyWith => __$IndividualsCopyWithImpl<_Individuals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Individuals&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,createdAt,updatedAt);

@override
String toString() {
  return 'Individuals(id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IndividualsCopyWith<$Res> implements $IndividualsCopyWith<$Res> {
  factory _$IndividualsCopyWith(_Individuals value, $Res Function(_Individuals) _then) = __$IndividualsCopyWithImpl;
@override @useResult
$Res call({
 int id, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$IndividualsCopyWithImpl<$Res>
    implements _$IndividualsCopyWith<$Res> {
  __$IndividualsCopyWithImpl(this._self, this._then);

  final _Individuals _self;
  final $Res Function(_Individuals) _then;

/// Create a copy of Individuals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Individuals(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
