// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tickets_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTicketsResponse {

 List<TicketItem> get tickets;
/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTicketsResponseCopyWith<UserTicketsResponse> get copyWith => _$UserTicketsResponseCopyWithImpl<UserTicketsResponse>(this as UserTicketsResponse, _$identity);

  /// Serializes this UserTicketsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTicketsResponse&&const DeepCollectionEquality().equals(other.tickets, tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets));

@override
String toString() {
  return 'UserTicketsResponse(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class $UserTicketsResponseCopyWith<$Res>  {
  factory $UserTicketsResponseCopyWith(UserTicketsResponse value, $Res Function(UserTicketsResponse) _then) = _$UserTicketsResponseCopyWithImpl;
@useResult
$Res call({
 List<TicketItem> tickets
});




}
/// @nodoc
class _$UserTicketsResponseCopyWithImpl<$Res>
    implements $UserTicketsResponseCopyWith<$Res> {
  _$UserTicketsResponseCopyWithImpl(this._self, this._then);

  final UserTicketsResponse _self;
  final $Res Function(UserTicketsResponse) _then;

/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTicketsResponse].
extension UserTicketsResponsePatterns on UserTicketsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTicketsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTicketsResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserTicketsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTicketsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketItem> tickets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
return $default(_that.tickets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketItem> tickets)  $default,) {final _that = this;
switch (_that) {
case _UserTicketsResponse():
return $default(_that.tickets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketItem> tickets)?  $default,) {final _that = this;
switch (_that) {
case _UserTicketsResponse() when $default != null:
return $default(_that.tickets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTicketsResponse implements UserTicketsResponse {
  const _UserTicketsResponse({required final  List<TicketItem> tickets}): _tickets = tickets;
  factory _UserTicketsResponse.fromJson(Map<String, dynamic> json) => _$UserTicketsResponseFromJson(json);

 final  List<TicketItem> _tickets;
@override List<TicketItem> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}


/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTicketsResponseCopyWith<_UserTicketsResponse> get copyWith => __$UserTicketsResponseCopyWithImpl<_UserTicketsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTicketsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTicketsResponse&&const DeepCollectionEquality().equals(other._tickets, _tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets));

@override
String toString() {
  return 'UserTicketsResponse(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class _$UserTicketsResponseCopyWith<$Res> implements $UserTicketsResponseCopyWith<$Res> {
  factory _$UserTicketsResponseCopyWith(_UserTicketsResponse value, $Res Function(_UserTicketsResponse) _then) = __$UserTicketsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TicketItem> tickets
});




}
/// @nodoc
class __$UserTicketsResponseCopyWithImpl<$Res>
    implements _$UserTicketsResponseCopyWith<$Res> {
  __$UserTicketsResponseCopyWithImpl(this._self, this._then);

  final _UserTicketsResponse _self;
  final $Res Function(_UserTicketsResponse) _then;

/// Create a copy of UserTicketsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,}) {
  return _then(_UserTicketsResponse(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItem>,
  ));
}


}

TicketItem _$TicketItemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'purchase':
          return TicketPurchaseItem.fromJson(
            json
          );
                case 'checkout':
          return TicketCheckoutItem.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'TicketItem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$TicketItem {

 TicketType get ticketType; List<TicketOption> get options;
/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketItemCopyWith<TicketItem> get copyWith => _$TicketItemCopyWithImpl<TicketItem>(this as TicketItem, _$identity);

  /// Serializes this TicketItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketItem&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TicketItem(ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketItemCopyWith<$Res>  {
  factory $TicketItemCopyWith(TicketItem value, $Res Function(TicketItem) _then) = _$TicketItemCopyWithImpl;
@useResult
$Res call({
 TicketType ticketType, List<TicketOption> options
});


$TicketTypeCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketItemCopyWithImpl<$Res>
    implements $TicketItemCopyWith<$Res> {
  _$TicketItemCopyWithImpl(this._self, this._then);

  final TicketItem _self;
  final $Res Function(TicketItem) _then;

/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? options = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,
  ));
}
/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketItem].
extension TicketItemPatterns on TicketItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TicketPurchaseItem value)?  purchase,TResult Function( TicketCheckoutItem value)?  checkout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TicketPurchaseItem() when purchase != null:
return purchase(_that);case TicketCheckoutItem() when checkout != null:
return checkout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TicketPurchaseItem value)  purchase,required TResult Function( TicketCheckoutItem value)  checkout,}){
final _that = this;
switch (_that) {
case TicketPurchaseItem():
return purchase(_that);case TicketCheckoutItem():
return checkout(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TicketPurchaseItem value)?  purchase,TResult? Function( TicketCheckoutItem value)?  checkout,}){
final _that = this;
switch (_that) {
case TicketPurchaseItem() when purchase != null:
return purchase(_that);case TicketCheckoutItem() when checkout != null:
return checkout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TicketPurchase purchase,  TicketType ticketType,  List<TicketOption> options)?  purchase,TResult Function( TicketCheckout checkout,  TicketType ticketType,  List<TicketOption> options)?  checkout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TicketPurchaseItem() when purchase != null:
return purchase(_that.purchase,_that.ticketType,_that.options);case TicketCheckoutItem() when checkout != null:
return checkout(_that.checkout,_that.ticketType,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TicketPurchase purchase,  TicketType ticketType,  List<TicketOption> options)  purchase,required TResult Function( TicketCheckout checkout,  TicketType ticketType,  List<TicketOption> options)  checkout,}) {final _that = this;
switch (_that) {
case TicketPurchaseItem():
return purchase(_that.purchase,_that.ticketType,_that.options);case TicketCheckoutItem():
return checkout(_that.checkout,_that.ticketType,_that.options);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TicketPurchase purchase,  TicketType ticketType,  List<TicketOption> options)?  purchase,TResult? Function( TicketCheckout checkout,  TicketType ticketType,  List<TicketOption> options)?  checkout,}) {final _that = this;
switch (_that) {
case TicketPurchaseItem() when purchase != null:
return purchase(_that.purchase,_that.ticketType,_that.options);case TicketCheckoutItem() when checkout != null:
return checkout(_that.checkout,_that.ticketType,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TicketPurchaseItem implements TicketItem {
  const TicketPurchaseItem({required this.purchase, required this.ticketType, required final  List<TicketOption> options, final  String? $type}): _options = options,$type = $type ?? 'purchase';
  factory TicketPurchaseItem.fromJson(Map<String, dynamic> json) => _$TicketPurchaseItemFromJson(json);

 final  TicketPurchase purchase;
@override final  TicketType ticketType;
 final  List<TicketOption> _options;
@override List<TicketOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseItemCopyWith<TicketPurchaseItem> get copyWith => _$TicketPurchaseItemCopyWithImpl<TicketPurchaseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseItem&&(identical(other.purchase, purchase) || other.purchase == purchase)&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,purchase,ticketType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketItem.purchase(purchase: $purchase, ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseItemCopyWith<$Res> implements $TicketItemCopyWith<$Res> {
  factory $TicketPurchaseItemCopyWith(TicketPurchaseItem value, $Res Function(TicketPurchaseItem) _then) = _$TicketPurchaseItemCopyWithImpl;
@override @useResult
$Res call({
 TicketPurchase purchase, TicketType ticketType, List<TicketOption> options
});


$TicketPurchaseCopyWith<$Res> get purchase;@override $TicketTypeCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketPurchaseItemCopyWithImpl<$Res>
    implements $TicketPurchaseItemCopyWith<$Res> {
  _$TicketPurchaseItemCopyWithImpl(this._self, this._then);

  final TicketPurchaseItem _self;
  final $Res Function(TicketPurchaseItem) _then;

/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchase = null,Object? ticketType = null,Object? options = null,}) {
  return _then(TicketPurchaseItem(
purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchase,ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,
  ));
}

/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchaseCopyWith<$Res> get purchase {
  
  return $TicketPurchaseCopyWith<$Res>(_self.purchase, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TicketCheckoutItem implements TicketItem {
  const TicketCheckoutItem({required this.checkout, required this.ticketType, required final  List<TicketOption> options, final  String? $type}): _options = options,$type = $type ?? 'checkout';
  factory TicketCheckoutItem.fromJson(Map<String, dynamic> json) => _$TicketCheckoutItemFromJson(json);

 final  TicketCheckout checkout;
@override final  TicketType ticketType;
 final  List<TicketOption> _options;
@override List<TicketOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutItemCopyWith<TicketCheckoutItem> get copyWith => _$TicketCheckoutItemCopyWithImpl<TicketCheckoutItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutItem&&(identical(other.checkout, checkout) || other.checkout == checkout)&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkout,ticketType,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TicketItem.checkout(checkout: $checkout, ticketType: $ticketType, options: $options)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutItemCopyWith<$Res> implements $TicketItemCopyWith<$Res> {
  factory $TicketCheckoutItemCopyWith(TicketCheckoutItem value, $Res Function(TicketCheckoutItem) _then) = _$TicketCheckoutItemCopyWithImpl;
@override @useResult
$Res call({
 TicketCheckout checkout, TicketType ticketType, List<TicketOption> options
});


$TicketCheckoutCopyWith<$Res> get checkout;@override $TicketTypeCopyWith<$Res> get ticketType;

}
/// @nodoc
class _$TicketCheckoutItemCopyWithImpl<$Res>
    implements $TicketCheckoutItemCopyWith<$Res> {
  _$TicketCheckoutItemCopyWithImpl(this._self, this._then);

  final TicketCheckoutItem _self;
  final $Res Function(TicketCheckoutItem) _then;

/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkout = null,Object? ticketType = null,Object? options = null,}) {
  return _then(TicketCheckoutItem(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as TicketCheckout,ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,
  ));
}

/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutCopyWith<$Res> get checkout {
  
  return $TicketCheckoutCopyWith<$Res>(_self.checkout, (value) {
    return _then(_self.copyWith(checkout: value));
  });
}/// Create a copy of TicketItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}
}

// dart format on
