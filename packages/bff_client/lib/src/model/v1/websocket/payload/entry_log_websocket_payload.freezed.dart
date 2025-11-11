// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_log_websocket_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
EntryLogWebsocketPayload _$EntryLogWebsocketPayloadFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'ADD':
          return EntryLogAddWebsocketPayload.fromJson(
            json
          );
                case 'DELETE':
          return EntryLogDeleteWebsocketPayload.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'EntryLogWebsocketPayload',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$EntryLogWebsocketPayload {

 String get ticketPurchaseId;
/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryLogWebsocketPayloadCopyWith<EntryLogWebsocketPayload> get copyWith => _$EntryLogWebsocketPayloadCopyWithImpl<EntryLogWebsocketPayload>(this as EntryLogWebsocketPayload, _$identity);

  /// Serializes this EntryLogWebsocketPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryLogWebsocketPayload&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId);

@override
String toString() {
  return 'EntryLogWebsocketPayload(ticketPurchaseId: $ticketPurchaseId)';
}


}

/// @nodoc
abstract mixin class $EntryLogWebsocketPayloadCopyWith<$Res>  {
  factory $EntryLogWebsocketPayloadCopyWith(EntryLogWebsocketPayload value, $Res Function(EntryLogWebsocketPayload) _then) = _$EntryLogWebsocketPayloadCopyWithImpl;
@useResult
$Res call({
 String ticketPurchaseId
});




}
/// @nodoc
class _$EntryLogWebsocketPayloadCopyWithImpl<$Res>
    implements $EntryLogWebsocketPayloadCopyWith<$Res> {
  _$EntryLogWebsocketPayloadCopyWithImpl(this._self, this._then);

  final EntryLogWebsocketPayload _self;
  final $Res Function(EntryLogWebsocketPayload) _then;

/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketPurchaseId = null,}) {
  return _then(_self.copyWith(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EntryLogWebsocketPayload].
extension EntryLogWebsocketPayloadPatterns on EntryLogWebsocketPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EntryLogAddWebsocketPayload value)?  add,TResult Function( EntryLogDeleteWebsocketPayload value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload() when add != null:
return add(_that);case EntryLogDeleteWebsocketPayload() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EntryLogAddWebsocketPayload value)  add,required TResult Function( EntryLogDeleteWebsocketPayload value)  delete,}){
final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload():
return add(_that);case EntryLogDeleteWebsocketPayload():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EntryLogAddWebsocketPayload value)?  add,TResult? Function( EntryLogDeleteWebsocketPayload value)?  delete,}){
final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload() when add != null:
return add(_that);case EntryLogDeleteWebsocketPayload() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String ticketPurchaseId,  DateTime createdAt)?  add,TResult Function( String ticketPurchaseId)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload() when add != null:
return add(_that.ticketPurchaseId,_that.createdAt);case EntryLogDeleteWebsocketPayload() when delete != null:
return delete(_that.ticketPurchaseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String ticketPurchaseId,  DateTime createdAt)  add,required TResult Function( String ticketPurchaseId)  delete,}) {final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload():
return add(_that.ticketPurchaseId,_that.createdAt);case EntryLogDeleteWebsocketPayload():
return delete(_that.ticketPurchaseId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String ticketPurchaseId,  DateTime createdAt)?  add,TResult? Function( String ticketPurchaseId)?  delete,}) {final _that = this;
switch (_that) {
case EntryLogAddWebsocketPayload() when add != null:
return add(_that.ticketPurchaseId,_that.createdAt);case EntryLogDeleteWebsocketPayload() when delete != null:
return delete(_that.ticketPurchaseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class EntryLogAddWebsocketPayload implements EntryLogWebsocketPayload {
  const EntryLogAddWebsocketPayload({required this.ticketPurchaseId, required this.createdAt, final  String? $type}): $type = $type ?? 'ADD';
  factory EntryLogAddWebsocketPayload.fromJson(Map<String, dynamic> json) => _$EntryLogAddWebsocketPayloadFromJson(json);

@override final  String ticketPurchaseId;
 final  DateTime createdAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryLogAddWebsocketPayloadCopyWith<EntryLogAddWebsocketPayload> get copyWith => _$EntryLogAddWebsocketPayloadCopyWithImpl<EntryLogAddWebsocketPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryLogAddWebsocketPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryLogAddWebsocketPayload&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId,createdAt);

@override
String toString() {
  return 'EntryLogWebsocketPayload.add(ticketPurchaseId: $ticketPurchaseId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EntryLogAddWebsocketPayloadCopyWith<$Res> implements $EntryLogWebsocketPayloadCopyWith<$Res> {
  factory $EntryLogAddWebsocketPayloadCopyWith(EntryLogAddWebsocketPayload value, $Res Function(EntryLogAddWebsocketPayload) _then) = _$EntryLogAddWebsocketPayloadCopyWithImpl;
@override @useResult
$Res call({
 String ticketPurchaseId, DateTime createdAt
});




}
/// @nodoc
class _$EntryLogAddWebsocketPayloadCopyWithImpl<$Res>
    implements $EntryLogAddWebsocketPayloadCopyWith<$Res> {
  _$EntryLogAddWebsocketPayloadCopyWithImpl(this._self, this._then);

  final EntryLogAddWebsocketPayload _self;
  final $Res Function(EntryLogAddWebsocketPayload) _then;

/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketPurchaseId = null,Object? createdAt = null,}) {
  return _then(EntryLogAddWebsocketPayload(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class EntryLogDeleteWebsocketPayload implements EntryLogWebsocketPayload {
  const EntryLogDeleteWebsocketPayload({required this.ticketPurchaseId, final  String? $type}): $type = $type ?? 'DELETE';
  factory EntryLogDeleteWebsocketPayload.fromJson(Map<String, dynamic> json) => _$EntryLogDeleteWebsocketPayloadFromJson(json);

@override final  String ticketPurchaseId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryLogDeleteWebsocketPayloadCopyWith<EntryLogDeleteWebsocketPayload> get copyWith => _$EntryLogDeleteWebsocketPayloadCopyWithImpl<EntryLogDeleteWebsocketPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryLogDeleteWebsocketPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryLogDeleteWebsocketPayload&&(identical(other.ticketPurchaseId, ticketPurchaseId) || other.ticketPurchaseId == ticketPurchaseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketPurchaseId);

@override
String toString() {
  return 'EntryLogWebsocketPayload.delete(ticketPurchaseId: $ticketPurchaseId)';
}


}

/// @nodoc
abstract mixin class $EntryLogDeleteWebsocketPayloadCopyWith<$Res> implements $EntryLogWebsocketPayloadCopyWith<$Res> {
  factory $EntryLogDeleteWebsocketPayloadCopyWith(EntryLogDeleteWebsocketPayload value, $Res Function(EntryLogDeleteWebsocketPayload) _then) = _$EntryLogDeleteWebsocketPayloadCopyWithImpl;
@override @useResult
$Res call({
 String ticketPurchaseId
});




}
/// @nodoc
class _$EntryLogDeleteWebsocketPayloadCopyWithImpl<$Res>
    implements $EntryLogDeleteWebsocketPayloadCopyWith<$Res> {
  _$EntryLogDeleteWebsocketPayloadCopyWithImpl(this._self, this._then);

  final EntryLogDeleteWebsocketPayload _self;
  final $Res Function(EntryLogDeleteWebsocketPayload) _then;

/// Create a copy of EntryLogWebsocketPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketPurchaseId = null,}) {
  return _then(EntryLogDeleteWebsocketPayload(
ticketPurchaseId: null == ticketPurchaseId ? _self.ticketPurchaseId : ticketPurchaseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
