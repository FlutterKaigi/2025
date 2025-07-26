// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_drafts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyDrafts {

 int get id; int get companyId; String get name; String get slug; String? get logoName;@RequiredDateTimeConverter() DateTime get createdAt;@RequiredDateTimeConverter() DateTime get updatedAt;
/// Create a copy of CompanyDrafts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyDraftsCopyWith<CompanyDrafts> get copyWith => _$CompanyDraftsCopyWithImpl<CompanyDrafts>(this as CompanyDrafts, _$identity);

  /// Serializes this CompanyDrafts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDrafts&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,slug,logoName,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyDrafts(id: $id, companyId: $companyId, name: $name, slug: $slug, logoName: $logoName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompanyDraftsCopyWith<$Res>  {
  factory $CompanyDraftsCopyWith(CompanyDrafts value, $Res Function(CompanyDrafts) _then) = _$CompanyDraftsCopyWithImpl;
@useResult
$Res call({
 int id, int companyId, String name, String slug, String? logoName,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$CompanyDraftsCopyWithImpl<$Res>
    implements $CompanyDraftsCopyWith<$Res> {
  _$CompanyDraftsCopyWithImpl(this._self, this._then);

  final CompanyDrafts _self;
  final $Res Function(CompanyDrafts) _then;

/// Create a copy of CompanyDrafts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? slug = null,Object? logoName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoName: freezed == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyDrafts].
extension CompanyDraftsPatterns on CompanyDrafts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyDrafts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyDrafts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyDrafts value)  $default,){
final _that = this;
switch (_that) {
case _CompanyDrafts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyDrafts value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyDrafts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyDrafts() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CompanyDrafts():
return $default(_that.id,_that.companyId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId,  String name,  String slug,  String? logoName, @RequiredDateTimeConverter()  DateTime createdAt, @RequiredDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanyDrafts() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.slug,_that.logoName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyDrafts implements CompanyDrafts {
  const _CompanyDrafts({required this.id, required this.companyId, required this.name, required this.slug, required this.logoName, @RequiredDateTimeConverter() required this.createdAt, @RequiredDateTimeConverter() required this.updatedAt});
  factory _CompanyDrafts.fromJson(Map<String, dynamic> json) => _$CompanyDraftsFromJson(json);

@override final  int id;
@override final  int companyId;
@override final  String name;
@override final  String slug;
@override final  String? logoName;
@override@RequiredDateTimeConverter() final  DateTime createdAt;
@override@RequiredDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of CompanyDrafts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyDraftsCopyWith<_CompanyDrafts> get copyWith => __$CompanyDraftsCopyWithImpl<_CompanyDrafts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyDraftsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyDrafts&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,slug,logoName,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyDrafts(id: $id, companyId: $companyId, name: $name, slug: $slug, logoName: $logoName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyDraftsCopyWith<$Res> implements $CompanyDraftsCopyWith<$Res> {
  factory _$CompanyDraftsCopyWith(_CompanyDrafts value, $Res Function(_CompanyDrafts) _then) = __$CompanyDraftsCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId, String name, String slug, String? logoName,@RequiredDateTimeConverter() DateTime createdAt,@RequiredDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$CompanyDraftsCopyWithImpl<$Res>
    implements _$CompanyDraftsCopyWith<$Res> {
  __$CompanyDraftsCopyWithImpl(this._self, this._then);

  final _CompanyDrafts _self;
  final $Res Function(_CompanyDrafts) _then;

/// Create a copy of CompanyDrafts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? slug = null,Object? logoName = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CompanyDrafts(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
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
mixin _$CompanyDraftApprovals {

 int get id; int get companyDraftId;// 承認したユーザがアカウントを削除した場合、nullになる
 String? get approvedById;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of CompanyDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyDraftApprovalsCopyWith<CompanyDraftApprovals> get copyWith => _$CompanyDraftApprovalsCopyWithImpl<CompanyDraftApprovals>(this as CompanyDraftApprovals, _$identity);

  /// Serializes this CompanyDraftApprovals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDraftApprovals&&(identical(other.id, id) || other.id == id)&&(identical(other.companyDraftId, companyDraftId) || other.companyDraftId == companyDraftId)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyDraftId,approvedById,createdAt);

@override
String toString() {
  return 'CompanyDraftApprovals(id: $id, companyDraftId: $companyDraftId, approvedById: $approvedById, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CompanyDraftApprovalsCopyWith<$Res>  {
  factory $CompanyDraftApprovalsCopyWith(CompanyDraftApprovals value, $Res Function(CompanyDraftApprovals) _then) = _$CompanyDraftApprovalsCopyWithImpl;
@useResult
$Res call({
 int id, int companyDraftId, String? approvedById,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$CompanyDraftApprovalsCopyWithImpl<$Res>
    implements $CompanyDraftApprovalsCopyWith<$Res> {
  _$CompanyDraftApprovalsCopyWithImpl(this._self, this._then);

  final CompanyDraftApprovals _self;
  final $Res Function(CompanyDraftApprovals) _then;

/// Create a copy of CompanyDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyDraftId = null,Object? approvedById = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyDraftId: null == companyDraftId ? _self.companyDraftId : companyDraftId // ignore: cast_nullable_to_non_nullable
as int,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyDraftApprovals].
extension CompanyDraftApprovalsPatterns on CompanyDraftApprovals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyDraftApprovals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyDraftApprovals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyDraftApprovals value)  $default,){
final _that = this;
switch (_that) {
case _CompanyDraftApprovals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyDraftApprovals value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyDraftApprovals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyDraftApprovals() when $default != null:
return $default(_that.id,_that.companyDraftId,_that.approvedById,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CompanyDraftApprovals():
return $default(_that.id,_that.companyDraftId,_that.approvedById,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyDraftId,  String? approvedById, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanyDraftApprovals() when $default != null:
return $default(_that.id,_that.companyDraftId,_that.approvedById,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyDraftApprovals implements CompanyDraftApprovals {
  const _CompanyDraftApprovals({required this.id, required this.companyDraftId, required this.approvedById, @RequiredDateTimeConverter() required this.createdAt});
  factory _CompanyDraftApprovals.fromJson(Map<String, dynamic> json) => _$CompanyDraftApprovalsFromJson(json);

@override final  int id;
@override final  int companyDraftId;
// 承認したユーザがアカウントを削除した場合、nullになる
@override final  String? approvedById;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of CompanyDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyDraftApprovalsCopyWith<_CompanyDraftApprovals> get copyWith => __$CompanyDraftApprovalsCopyWithImpl<_CompanyDraftApprovals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyDraftApprovalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyDraftApprovals&&(identical(other.id, id) || other.id == id)&&(identical(other.companyDraftId, companyDraftId) || other.companyDraftId == companyDraftId)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyDraftId,approvedById,createdAt);

@override
String toString() {
  return 'CompanyDraftApprovals(id: $id, companyDraftId: $companyDraftId, approvedById: $approvedById, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyDraftApprovalsCopyWith<$Res> implements $CompanyDraftApprovalsCopyWith<$Res> {
  factory _$CompanyDraftApprovalsCopyWith(_CompanyDraftApprovals value, $Res Function(_CompanyDraftApprovals) _then) = __$CompanyDraftApprovalsCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyDraftId, String? approvedById,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$CompanyDraftApprovalsCopyWithImpl<$Res>
    implements _$CompanyDraftApprovalsCopyWith<$Res> {
  __$CompanyDraftApprovalsCopyWithImpl(this._self, this._then);

  final _CompanyDraftApprovals _self;
  final $Res Function(_CompanyDraftApprovals) _then;

/// Create a copy of CompanyDraftApprovals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyDraftId = null,Object? approvedById = freezed,Object? createdAt = null,}) {
  return _then(_CompanyDraftApprovals(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyDraftId: null == companyDraftId ? _self.companyDraftId : companyDraftId // ignore: cast_nullable_to_non_nullable
as int,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
