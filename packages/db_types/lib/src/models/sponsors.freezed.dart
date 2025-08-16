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
mixin _$CompanySponsorDetail {

 int get id; String get name; String get logoName; String get slug; String get prText; String get websiteUrl; CompanySponsorType get sponsorType; BasicPlanType? get basicPlanType; List<OptionPlanType> get optionPlanTypes;
/// Create a copy of CompanySponsorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanySponsorDetailCopyWith<CompanySponsorDetail> get copyWith => _$CompanySponsorDetailCopyWithImpl<CompanySponsorDetail>(this as CompanySponsorDetail, _$identity);

  /// Serializes this CompanySponsorDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanySponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.prText, prText) || other.prText == prText)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&const DeepCollectionEquality().equals(other.optionPlanTypes, optionPlanTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoName,slug,prText,websiteUrl,sponsorType,basicPlanType,const DeepCollectionEquality().hash(optionPlanTypes));

@override
String toString() {
  return 'CompanySponsorDetail(id: $id, name: $name, logoName: $logoName, slug: $slug, prText: $prText, websiteUrl: $websiteUrl, sponsorType: $sponsorType, basicPlanType: $basicPlanType, optionPlanTypes: $optionPlanTypes)';
}


}

/// @nodoc
abstract mixin class $CompanySponsorDetailCopyWith<$Res>  {
  factory $CompanySponsorDetailCopyWith(CompanySponsorDetail value, $Res Function(CompanySponsorDetail) _then) = _$CompanySponsorDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String logoName, String slug, String prText, String websiteUrl, CompanySponsorType sponsorType, BasicPlanType? basicPlanType, List<OptionPlanType> optionPlanTypes
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoName = null,Object? slug = null,Object? prText = null,Object? websiteUrl = null,Object? sponsorType = null,Object? basicPlanType = freezed,Object? optionPlanTypes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,prText: null == prText ? _self.prText : prText // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType?,optionPlanTypes: null == optionPlanTypes ? _self.optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<OptionPlanType>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String logoName,  String slug,  String prText,  String websiteUrl,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType> optionPlanTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.logoName,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String logoName,  String slug,  String prText,  String websiteUrl,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType> optionPlanTypes)  $default,) {final _that = this;
switch (_that) {
case _CompanySponsorDetail():
return $default(_that.id,_that.name,_that.logoName,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String logoName,  String slug,  String prText,  String websiteUrl,  CompanySponsorType sponsorType,  BasicPlanType? basicPlanType,  List<OptionPlanType> optionPlanTypes)?  $default,) {final _that = this;
switch (_that) {
case _CompanySponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.logoName,_that.slug,_that.prText,_that.websiteUrl,_that.sponsorType,_that.basicPlanType,_that.optionPlanTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanySponsorDetail implements CompanySponsorDetail {
  const _CompanySponsorDetail({required this.id, required this.name, required this.logoName, required this.slug, required this.prText, required this.websiteUrl, required this.sponsorType, this.basicPlanType, final  List<OptionPlanType> optionPlanTypes = const []}): _optionPlanTypes = optionPlanTypes;
  factory _CompanySponsorDetail.fromJson(Map<String, dynamic> json) => _$CompanySponsorDetailFromJson(json);

@override final  int id;
@override final  String name;
@override final  String logoName;
@override final  String slug;
@override final  String prText;
@override final  String websiteUrl;
@override final  CompanySponsorType sponsorType;
@override final  BasicPlanType? basicPlanType;
 final  List<OptionPlanType> _optionPlanTypes;
@override@JsonKey() List<OptionPlanType> get optionPlanTypes {
  if (_optionPlanTypes is EqualUnmodifiableListView) return _optionPlanTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionPlanTypes);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanySponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.prText, prText) || other.prText == prText)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.sponsorType, sponsorType) || other.sponsorType == sponsorType)&&(identical(other.basicPlanType, basicPlanType) || other.basicPlanType == basicPlanType)&&const DeepCollectionEquality().equals(other._optionPlanTypes, _optionPlanTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoName,slug,prText,websiteUrl,sponsorType,basicPlanType,const DeepCollectionEquality().hash(_optionPlanTypes));

@override
String toString() {
  return 'CompanySponsorDetail(id: $id, name: $name, logoName: $logoName, slug: $slug, prText: $prText, websiteUrl: $websiteUrl, sponsorType: $sponsorType, basicPlanType: $basicPlanType, optionPlanTypes: $optionPlanTypes)';
}


}

/// @nodoc
abstract mixin class _$CompanySponsorDetailCopyWith<$Res> implements $CompanySponsorDetailCopyWith<$Res> {
  factory _$CompanySponsorDetailCopyWith(_CompanySponsorDetail value, $Res Function(_CompanySponsorDetail) _then) = __$CompanySponsorDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String logoName, String slug, String prText, String websiteUrl, CompanySponsorType sponsorType, BasicPlanType? basicPlanType, List<OptionPlanType> optionPlanTypes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoName = null,Object? slug = null,Object? prText = null,Object? websiteUrl = null,Object? sponsorType = null,Object? basicPlanType = freezed,Object? optionPlanTypes = null,}) {
  return _then(_CompanySponsorDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,prText: null == prText ? _self.prText : prText // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,sponsorType: null == sponsorType ? _self.sponsorType : sponsorType // ignore: cast_nullable_to_non_nullable
as CompanySponsorType,basicPlanType: freezed == basicPlanType ? _self.basicPlanType : basicPlanType // ignore: cast_nullable_to_non_nullable
as BasicPlanType?,optionPlanTypes: null == optionPlanTypes ? _self._optionPlanTypes : optionPlanTypes // ignore: cast_nullable_to_non_nullable
as List<OptionPlanType>,
  ));
}


}


/// @nodoc
mixin _$IndividualSponsorDetail {

 int get id; String get name; String get slug; String get logoName; String? get enthusiasm; String? get xAccount;
/// Create a copy of IndividualSponsorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualSponsorDetailCopyWith<IndividualSponsorDetail> get copyWith => _$IndividualSponsorDetailCopyWithImpl<IndividualSponsorDetail>(this as IndividualSponsorDetail, _$identity);

  /// Serializes this IndividualSponsorDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualSponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.enthusiasm, enthusiasm) || other.enthusiasm == enthusiasm)&&(identical(other.xAccount, xAccount) || other.xAccount == xAccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoName,enthusiasm,xAccount);

@override
String toString() {
  return 'IndividualSponsorDetail(id: $id, name: $name, slug: $slug, logoName: $logoName, enthusiasm: $enthusiasm, xAccount: $xAccount)';
}


}

/// @nodoc
abstract mixin class $IndividualSponsorDetailCopyWith<$Res>  {
  factory $IndividualSponsorDetailCopyWith(IndividualSponsorDetail value, $Res Function(IndividualSponsorDetail) _then) = _$IndividualSponsorDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String logoName, String? enthusiasm, String? xAccount
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoName = null,Object? enthusiasm = freezed,Object? xAccount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,enthusiasm: freezed == enthusiasm ? _self.enthusiasm : enthusiasm // ignore: cast_nullable_to_non_nullable
as String?,xAccount: freezed == xAccount ? _self.xAccount : xAccount // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String logoName,  String? enthusiasm,  String? xAccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoName,_that.enthusiasm,_that.xAccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String logoName,  String? enthusiasm,  String? xAccount)  $default,) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail():
return $default(_that.id,_that.name,_that.slug,_that.logoName,_that.enthusiasm,_that.xAccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String logoName,  String? enthusiasm,  String? xAccount)?  $default,) {final _that = this;
switch (_that) {
case _IndividualSponsorDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.logoName,_that.enthusiasm,_that.xAccount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualSponsorDetail implements IndividualSponsorDetail {
  const _IndividualSponsorDetail({required this.id, required this.name, required this.slug, required this.logoName, this.enthusiasm, this.xAccount});
  factory _IndividualSponsorDetail.fromJson(Map<String, dynamic> json) => _$IndividualSponsorDetailFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String logoName;
@override final  String? enthusiasm;
@override final  String? xAccount;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualSponsorDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.logoName, logoName) || other.logoName == logoName)&&(identical(other.enthusiasm, enthusiasm) || other.enthusiasm == enthusiasm)&&(identical(other.xAccount, xAccount) || other.xAccount == xAccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,logoName,enthusiasm,xAccount);

@override
String toString() {
  return 'IndividualSponsorDetail(id: $id, name: $name, slug: $slug, logoName: $logoName, enthusiasm: $enthusiasm, xAccount: $xAccount)';
}


}

/// @nodoc
abstract mixin class _$IndividualSponsorDetailCopyWith<$Res> implements $IndividualSponsorDetailCopyWith<$Res> {
  factory _$IndividualSponsorDetailCopyWith(_IndividualSponsorDetail value, $Res Function(_IndividualSponsorDetail) _then) = __$IndividualSponsorDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String logoName, String? enthusiasm, String? xAccount
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? logoName = null,Object? enthusiasm = freezed,Object? xAccount = freezed,}) {
  return _then(_IndividualSponsorDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,logoName: null == logoName ? _self.logoName : logoName // ignore: cast_nullable_to_non_nullable
as String,enthusiasm: freezed == enthusiasm ? _self.enthusiasm : enthusiasm // ignore: cast_nullable_to_non_nullable
as String?,xAccount: freezed == xAccount ? _self.xAccount : xAccount // ignore: cast_nullable_to_non_nullable
as String?,
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
