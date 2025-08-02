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
mixin _$SponsorNamingRights {

 int get id; int get companyId; String get type; String get name;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorNamingRights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorNamingRightsCopyWith<SponsorNamingRights> get copyWith => _$SponsorNamingRightsCopyWithImpl<SponsorNamingRights>(this as SponsorNamingRights, _$identity);

  /// Serializes this SponsorNamingRights to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorNamingRights&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,type,name,createdAt);

@override
String toString() {
  return 'SponsorNamingRights(id: $id, companyId: $companyId, type: $type, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorNamingRightsCopyWith<$Res>  {
  factory $SponsorNamingRightsCopyWith(SponsorNamingRights value, $Res Function(SponsorNamingRights) _then) = _$SponsorNamingRightsCopyWithImpl;
@useResult
$Res call({
 int id, int companyId, String type, String name,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorNamingRightsCopyWithImpl<$Res>
    implements $SponsorNamingRightsCopyWith<$Res> {
  _$SponsorNamingRightsCopyWithImpl(this._self, this._then);

  final SponsorNamingRights _self;
  final $Res Function(SponsorNamingRights) _then;

/// Create a copy of SponsorNamingRights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? type = null,Object? name = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorNamingRights].
extension SponsorNamingRightsPatterns on SponsorNamingRights {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorNamingRights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorNamingRights() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorNamingRights value)  $default,){
final _that = this;
switch (_that) {
case _SponsorNamingRights():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorNamingRights value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorNamingRights() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId,  String type,  String name, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorNamingRights() when $default != null:
return $default(_that.id,_that.companyId,_that.type,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId,  String type,  String name, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorNamingRights():
return $default(_that.id,_that.companyId,_that.type,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId,  String type,  String name, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorNamingRights() when $default != null:
return $default(_that.id,_that.companyId,_that.type,_that.name,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorNamingRights implements SponsorNamingRights {
  const _SponsorNamingRights({required this.id, required this.companyId, required this.type, required this.name, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorNamingRights.fromJson(Map<String, dynamic> json) => _$SponsorNamingRightsFromJson(json);

@override final  int id;
@override final  int companyId;
@override final  String type;
@override final  String name;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorNamingRights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorNamingRightsCopyWith<_SponsorNamingRights> get copyWith => __$SponsorNamingRightsCopyWithImpl<_SponsorNamingRights>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorNamingRightsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorNamingRights&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,type,name,createdAt);

@override
String toString() {
  return 'SponsorNamingRights(id: $id, companyId: $companyId, type: $type, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorNamingRightsCopyWith<$Res> implements $SponsorNamingRightsCopyWith<$Res> {
  factory _$SponsorNamingRightsCopyWith(_SponsorNamingRights value, $Res Function(_SponsorNamingRights) _then) = __$SponsorNamingRightsCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId, String type, String name,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorNamingRightsCopyWithImpl<$Res>
    implements _$SponsorNamingRightsCopyWith<$Res> {
  __$SponsorNamingRightsCopyWithImpl(this._self, this._then);

  final _SponsorNamingRights _self;
  final $Res Function(_SponsorNamingRights) _then;

/// Create a copy of SponsorNamingRights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? type = null,Object? name = null,Object? createdAt = null,}) {
  return _then(_SponsorNamingRights(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorNameplate {

 int get id; int get companyId;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorNameplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorNameplateCopyWith<SponsorNameplate> get copyWith => _$SponsorNameplateCopyWithImpl<SponsorNameplate>(this as SponsorNameplate, _$identity);

  /// Serializes this SponsorNameplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorNameplate&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorNameplate(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorNameplateCopyWith<$Res>  {
  factory $SponsorNameplateCopyWith(SponsorNameplate value, $Res Function(SponsorNameplate) _then) = _$SponsorNameplateCopyWithImpl;
@useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorNameplateCopyWithImpl<$Res>
    implements $SponsorNameplateCopyWith<$Res> {
  _$SponsorNameplateCopyWithImpl(this._self, this._then);

  final SponsorNameplate _self;
  final $Res Function(SponsorNameplate) _then;

/// Create a copy of SponsorNameplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorNameplate].
extension SponsorNameplatePatterns on SponsorNameplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorNameplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorNameplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorNameplate value)  $default,){
final _that = this;
switch (_that) {
case _SponsorNameplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorNameplate value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorNameplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorNameplate() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorNameplate():
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorNameplate() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorNameplate implements SponsorNameplate {
  const _SponsorNameplate({required this.id, required this.companyId, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorNameplate.fromJson(Map<String, dynamic> json) => _$SponsorNameplateFromJson(json);

@override final  int id;
@override final  int companyId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorNameplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorNameplateCopyWith<_SponsorNameplate> get copyWith => __$SponsorNameplateCopyWithImpl<_SponsorNameplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorNameplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorNameplate&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorNameplate(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorNameplateCopyWith<$Res> implements $SponsorNameplateCopyWith<$Res> {
  factory _$SponsorNameplateCopyWith(_SponsorNameplate value, $Res Function(_SponsorNameplate) _then) = __$SponsorNameplateCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorNameplateCopyWithImpl<$Res>
    implements _$SponsorNameplateCopyWith<$Res> {
  __$SponsorNameplateCopyWithImpl(this._self, this._then);

  final _SponsorNameplate _self;
  final $Res Function(_SponsorNameplate) _then;

/// Create a copy of SponsorNameplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_SponsorNameplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorLunch {

 int get id; int get companyId;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorLunch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorLunchCopyWith<SponsorLunch> get copyWith => _$SponsorLunchCopyWithImpl<SponsorLunch>(this as SponsorLunch, _$identity);

  /// Serializes this SponsorLunch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorLunch&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorLunch(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorLunchCopyWith<$Res>  {
  factory $SponsorLunchCopyWith(SponsorLunch value, $Res Function(SponsorLunch) _then) = _$SponsorLunchCopyWithImpl;
@useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorLunchCopyWithImpl<$Res>
    implements $SponsorLunchCopyWith<$Res> {
  _$SponsorLunchCopyWithImpl(this._self, this._then);

  final SponsorLunch _self;
  final $Res Function(SponsorLunch) _then;

/// Create a copy of SponsorLunch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorLunch].
extension SponsorLunchPatterns on SponsorLunch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorLunch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorLunch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorLunch value)  $default,){
final _that = this;
switch (_that) {
case _SponsorLunch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorLunch value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorLunch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorLunch() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorLunch():
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorLunch() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorLunch implements SponsorLunch {
  const _SponsorLunch({required this.id, required this.companyId, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorLunch.fromJson(Map<String, dynamic> json) => _$SponsorLunchFromJson(json);

@override final  int id;
@override final  int companyId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorLunch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorLunchCopyWith<_SponsorLunch> get copyWith => __$SponsorLunchCopyWithImpl<_SponsorLunch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorLunchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorLunch&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorLunch(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorLunchCopyWith<$Res> implements $SponsorLunchCopyWith<$Res> {
  factory _$SponsorLunchCopyWith(_SponsorLunch value, $Res Function(_SponsorLunch) _then) = __$SponsorLunchCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorLunchCopyWithImpl<$Res>
    implements _$SponsorLunchCopyWith<$Res> {
  __$SponsorLunchCopyWithImpl(this._self, this._then);

  final _SponsorLunch _self;
  final $Res Function(_SponsorLunch) _then;

/// Create a copy of SponsorLunch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_SponsorLunch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SponsorScholarship {

 int get id; int get companyId;@RequiredDateTimeConverter() DateTime get createdAt;
/// Create a copy of SponsorScholarship
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorScholarshipCopyWith<SponsorScholarship> get copyWith => _$SponsorScholarshipCopyWithImpl<SponsorScholarship>(this as SponsorScholarship, _$identity);

  /// Serializes this SponsorScholarship to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorScholarship&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorScholarship(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsorScholarshipCopyWith<$Res>  {
  factory $SponsorScholarshipCopyWith(SponsorScholarship value, $Res Function(SponsorScholarship) _then) = _$SponsorScholarshipCopyWithImpl;
@useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$SponsorScholarshipCopyWithImpl<$Res>
    implements $SponsorScholarshipCopyWith<$Res> {
  _$SponsorScholarshipCopyWithImpl(this._self, this._then);

  final SponsorScholarship _self;
  final $Res Function(SponsorScholarship) _then;

/// Create a copy of SponsorScholarship
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorScholarship].
extension SponsorScholarshipPatterns on SponsorScholarship {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorScholarship value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorScholarship() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorScholarship value)  $default,){
final _that = this;
switch (_that) {
case _SponsorScholarship():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorScholarship value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorScholarship() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorScholarship() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorScholarship():
return $default(_that.id,_that.companyId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId, @RequiredDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorScholarship() when $default != null:
return $default(_that.id,_that.companyId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorScholarship implements SponsorScholarship {
  const _SponsorScholarship({required this.id, required this.companyId, @RequiredDateTimeConverter() required this.createdAt});
  factory _SponsorScholarship.fromJson(Map<String, dynamic> json) => _$SponsorScholarshipFromJson(json);

@override final  int id;
@override final  int companyId;
@override@RequiredDateTimeConverter() final  DateTime createdAt;

/// Create a copy of SponsorScholarship
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorScholarshipCopyWith<_SponsorScholarship> get copyWith => __$SponsorScholarshipCopyWithImpl<_SponsorScholarship>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorScholarshipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorScholarship&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,createdAt);

@override
String toString() {
  return 'SponsorScholarship(id: $id, companyId: $companyId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorScholarshipCopyWith<$Res> implements $SponsorScholarshipCopyWith<$Res> {
  factory _$SponsorScholarshipCopyWith(_SponsorScholarship value, $Res Function(_SponsorScholarship) _then) = __$SponsorScholarshipCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId,@RequiredDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$SponsorScholarshipCopyWithImpl<$Res>
    implements _$SponsorScholarshipCopyWith<$Res> {
  __$SponsorScholarshipCopyWithImpl(this._self, this._then);

  final _SponsorScholarship _self;
  final $Res Function(_SponsorScholarship) _then;

/// Create a copy of SponsorScholarship
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? createdAt = null,}) {
  return _then(_SponsorScholarship(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
