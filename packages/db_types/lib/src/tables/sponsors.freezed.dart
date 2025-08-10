// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorCompanies {

 int get id; int get companyId; CompanySponsorType get sponsorType;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCompaniesCopyWith<SponsorCompanies> get copyWith => _$SponsorCompaniesCopyWithImpl<SponsorCompanies>(this as SponsorCompanies, _$identity);

  /// Serializes this SponsorCompanies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorCompanies&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,sponsorType,createdAt);

@override
String toString() {
  return 'SponsorCompanies(id: $id, companyId: $companyId, sponsorType: $sponsorType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorCompaniesCopyWith<$Res>  {
  factory $SponsorCompaniesCopyWith(SponsorCompanies value, $Res Function(SponsorCompanies) _then) = _$SponsorCompaniesCopyWithImpl;
@useResult
$Res call({
 int id, int companyId, CompanySponsorType sponsorType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorCompaniesCopyWithImpl<$Res>
    implements $SponsorCompaniesCopyWith<$Res> {
  _$SponsorCompaniesCopyWithImpl(this._self, this._then);

  final SponsorCompanies _self;
  final $Res Function(SponsorCompanies) _then;

/// Create a copy of SponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? sponsorType = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorCompanies].
extension SponsorCompaniesPatterns on SponsorCompanies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorCompanies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorCompanies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorCompanies value)  $default,){
final _that = this;
switch (_that) {
case _SponsorCompanies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorCompanies value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorCompanies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId,  CompanySponsorType sponsorType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorCompanies() when $default != null:
return $default(_that.id,_that.companyId,_that.sponsorType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId,  CompanySponsorType sponsorType, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorCompanies():
return $default(_that.id,_that.companyId,_that.sponsorType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId,  CompanySponsorType sponsorType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorCompanies() when $default != null:
return $default(_that.id,_that.companyId,_that.sponsorType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorCompanies implements SponsorCompanies {
  const _SponsorCompanies({required this.id, required this.companyId, required this.sponsorType, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorCompanies.fromJson(Map<String, dynamic> json) => _$SponsorCompaniesFromJson(json);

@override final  int id;
@override final  int companyId;
@override final  CompanySponsorType sponsorType;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorCompaniesCopyWith<_SponsorCompanies> get copyWith => __$SponsorCompaniesCopyWithImpl<_SponsorCompanies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorCompaniesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorCompanies&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,sponsorType,createdAt);

@override
String toString() {
  return 'SponsorCompanies(id: $id, companyId: $companyId, sponsorType: $sponsorType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorCompaniesCopyWith<$Res> implements $SponsorCompaniesCopyWith<$Res> {
  factory _$SponsorCompaniesCopyWith(_SponsorCompanies value, $Res Function(_SponsorCompanies) _then) = __$SponsorCompaniesCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId, CompanySponsorType sponsorType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorCompaniesCopyWithImpl<$Res>
    implements _$SponsorCompaniesCopyWith<$Res> {
  __$SponsorCompaniesCopyWithImpl(this._self, this._then);

  final _SponsorCompanies _self;
  final $Res Function(_SponsorCompanies) _then;

/// Create a copy of SponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? sponsorType = null,Object? createdAt = null,}) {
  return _then(_SponsorCompanies(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$BasicSponsorCompanies {

 int get id; int get sponsorCompanyId; BasicPlanType get basicPlanType;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of BasicSponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicSponsorCompaniesCopyWith<BasicSponsorCompanies> get copyWith => _$BasicSponsorCompaniesCopyWithImpl<BasicSponsorCompanies>(this as BasicSponsorCompanies, _$identity);

  /// Serializes this BasicSponsorCompanies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicSponsorCompanies&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsorCompanyId, sponsorCompanyId) || other.sponsorCompanyId == sponsorCompanyId)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsorCompanyId,basicPlanType,createdAt);

@override
String toString() {
  return 'BasicSponsorCompanies(id: $id, sponsorCompanyId: $sponsorCompanyId, basicPlanType: $basicPlanType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BasicSponsorCompaniesCopyWith<$Res>  {
  factory $BasicSponsorCompaniesCopyWith(BasicSponsorCompanies value, $Res Function(BasicSponsorCompanies) _then) = _$BasicSponsorCompaniesCopyWithImpl;
@useResult
$Res call({
 int id, int sponsorCompanyId, BasicPlanType basicPlanType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$BasicSponsorCompaniesCopyWithImpl<$Res>
    implements $BasicSponsorCompaniesCopyWith<$Res> {
  _$BasicSponsorCompaniesCopyWithImpl(this._self, this._then);

  final BasicSponsorCompanies _self;
  final $Res Function(BasicSponsorCompanies) _then;

/// Create a copy of BasicSponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sponsorCompanyId = null,Object? basicPlanType = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sponsorCompanyId: null == sponsorCompanyId ? _self.sponsorCompanyId : sponsorCompanyId // ignore: cast_nullable_to_non_nullable
as int,basicPlanType: null == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicSponsorCompanies].
extension BasicSponsorCompaniesPatterns on BasicSponsorCompanies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicSponsorCompanies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicSponsorCompanies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicSponsorCompanies value)  $default,){
final _that = this;
switch (_that) {
case _BasicSponsorCompanies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicSponsorCompanies value)?  $default,){
final _that = this;
switch (_that) {
case _BasicSponsorCompanies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sponsorCompanyId,  BasicPlanType basicPlanType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicSponsorCompanies() when $default != null:
return $default(_that.id,_that.sponsorCompanyId,_that.basicPlanType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sponsorCompanyId,  BasicPlanType basicPlanType, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BasicSponsorCompanies():
return $default(_that.id,_that.sponsorCompanyId,_that.basicPlanType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sponsorCompanyId,  BasicPlanType basicPlanType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BasicSponsorCompanies() when $default != null:
return $default(_that.id,_that.sponsorCompanyId,_that.basicPlanType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicSponsorCompanies implements BasicSponsorCompanies {
  const _BasicSponsorCompanies({required this.id, required this.sponsorCompanyId, required this.basicPlanType, @RequiredDateTimeConverter() required this.createdAt});
  factory _BasicSponsorCompanies.fromJson(Map<String, dynamic> json) => _$BasicSponsorCompaniesFromJson(json);

@override final  int id;
@override final  int sponsorCompanyId;
@override final  BasicPlanType basicPlanType;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of BasicSponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicSponsorCompaniesCopyWith<_BasicSponsorCompanies> get copyWith => __$BasicSponsorCompaniesCopyWithImpl<_BasicSponsorCompanies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicSponsorCompaniesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicSponsorCompanies&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsorCompanyId, sponsorCompanyId) || other.sponsorCompanyId == sponsorCompanyId)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsorCompanyId,basicPlanType,createdAt);

@override
String toString() {
  return 'BasicSponsorCompanies(id: $id, sponsorCompanyId: $sponsorCompanyId, basicPlanType: $basicPlanType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BasicSponsorCompaniesCopyWith<$Res> implements $BasicSponsorCompaniesCopyWith<$Res> {
  factory _$BasicSponsorCompaniesCopyWith(_BasicSponsorCompanies value, $Res Function(_BasicSponsorCompanies) _then) = __$BasicSponsorCompaniesCopyWithImpl;
@override @useResult
$Res call({
 int id, int sponsorCompanyId, BasicPlanType basicPlanType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$BasicSponsorCompaniesCopyWithImpl<$Res>
    implements _$BasicSponsorCompaniesCopyWith<$Res> {
  __$BasicSponsorCompaniesCopyWithImpl(this._self, this._then);

  final _BasicSponsorCompanies _self;
  final $Res Function(_BasicSponsorCompanies) _then;

/// Create a copy of BasicSponsorCompanies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sponsorCompanyId = null,Object? basicPlanType = null,Object? createdAt = null,}) {
  return _then(_BasicSponsorCompanies(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sponsorCompanyId: null == sponsorCompanyId ? _self.sponsorCompanyId : sponsorCompanyId // ignore: cast_nullable_to_non_nullable
as int,basicPlanType: null == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorCompanyOptions {

 int get id; int get sponsorCompanyId; OptionPlanType get optionPlanType;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorCompanyOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCompanyOptionsCopyWith<SponsorCompanyOptions> get copyWith => _$SponsorCompanyOptionsCopyWithImpl<SponsorCompanyOptions>(this as SponsorCompanyOptions, _$identity);

  /// Serializes this SponsorCompanyOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorCompanyOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsorCompanyId, sponsorCompanyId) || other.sponsorCompanyId == sponsorCompanyId)&&(identical(other.optionPlanType, optionPlanType) || other.optionPlanType == optionPlanType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsorCompanyId,optionPlanType,createdAt);

@override
String toString() {
  return 'SponsorCompanyOptions(id: $id, sponsorCompanyId: $sponsorCompanyId, optionPlanType: $optionPlanType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorCompanyOptionsCopyWith<$Res>  {
  factory $SponsorCompanyOptionsCopyWith(SponsorCompanyOptions value, $Res Function(SponsorCompanyOptions) _then) = _$SponsorCompanyOptionsCopyWithImpl;
@useResult
$Res call({
 int id, int sponsorCompanyId, OptionPlanType optionPlanType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorCompanyOptionsCopyWithImpl<$Res>
    implements $SponsorCompanyOptionsCopyWith<$Res> {
  _$SponsorCompanyOptionsCopyWithImpl(this._self, this._then);

  final SponsorCompanyOptions _self;
  final $Res Function(SponsorCompanyOptions) _then;

/// Create a copy of SponsorCompanyOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sponsorCompanyId = null,Object? optionPlanType = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sponsorCompanyId: null == sponsorCompanyId ? _self.sponsorCompanyId : sponsorCompanyId // ignore: cast_nullable_to_non_nullable
as int,optionPlanType: null == optionPlanType ? _self.optionPlanType : optionPlanType // ignore: cast_nullable_to_non_nullable
as OptionPlanType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorCompanyOptions].
extension SponsorCompanyOptionsPatterns on SponsorCompanyOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorCompanyOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorCompanyOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorCompanyOptions value)  $default,){
final _that = this;
switch (_that) {
case _SponsorCompanyOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorCompanyOptions value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorCompanyOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sponsorCompanyId,  OptionPlanType optionPlanType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorCompanyOptions() when $default != null:
return $default(_that.id,_that.sponsorCompanyId,_that.optionPlanType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sponsorCompanyId,  OptionPlanType optionPlanType, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorCompanyOptions():
return $default(_that.id,_that.sponsorCompanyId,_that.optionPlanType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sponsorCompanyId,  OptionPlanType optionPlanType, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorCompanyOptions() when $default != null:
return $default(_that.id,_that.sponsorCompanyId,_that.optionPlanType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorCompanyOptions implements SponsorCompanyOptions {
  const _SponsorCompanyOptions({required this.id, required this.sponsorCompanyId, required this.optionPlanType, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorCompanyOptions.fromJson(Map<String, dynamic> json) => _$SponsorCompanyOptionsFromJson(json);

@override final  int id;
@override final  int sponsorCompanyId;
@override final  OptionPlanType optionPlanType;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorCompanyOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorCompanyOptionsCopyWith<_SponsorCompanyOptions> get copyWith => __$SponsorCompanyOptionsCopyWithImpl<_SponsorCompanyOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorCompanyOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorCompanyOptions&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsorCompanyId, sponsorCompanyId) || other.sponsorCompanyId == sponsorCompanyId)&&(identical(other.optionPlanType, optionPlanType) || other.optionPlanType == optionPlanType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsorCompanyId,optionPlanType,createdAt);

@override
String toString() {
  return 'SponsorCompanyOptions(id: $id, sponsorCompanyId: $sponsorCompanyId, optionPlanType: $optionPlanType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorCompanyOptionsCopyWith<$Res> implements $SponsorCompanyOptionsCopyWith<$Res> {
  factory _$SponsorCompanyOptionsCopyWith(_SponsorCompanyOptions value, $Res Function(_SponsorCompanyOptions) _then) = __$SponsorCompanyOptionsCopyWithImpl;
@override @useResult
$Res call({
 int id, int sponsorCompanyId, OptionPlanType optionPlanType,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorCompanyOptionsCopyWithImpl<$Res>
    implements _$SponsorCompanyOptionsCopyWith<$Res> {
  __$SponsorCompanyOptionsCopyWithImpl(this._self, this._then);

  final _SponsorCompanyOptions _self;
  final $Res Function(_SponsorCompanyOptions) _then;

/// Create a copy of SponsorCompanyOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sponsorCompanyId = null,Object? optionPlanType = null,Object? createdAt = null,}) {
  return _then(_SponsorCompanyOptions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sponsorCompanyId: null == sponsorCompanyId ? _self.sponsorCompanyId : sponsorCompanyId // ignore: cast_nullable_to_non_nullable
as int,optionPlanType: null == optionPlanType ? _self.optionPlanType : optionPlanType // ignore: cast_nullable_to_non_nullable
as OptionPlanType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorIndividuals {

 int get id; int get individualId;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorIndividuals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorIndividualsCopyWith<SponsorIndividuals> get copyWith => _$SponsorIndividualsCopyWithImpl<SponsorIndividuals>(this as SponsorIndividuals, _$identity);

  /// Serializes this SponsorIndividuals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorIndividuals&&(identical(other.id, id) || other.id == id)&&(identical(other.individualId, individualId) || other.individualId == individualId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualId,createdAt);

@override
String toString() {
  return 'SponsorIndividuals(id: $id, individualId: $individualId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorIndividualsCopyWith<$Res>  {
  factory $SponsorIndividualsCopyWith(SponsorIndividuals value, $Res Function(SponsorIndividuals) _then) = _$SponsorIndividualsCopyWithImpl;
@useResult
$Res call({
 int id, int individualId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorIndividualsCopyWithImpl<$Res>
    implements $SponsorIndividualsCopyWith<$Res> {
  _$SponsorIndividualsCopyWithImpl(this._self, this._then);

  final SponsorIndividuals _self;
  final $Res Function(SponsorIndividuals) _then;

/// Create a copy of SponsorIndividuals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? individualId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualId: null == individualId ? _self.individualId : individualId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorIndividuals].
extension SponsorIndividualsPatterns on SponsorIndividuals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorIndividuals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorIndividuals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorIndividuals value)  $default,){
final _that = this;
switch (_that) {
case _SponsorIndividuals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorIndividuals value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorIndividuals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int individualId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorIndividuals() when $default != null:
return $default(_that.id,_that.individualId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int individualId, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorIndividuals():
return $default(_that.id,_that.individualId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int individualId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorIndividuals() when $default != null:
return $default(_that.id,_that.individualId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorIndividuals implements SponsorIndividuals {
  const _SponsorIndividuals({required this.id, required this.individualId, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorIndividuals.fromJson(Map<String, dynamic> json) => _$SponsorIndividualsFromJson(json);

@override final  int id;
@override final  int individualId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorIndividuals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorIndividualsCopyWith<_SponsorIndividuals> get copyWith => __$SponsorIndividualsCopyWithImpl<_SponsorIndividuals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorIndividualsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorIndividuals&&(identical(other.id, id) || other.id == id)&&(identical(other.individualId, individualId) || other.individualId == individualId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,individualId,createdAt);

@override
String toString() {
  return 'SponsorIndividuals(id: $id, individualId: $individualId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorIndividualsCopyWith<$Res> implements $SponsorIndividualsCopyWith<$Res> {
  factory _$SponsorIndividualsCopyWith(_SponsorIndividuals value, $Res Function(_SponsorIndividuals) _then) = __$SponsorIndividualsCopyWithImpl;
@override @useResult
$Res call({
 int id, int individualId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorIndividualsCopyWithImpl<$Res>
    implements _$SponsorIndividualsCopyWith<$Res> {
  __$SponsorIndividualsCopyWithImpl(this._self, this._then);

  final _SponsorIndividuals _self;
  final $Res Function(_SponsorIndividuals) _then;

/// Create a copy of SponsorIndividuals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? individualId = null,Object? createdAt = null,}) {
  return _then(_SponsorIndividuals(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,individualId: null == individualId ? _self.individualId : individualId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$CompanySponsorDetail {

 int get id; String get name; String get logoName; CompanySponsorType get sponsorType; BasicPlanType? get basicPlanType; List<OptionPlanType>? get optionPlanTypes;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of CompanySponsorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<CompanySponsorDetail> get copyWith => _$CompanySponsorDetailCopyWithImpl<CompanySponsorDetail>(this as CompanySponsorDetail, _$identity);

  /// Serializes this CompanySponsorDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanySponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&const DeepCollectionEquality().equals(other.optionPlanTypes, optionPlanTypes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoName,sponsorType,basicPlanType,const DeepCollectionEquality().hash(optionPlanTypes),createdAt);

@override
String toString() {
  return 'CompanySponsorDetail(id: $id, name: $name, logoName: $logoName, sponsorType: $sponsorType, basicPlanType: $basicPlanType, optionPlanTypes: $optionPlanTypes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CompanySponsorDetailCopyWith<$Res>  {
  factory $CompanySponsorDetailCopyWith(CompanySponsorDetail value, $Res Function(CompanySponsorDetail) _then) = _$CompanySponsorDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String logoName, CompanySponsorType sponsorType, BasicPlanType? basicPlanType, List<OptionPlanType>? optionPlanTypes,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$CompanySponsorDetailCopyWithImpl<$Res>
    implements $CompanySponsorDetailCopyWith<$Res> {
  _$CompanySponsorDetailCopyWithImpl(this._self, this._then);

  final CompanySponsorDetail _self;
  final $Res Function(CompanySponsorDetail) _then;

/// Create a copy of CompanySponsorDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoName = null,Object? sponsorType = null,Object? basicPlanType = freezed,Object? optionPlanTypes = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType?,optionPlanTypes: freezed == optionPlanTypes ? _self.optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<OptionPlanType>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanySponsorDetail].
extension CompanySponsorDetailPatterns on CompanySponsorDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanySponsorDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanySponsorDetail value)  $default,){
final _that = this;
switch (_that) {
case _CompanySponsorDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanySponsorDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String logoName,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType>? optionPlanTypes, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.logoName,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String logoName,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType>? optionPlanTypes, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CompanySponsorDetail():
return $default(_that.id,_that.name,_that.logoName,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String logoName,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType>? optionPlanTypes, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.logoName,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanySponsorDetail implements CompanySponsorDetail {
  const _CompanySponsorDetail({required this.id, required this.name, required this.logoName, required this.sponsorType, this.basicPlanType, final  List<OptionPlanType>? optionPlanTypes, @RequiredDateTimeConverter() required this.createdAt}): _optionPlanTypes = optionPlanTypes;
  factory _CompanySponsorDetail.fromJson(Map<String, dynamic> json) => _$CompanySponsorDetailFromJson(json);

@override final  int id;
@override final  String name;
@override final  String logoName;
@override final  CompanySponsorType sponsorType;
@override final  BasicPlanType? basicPlanType;
 final  List<OptionPlanType>? _optionPlanTypes;
@override List<OptionPlanType>? get optionPlanTypes {
  final value = _optionPlanTypes;
  if (value == null) return null;
  if (_optionPlanTypes is EqualUnmodifiableListView) return _optionPlanTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of CompanySponsorDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanySponsorDetailCopyWith<_CompanySponsorDetail> get copyWith => __$CompanySponsorDetailCopyWithImpl<_CompanySponsorDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanySponsorDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanySponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&const DeepCollectionEquality().equals(other._optionPlanTypes, _optionPlanTypes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoName,sponsorType,basicPlanType,const DeepCollectionEquality().hash(_optionPlanTypes),createdAt);

@override
String toString() {
  return 'CompanySponsorDetail(id: $id, name: $name, logoName: $logoName, sponsorType: $sponsorType, basicPlanType: $basicPlanType, optionPlanTypes: $optionPlanTypes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CompanySponsorDetailCopyWith<$Res> implements $CompanySponsorDetailCopyWith<$Res> {
  factory _$CompanySponsorDetailCopyWith(_CompanySponsorDetail value, $Res Function(_CompanySponsorDetail) _then) = __$CompanySponsorDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String logoName, CompanySponsorType sponsorType, BasicPlanType? basicPlanType, List<OptionPlanType>? optionPlanTypes,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$CompanySponsorDetailCopyWithImpl<$Res>
    implements _$CompanySponsorDetailCopyWith<$Res> {
  __$CompanySponsorDetailCopyWithImpl(this._self, this._then);

  final _CompanySponsorDetail _self;
  final $Res Function(_CompanySponsorDetail) _then;

/// Create a copy of CompanySponsorDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoName = null,Object? sponsorType = null,Object? basicPlanType = freezed,Object? optionPlanTypes = freezed,Object? createdAt = null,}) {
  return _then(_CompanySponsorDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType?,optionPlanTypes: freezed == optionPlanTypes ? _self._optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<OptionPlanType>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$IndividualSponsorDetail {

 int get id; String? get userName;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of IndividualSponsorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualSponsorDetailCopyWith<IndividualSponsorDetail> get copyWith => _$IndividualSponsorDetailCopyWithImpl<IndividualSponsorDetail>(this as IndividualSponsorDetail, _$identity);

  /// Serializes this IndividualSponsorDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualSponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,createdAt);

@override
String toString() {
  return 'IndividualSponsorDetail(id: $id, userName: $userName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $IndividualSponsorDetailCopyWith<$Res>  {
  factory $IndividualSponsorDetailCopyWith(IndividualSponsorDetail value, $Res Function(IndividualSponsorDetail) _then) = _$IndividualSponsorDetailCopyWithImpl;
@useResult
$Res call({
 int id, String? userName,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$IndividualSponsorDetailCopyWithImpl<$Res>
    implements $IndividualSponsorDetailCopyWith<$Res> {
  _$IndividualSponsorDetailCopyWithImpl(this._self, this._then);

  final IndividualSponsorDetail _self;
  final $Res Function(IndividualSponsorDetail) _then;

/// Create a copy of IndividualSponsorDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userName = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [IndividualSponsorDetail].
extension IndividualSponsorDetailPatterns on IndividualSponsorDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndividualSponsorDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndividualSponsorDetail value)  $default,){
final _that = this;
switch (_that) {
case _IndividualSponsorDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndividualSponsorDetail value)?  $default,){
final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? userName, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
return $default(_that.id,_that.userName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? userName, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail():
return $default(_that.id,_that.userName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? userName, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
return $default(_that.id,_that.userName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualSponsorDetail implements IndividualSponsorDetail {
  const _IndividualSponsorDetail({required this.id, required this.userName, @RequiredDateTimeConverter() required this.createdAt});
  factory _IndividualSponsorDetail.fromJson(Map<String, dynamic> json) => _$IndividualSponsorDetailFromJson(json);

@override final  int id;
@override final  String? userName;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of IndividualSponsorDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualSponsorDetailCopyWith<_IndividualSponsorDetail> get copyWith => __$IndividualSponsorDetailCopyWithImpl<_IndividualSponsorDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualSponsorDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualSponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userName,createdAt);

@override
String toString() {
  return 'IndividualSponsorDetail(id: $id, userName: $userName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$IndividualSponsorDetailCopyWith<$Res> implements $IndividualSponsorDetailCopyWith<$Res> {
  factory _$IndividualSponsorDetailCopyWith(_IndividualSponsorDetail value, $Res Function(_IndividualSponsorDetail) _then) = __$IndividualSponsorDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String? userName,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$IndividualSponsorDetailCopyWithImpl<$Res>
    implements _$IndividualSponsorDetailCopyWith<$Res> {
  __$IndividualSponsorDetailCopyWithImpl(this._self, this._then);

  final _IndividualSponsorDetail _self;
  final $Res Function(_IndividualSponsorDetail) _then;

/// Create a copy of IndividualSponsorDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userName = freezed,Object? createdAt = null,}) {
  return _then(_IndividualSponsorDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorSummary {

 List<CompanySponsorDetail> get companySponsors; List<IndividualSponsorDetail> get individualSponsors;
/// Create a copy of SponsorSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSummaryCopyWith<SponsorSummary> get copyWith => _$SponsorSummaryCopyWithImpl<SponsorSummary>(this as SponsorSummary, _$identity);

  /// Serializes this SponsorSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSummary&&const DeepCollectionEquality().equals(other.companySponsors, companySponsors)&&const DeepCollectionEquality().equals(other.individualSponsors, individualSponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(companySponsors),const DeepCollectionEquality().hash(individualSponsors));

@override
String toString() {
  return 'SponsorSummary(companySponsors: $companySponsors, individualSponsors: $individualSponsors)';
}


}

/// @nodoc
abstract mixin class $SponsorSummaryCopyWith<$Res>  {
  factory $SponsorSummaryCopyWith(SponsorSummary value, $Res Function(SponsorSummary) _then) = _$SponsorSummaryCopyWithImpl;
@useResult
$Res call({
 List<CompanySponsorDetail> companySponsors, List<IndividualSponsorDetail> individualSponsors
});




}
/// @nodoc
class _$SponsorSummaryCopyWithImpl<$Res>
    implements $SponsorSummaryCopyWith<$Res> {
  _$SponsorSummaryCopyWithImpl(this._self, this._then);

  final SponsorSummary _self;
  final $Res Function(SponsorSummary) _then;

/// Create a copy of SponsorSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companySponsors = null,Object? individualSponsors = null,}) {
  return _then(_self.copyWith(
companySponsors: null == companySponsors ? _self.companySponsors : companySponsors // ignore: cast_nullable_to_non_nullable
as List<CompanySponsorDetail>,individualSponsors: null == individualSponsors ? _self.individualSponsors : individualSponsors // ignore: cast_nullable_to_non_nullable
as List<IndividualSponsorDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorSummary].
extension SponsorSummaryPatterns on SponsorSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSummary value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CompanySponsorDetail> companySponsors,  List<IndividualSponsorDetail> individualSponsors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSummary() when $default != null:
return $default(_that.companySponsors,_that.individualSponsors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CompanySponsorDetail> companySponsors,  List<IndividualSponsorDetail> individualSponsors)  $default,) {final _that = this;
switch (_that) {
case _SponsorSummary():
return $default(_that.companySponsors,_that.individualSponsors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CompanySponsorDetail> companySponsors,  List<IndividualSponsorDetail> individualSponsors)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSummary() when $default != null:
return $default(_that.companySponsors,_that.individualSponsors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSummary implements SponsorSummary {
  const _SponsorSummary({required final  List<CompanySponsorDetail> companySponsors, required final  List<IndividualSponsorDetail> individualSponsors}): _companySponsors = companySponsors,_individualSponsors = individualSponsors;
  factory _SponsorSummary.fromJson(Map<String, dynamic> json) => _$SponsorSummaryFromJson(json);

 final  List<CompanySponsorDetail> _companySponsors;
@override List<CompanySponsorDetail> get companySponsors {
  if (_companySponsors is EqualUnmodifiableListView) return _companySponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companySponsors);
}

 final  List<IndividualSponsorDetail> _individualSponsors;
@override List<IndividualSponsorDetail> get individualSponsors {
  if (_individualSponsors is EqualUnmodifiableListView) return _individualSponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_individualSponsors);
}


/// Create a copy of SponsorSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSummaryCopyWith<_SponsorSummary> get copyWith => __$SponsorSummaryCopyWithImpl<_SponsorSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSummary&&const DeepCollectionEquality().equals(other._companySponsors, _companySponsors)&&const DeepCollectionEquality().equals(other._individualSponsors, _individualSponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companySponsors),const DeepCollectionEquality().hash(_individualSponsors));

@override
String toString() {
  return 'SponsorSummary(companySponsors: $companySponsors, individualSponsors: $individualSponsors)';
}


}

/// @nodoc
abstract mixin class _$SponsorSummaryCopyWith<$Res> implements $SponsorSummaryCopyWith<$Res> {
  factory _$SponsorSummaryCopyWith(_SponsorSummary value, $Res Function(_SponsorSummary) _then) = __$SponsorSummaryCopyWithImpl;
@override @useResult
$Res call({
 List<CompanySponsorDetail> companySponsors, List<IndividualSponsorDetail> individualSponsors
});




}
/// @nodoc
class __$SponsorSummaryCopyWithImpl<$Res>
    implements _$SponsorSummaryCopyWith<$Res> {
  __$SponsorSummaryCopyWithImpl(this._self, this._then);

  final _SponsorSummary _self;
  final $Res Function(_SponsorSummary) _then;

/// Create a copy of SponsorSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companySponsors = null,Object? individualSponsors = null,}) {
  return _then(_SponsorSummary(
companySponsors: null == companySponsors ? _self._companySponsors : companySponsors // ignore: cast_nullable_to_non_nullable
as List<CompanySponsorDetail>,individualSponsors: null == individualSponsors ? _self._individualSponsors : individualSponsors // ignore: cast_nullable_to_non_nullable
as List<IndividualSponsorDetail>,
  ));
}


}

// dart format on
