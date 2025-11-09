// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchase_with_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketPurchaseWithDetails {

 TicketPurchases? get purchase; TicketCheckoutSessions? get checkoutSession; String get ticketTypeId; List<TicketOptions> get options; EntryLogs? get entryLog;
/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseWithDetailsCopyWith<TicketPurchaseWithDetails> get copyWith => _$TicketPurchaseWithDetailsCopyWithImpl<TicketPurchaseWithDetails>(this as TicketPurchaseWithDetails, _$identity);

  /// Serializes this TicketPurchaseWithDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseWithDetails&&(identical(other.purchase, purchase) || other.purchase == purchase)&&(identical(other.checkoutSession, checkoutSession) || other.checkoutSession == checkoutSession)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purchase,checkoutSession,ticketTypeId,const DeepCollectionEquality().hash(options),entryLog);

@override
String toString() {
  return 'TicketPurchaseWithDetails(purchase: $purchase, checkoutSession: $checkoutSession, ticketTypeId: $ticketTypeId, options: $options, entryLog: $entryLog)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseWithDetailsCopyWith<$Res>  {
  factory $TicketPurchaseWithDetailsCopyWith(TicketPurchaseWithDetails value, $Res Function(TicketPurchaseWithDetails) _then) = _$TicketPurchaseWithDetailsCopyWithImpl;
@useResult
$Res call({
 TicketPurchases? purchase, TicketCheckoutSessions? checkoutSession, String ticketTypeId, List<TicketOptions> options, EntryLogs? entryLog
});


$TicketPurchasesCopyWith<$Res>? get purchase;$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession;$EntryLogsCopyWith<$Res>? get entryLog;

}
/// @nodoc
class _$TicketPurchaseWithDetailsCopyWithImpl<$Res>
    implements $TicketPurchaseWithDetailsCopyWith<$Res> {
  _$TicketPurchaseWithDetailsCopyWithImpl(this._self, this._then);

  final TicketPurchaseWithDetails _self;
  final $Res Function(TicketPurchaseWithDetails) _then;

/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchase = freezed,Object? checkoutSession = freezed,Object? ticketTypeId = null,Object? options = null,Object? entryLog = freezed,}) {
  return _then(_self.copyWith(
purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchases?,checkoutSession: freezed == checkoutSession ? _self.checkoutSession : checkoutSession // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions?,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,entryLog: freezed == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLogs?,
  ));
}
/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchasesCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $TicketPurchasesCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession {
    if (_self.checkoutSession == null) {
    return null;
  }

  return $TicketCheckoutSessionsCopyWith<$Res>(_self.checkoutSession!, (value) {
    return _then(_self.copyWith(checkoutSession: value));
  });
}/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogsCopyWith<$Res>? get entryLog {
    if (_self.entryLog == null) {
    return null;
  }

  return $EntryLogsCopyWith<$Res>(_self.entryLog!, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketPurchaseWithDetails].
extension TicketPurchaseWithDetailsPatterns on TicketPurchaseWithDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchaseWithDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchaseWithDetails value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchaseWithDetails value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails() when $default != null:
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails():
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TicketPurchases? purchase,  TicketCheckoutSessions? checkoutSession,  String ticketTypeId,  List<TicketOptions> options,  EntryLogs? entryLog)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseWithDetails() when $default != null:
return $default(_that.purchase,_that.checkoutSession,_that.ticketTypeId,_that.options,_that.entryLog);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketPurchaseWithDetails implements TicketPurchaseWithDetails {
  const _TicketPurchaseWithDetails({this.purchase, this.checkoutSession, required this.ticketTypeId, required final  List<TicketOptions> options, this.entryLog}): _options = options;
  factory _TicketPurchaseWithDetails.fromJson(Map<String, dynamic> json) => _$TicketPurchaseWithDetailsFromJson(json);

@override final  TicketPurchases? purchase;
@override final  TicketCheckoutSessions? checkoutSession;
@override final  String ticketTypeId;
 final  List<TicketOptions> _options;
@override List<TicketOptions> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  EntryLogs? entryLog;

/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchaseWithDetailsCopyWith<_TicketPurchaseWithDetails> get copyWith => __$TicketPurchaseWithDetailsCopyWithImpl<_TicketPurchaseWithDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseWithDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchaseWithDetails&&(identical(other.purchase, purchase) || other.purchase == purchase)&&(identical(other.checkoutSession, checkoutSession) || other.checkoutSession == checkoutSession)&&(identical(other.ticketTypeId, ticketTypeId) || other.ticketTypeId == ticketTypeId)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.entryLog, entryLog) || other.entryLog == entryLog));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purchase,checkoutSession,ticketTypeId,const DeepCollectionEquality().hash(_options),entryLog);

@override
String toString() {
  return 'TicketPurchaseWithDetails(purchase: $purchase, checkoutSession: $checkoutSession, ticketTypeId: $ticketTypeId, options: $options, entryLog: $entryLog)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchaseWithDetailsCopyWith<$Res> implements $TicketPurchaseWithDetailsCopyWith<$Res> {
  factory _$TicketPurchaseWithDetailsCopyWith(_TicketPurchaseWithDetails value, $Res Function(_TicketPurchaseWithDetails) _then) = __$TicketPurchaseWithDetailsCopyWithImpl;
@override @useResult
$Res call({
 TicketPurchases? purchase, TicketCheckoutSessions? checkoutSession, String ticketTypeId, List<TicketOptions> options, EntryLogs? entryLog
});


@override $TicketPurchasesCopyWith<$Res>? get purchase;@override $TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession;@override $EntryLogsCopyWith<$Res>? get entryLog;

}
/// @nodoc
class __$TicketPurchaseWithDetailsCopyWithImpl<$Res>
    implements _$TicketPurchaseWithDetailsCopyWith<$Res> {
  __$TicketPurchaseWithDetailsCopyWithImpl(this._self, this._then);

  final _TicketPurchaseWithDetails _self;
  final $Res Function(_TicketPurchaseWithDetails) _then;

/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchase = freezed,Object? checkoutSession = freezed,Object? ticketTypeId = null,Object? options = null,Object? entryLog = freezed,}) {
  return _then(_TicketPurchaseWithDetails(
purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchases?,checkoutSession: freezed == checkoutSession ? _self.checkoutSession : checkoutSession // ignore: cast_nullable_to_non_nullable
as TicketCheckoutSessions?,ticketTypeId: null == ticketTypeId ? _self.ticketTypeId : ticketTypeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOptions>,entryLog: freezed == entryLog ? _self.entryLog : entryLog // ignore: cast_nullable_to_non_nullable
as EntryLogs?,
  ));
}

/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchasesCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $TicketPurchasesCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutSessionsCopyWith<$Res>? get checkoutSession {
    if (_self.checkoutSession == null) {
    return null;
  }

  return $TicketCheckoutSessionsCopyWith<$Res>(_self.checkoutSession!, (value) {
    return _then(_self.copyWith(checkoutSession: value));
  });
}/// Create a copy of TicketPurchaseWithDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntryLogsCopyWith<$Res>? get entryLog {
    if (_self.entryLog == null) {
    return null;
  }

  return $EntryLogsCopyWith<$Res>(_self.entryLog!, (value) {
    return _then(_self.copyWith(entryLog: value));
  });
}
}

// dart format on
