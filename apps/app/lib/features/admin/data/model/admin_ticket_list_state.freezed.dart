// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_ticket_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminTicketListState {

 List<TicketItemWithUser> get tickets; bool get hasMore;
/// Create a copy of AdminTicketListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminTicketListStateCopyWith<AdminTicketListState> get copyWith => _$AdminTicketListStateCopyWithImpl<AdminTicketListState>(this as AdminTicketListState, _$identity);

  /// Serializes this AdminTicketListState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminTicketListState&&const DeepCollectionEquality().equals(other.tickets, tickets)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets),hasMore);

@override
String toString() {
  return 'AdminTicketListState(tickets: $tickets, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $AdminTicketListStateCopyWith<$Res>  {
  factory $AdminTicketListStateCopyWith(AdminTicketListState value, $Res Function(AdminTicketListState) _then) = _$AdminTicketListStateCopyWithImpl;
@useResult
$Res call({
 List<TicketItemWithUser> tickets, bool hasMore
});




}
/// @nodoc
class _$AdminTicketListStateCopyWithImpl<$Res>
    implements $AdminTicketListStateCopyWith<$Res> {
  _$AdminTicketListStateCopyWithImpl(this._self, this._then);

  final AdminTicketListState _self;
  final $Res Function(AdminTicketListState) _then;

/// Create a copy of AdminTicketListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItemWithUser>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminTicketListState].
extension AdminTicketListStatePatterns on AdminTicketListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminTicketListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminTicketListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminTicketListState value)  $default,){
final _that = this;
switch (_that) {
case _AdminTicketListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminTicketListState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminTicketListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketItemWithUser> tickets,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminTicketListState() when $default != null:
return $default(_that.tickets,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketItemWithUser> tickets,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _AdminTicketListState():
return $default(_that.tickets,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketItemWithUser> tickets,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _AdminTicketListState() when $default != null:
return $default(_that.tickets,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminTicketListState implements AdminTicketListState {
  const _AdminTicketListState({required final  List<TicketItemWithUser> tickets, required this.hasMore}): _tickets = tickets;
  factory _AdminTicketListState.fromJson(Map<String, dynamic> json) => _$AdminTicketListStateFromJson(json);

 final  List<TicketItemWithUser> _tickets;
@override List<TicketItemWithUser> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

@override final  bool hasMore;

/// Create a copy of AdminTicketListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminTicketListStateCopyWith<_AdminTicketListState> get copyWith => __$AdminTicketListStateCopyWithImpl<_AdminTicketListState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminTicketListStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminTicketListState&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets),hasMore);

@override
String toString() {
  return 'AdminTicketListState(tickets: $tickets, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$AdminTicketListStateCopyWith<$Res> implements $AdminTicketListStateCopyWith<$Res> {
  factory _$AdminTicketListStateCopyWith(_AdminTicketListState value, $Res Function(_AdminTicketListState) _then) = __$AdminTicketListStateCopyWithImpl;
@override @useResult
$Res call({
 List<TicketItemWithUser> tickets, bool hasMore
});




}
/// @nodoc
class __$AdminTicketListStateCopyWithImpl<$Res>
    implements _$AdminTicketListStateCopyWith<$Res> {
  __$AdminTicketListStateCopyWithImpl(this._self, this._then);

  final _AdminTicketListState _self;
  final $Res Function(_AdminTicketListState) _then;

/// Create a copy of AdminTicketListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,Object? hasMore = null,}) {
  return _then(_AdminTicketListState(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItemWithUser>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
