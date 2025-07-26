// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'individual_drafts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IndividualDrafts {

 int get id; int get individualId; String get name; String get slug; String? get logoName;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of IndividualDrafts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualDraftsCopyWith<IndividualDrafts> get copyWith => _$IndividualDraftsCopyWithImpl<IndividualDrafts>(this as IndividualDrafts, _$identity);

  /// Serializes this IndividualDrafts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualDrafts&&(identical(other.id, id) || other.id == id)&&(identical(other.individualId, individualId) || other.individualId == individualId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualId,name,slug,logoName,createdAt,updatedAt);

@override
String toString() {
  return 'IndividualDrafts(id: $id, individualId: $individualId, name: $name, slug: $slug, logoName: $logoName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IndividualDraftsCopyWith<$Res>  {
  factory $IndividualDraftsCopyWith(IndividualDrafts value, $Res Function(IndividualDrafts) _then) = _$IndividualDraftsCopyWithImpl;
@useResult
$Res call({
 int id, int individualId, String name, String slug, String? logoName,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$IndividualDraftsCopyWithImpl<$Res>
    implements $IndividualDraftsCopyWith<$Res> {
  _$IndividualDraftsCopyWithImpl(this._self, this._then);

  final IndividualDrafts _self;
  final $Res Function(IndividualDrafts) _then;

/// Create a copy of IndividualDrafts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? individualId = null,Object? name = null,Object? slug = null,Object? logoName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualId: null == individualId ? _self.individualId : individualId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoName: freezed == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [IndividualDrafts].
extension IndividualDraftsPatterns on IndividualDrafts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndividualDrafts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndividualDrafts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndividualDrafts value)  $default,){
final _that = this;
switch (_that) {
case _IndividualDrafts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndividualDrafts value)?  $default,){
final _that = this;
switch (_that) {
case _IndividualDrafts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int individualId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualDrafts() when $default != null:
return $default(_that.id,_that.individualId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int individualId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IndividualDrafts():
return $default(_that.id,_that.individualId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int individualId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IndividualDrafts() when $default != null:
return $default(_that.id,_that.individualId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualDrafts implements IndividualDrafts {
  const _IndividualDrafts({required this.id, required this.individualId, required this.name, required this.slug, required this.logoName, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _IndividualDrafts.fromJson(Map<String, dynamic> json) => _$IndividualDraftsFromJson(json);

@override final  int id;
@override final  int individualId;
@override final  String name;
@override final  String slug;
@override final  String? logoName;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of IndividualDrafts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualDraftsCopyWith<_IndividualDrafts> get copyWith => __$IndividualDraftsCopyWithImpl<_IndividualDrafts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualDraftsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualDrafts&&(identical(other.id, id) || other.id == id)&&(identical(other.individualId, individualId) || other.individualId == individualId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualId,name,slug,logoName,createdAt,updatedAt);

@override
String toString() {
  return 'IndividualDrafts(id: $id, individualId: $individualId, name: $name, slug: $slug, logoName: $logoName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IndividualDraftsCopyWith<$Res> implements $IndividualDraftsCopyWith<$Res> {
  factory _$IndividualDraftsCopyWith(_IndividualDrafts value, $Res Function(_IndividualDrafts) _then) = __$IndividualDraftsCopyWithImpl;
@override @useResult
$Res call({
 int id, int individualId, String name, String slug, String? logoName,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$IndividualDraftsCopyWithImpl<$Res>
    implements _$IndividualDraftsCopyWith<$Res> {
  __$IndividualDraftsCopyWithImpl(this._self, this._then);

  final _IndividualDrafts _self;
  final $Res Function(_IndividualDrafts) _then;

/// Create a copy of IndividualDrafts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? individualId = null,Object? name = null,Object? slug = null,Object? logoName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_IndividualDrafts(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualId: null == individualId ? _self.individualId : individualId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoName: freezed == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$IndividualDraftApprovals {

 int get id; int get individualDraftId;// 承認したユーザがアカウントを削除した場合、nullになる
 String? get approvedById;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of IndividualDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualDraftApprovalsCopyWith<IndividualDraftApprovals> get copyWith => _$IndividualDraftApprovalsCopyWithImpl<IndividualDraftApprovals>(this as IndividualDraftApprovals, _$identity);

  /// Serializes this IndividualDraftApprovals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualDraftApprovals&&(identical(other.id, id) || other.id == id)&&(identical(other.individualDraftId, individualDraftId) || other.individualDraftId == individualDraftId)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualDraftId,approvedById,createdAt);

@override
String toString() {
  return 'IndividualDraftApprovals(id: $id, individualDraftId: $individualDraftId, approvedById: $approvedById, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $IndividualDraftApprovalsCopyWith<$Res>  {
  factory $IndividualDraftApprovalsCopyWith(IndividualDraftApprovals value, $Res Function(IndividualDraftApprovals) _then) = _$IndividualDraftApprovalsCopyWithImpl;
@useResult
$Res call({
 int id, int individualDraftId, String? approvedById,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$IndividualDraftApprovalsCopyWithImpl<$Res>
    implements $IndividualDraftApprovalsCopyWith<$Res> {
  _$IndividualDraftApprovalsCopyWithImpl(this._self, this._then);

  final IndividualDraftApprovals _self;
  final $Res Function(IndividualDraftApprovals) _then;

/// Create a copy of IndividualDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? individualDraftId = null,Object? approvedById = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualDraftId: null == individualDraftId ? _self.individualDraftId : individualDraftId // ignore: cast_nullable_to_non_nullable
as int,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [IndividualDraftApprovals].
extension IndividualDraftApprovalsPatterns on IndividualDraftApprovals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndividualDraftApprovals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndividualDraftApprovals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndividualDraftApprovals value)  $default,){
final _that = this;
switch (_that) {
case _IndividualDraftApprovals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndividualDraftApprovals value)?  $default,){
final _that = this;
switch (_that) {
case _IndividualDraftApprovals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int individualDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualDraftApprovals() when $default != null:
return $default(_that.id,_that.individualDraftId,_that.approvedById,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int individualDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _IndividualDraftApprovals():
return $default(_that.id,_that.individualDraftId,_that.approvedById,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int individualDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _IndividualDraftApprovals() when $default != null:
return $default(_that.id,_that.individualDraftId,_that.approvedById,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualDraftApprovals implements IndividualDraftApprovals {
  const _IndividualDraftApprovals({required this.id, required this.individualDraftId, required this.approvedById, @RequiredDateTimeConverter() required this.createdAt});
  factory _IndividualDraftApprovals.fromJson(Map<String, dynamic> json) => _$IndividualDraftApprovalsFromJson(json);

@override final  int id;
@override final  int individualDraftId;
// 承認したユーザがアカウントを削除した場合、nullになる
@override final  String? approvedById;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of IndividualDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualDraftApprovalsCopyWith<_IndividualDraftApprovals> get copyWith => __$IndividualDraftApprovalsCopyWithImpl<_IndividualDraftApprovals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualDraftApprovalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualDraftApprovals&&(identical(other.id, id) || other.id == id)&&(identical(other.individualDraftId, individualDraftId) || other.individualDraftId == individualDraftId)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualDraftId,approvedById,createdAt);

@override
String toString() {
  return 'IndividualDraftApprovals(id: $id, individualDraftId: $individualDraftId, approvedById: $approvedById, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$IndividualDraftApprovalsCopyWith<$Res> implements $IndividualDraftApprovalsCopyWith<$Res> {
  factory _$IndividualDraftApprovalsCopyWith(_IndividualDraftApprovals value, $Res Function(_IndividualDraftApprovals) _then) = __$IndividualDraftApprovalsCopyWithImpl;
@override @useResult
$Res call({
 int id, int individualDraftId, String? approvedById,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$IndividualDraftApprovalsCopyWithImpl<$Res>
    implements _$IndividualDraftApprovalsCopyWith<$Res> {
  __$IndividualDraftApprovalsCopyWithImpl(this._self, this._then);

  final _IndividualDraftApprovals _self;
  final $Res Function(_IndividualDraftApprovals) _then;

/// Create a copy of IndividualDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? individualDraftId = null,Object? approvedById = freezed,Object? createdAt = null,}) {
  return _then(_IndividualDraftApprovals(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualDraftId: null == individualDraftId ? _self.individualDraftId : individualDraftId // ignore: cast_nullable_to_non_nullable
as int,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
