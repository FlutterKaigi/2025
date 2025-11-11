// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tickets_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketsListResponse {

 List<TicketItemWithUser> get tickets;
/// Create a copy of TicketsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketsListResponseCopyWith<TicketsListResponse> get copyWith => _$TicketsListResponseCopyWithImpl<TicketsListResponse>(this as TicketsListResponse, _$identity);

  /// Serializes this TicketsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketsListResponse&&const DeepCollectionEquality().equals(other.tickets, tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets));

@override
String toString() {
  return 'TicketsListResponse(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class $TicketsListResponseCopyWith<$Res>  {
  factory $TicketsListResponseCopyWith(TicketsListResponse value, $Res Function(TicketsListResponse) _then) = _$TicketsListResponseCopyWithImpl;
@useResult
$Res call({
 List<TicketItemWithUser> tickets
});




}
/// @nodoc
class _$TicketsListResponseCopyWithImpl<$Res>
    implements $TicketsListResponseCopyWith<$Res> {
  _$TicketsListResponseCopyWithImpl(this._self, this._then);

  final TicketsListResponse _self;
  final $Res Function(TicketsListResponse) _then;

/// Create a copy of TicketsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItemWithUser>,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketsListResponse].
extension TicketsListResponsePatterns on TicketsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TicketsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TicketsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TicketItemWithUser> tickets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketsListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TicketItemWithUser> tickets)  $default,) {final _that = this;
switch (_that) {
case _TicketsListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TicketItemWithUser> tickets)?  $default,) {final _that = this;
switch (_that) {
case _TicketsListResponse() when $default != null:
return $default(_that.tickets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketsListResponse implements TicketsListResponse {
  const _TicketsListResponse({required final  List<TicketItemWithUser> tickets}): _tickets = tickets;
  factory _TicketsListResponse.fromJson(Map<String, dynamic> json) => _$TicketsListResponseFromJson(json);

 final  List<TicketItemWithUser> _tickets;
@override List<TicketItemWithUser> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}


/// Create a copy of TicketsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketsListResponseCopyWith<_TicketsListResponse> get copyWith => __$TicketsListResponseCopyWithImpl<_TicketsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketsListResponse&&const DeepCollectionEquality().equals(other._tickets, _tickets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets));

@override
String toString() {
  return 'TicketsListResponse(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class _$TicketsListResponseCopyWith<$Res> implements $TicketsListResponseCopyWith<$Res> {
  factory _$TicketsListResponseCopyWith(_TicketsListResponse value, $Res Function(_TicketsListResponse) _then) = __$TicketsListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TicketItemWithUser> tickets
});




}
/// @nodoc
class __$TicketsListResponseCopyWithImpl<$Res>
    implements _$TicketsListResponseCopyWith<$Res> {
  __$TicketsListResponseCopyWithImpl(this._self, this._then);

  final _TicketsListResponse _self;
  final $Res Function(_TicketsListResponse) _then;

/// Create a copy of TicketsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,}) {
  return _then(_TicketsListResponse(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketItemWithUser>,
  ));
}


}

TicketItemWithUser _$TicketItemWithUserFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'purchase':
          return TicketPurchaseItemWithUser.fromJson(
            json
          );
                case 'checkout':
          return TicketCheckoutItemWithUser.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'TicketItemWithUser',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$TicketItemWithUser {

 TicketType get ticketType; List<TicketOption> get options; UserAndUserRoles get user;
/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketItemWithUserCopyWith<TicketItemWithUser> get copyWith => _$TicketItemWithUserCopyWithImpl<TicketItemWithUser>(this as TicketItemWithUser, _$identity);

  /// Serializes this TicketItemWithUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketItemWithUser&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,const DeepCollectionEquality().hash(options),user);

@override
String toString() {
  return 'TicketItemWithUser(ticketType: $ticketType, options: $options, user: $user)';
}


}

/// @nodoc
abstract mixin class $TicketItemWithUserCopyWith<$Res>  {
  factory $TicketItemWithUserCopyWith(TicketItemWithUser value, $Res Function(TicketItemWithUser) _then) = _$TicketItemWithUserCopyWithImpl;
@useResult
$Res call({
 TicketType ticketType, List<TicketOption> options, UserAndUserRoles user
});


$TicketTypeCopyWith<$Res> get ticketType;$UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class _$TicketItemWithUserCopyWithImpl<$Res>
    implements $TicketItemWithUserCopyWith<$Res> {
  _$TicketItemWithUserCopyWithImpl(this._self, this._then);

  final TicketItemWithUser _self;
  final $Res Function(TicketItemWithUser) _then;

/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketType = null,Object? options = null,Object? user = null,}) {
  return _then(_self.copyWith(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,
  ));
}
/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketItemWithUser].
extension TicketItemWithUserPatterns on TicketItemWithUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TicketPurchaseItemWithUser value)?  purchase,TResult Function( TicketCheckoutItemWithUser value)?  checkout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser() when purchase != null:
return purchase(_that);case TicketCheckoutItemWithUser() when checkout != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TicketPurchaseItemWithUser value)  purchase,required TResult Function( TicketCheckoutItemWithUser value)  checkout,}){
final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser():
return purchase(_that);case TicketCheckoutItemWithUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TicketPurchaseItemWithUser value)?  purchase,TResult? Function( TicketCheckoutItemWithUser value)?  checkout,}){
final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser() when purchase != null:
return purchase(_that);case TicketCheckoutItemWithUser() when checkout != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TicketType ticketType,  TicketPurchase purchase,  List<TicketOption> options,  UserAndUserRoles user)?  purchase,TResult Function( TicketType ticketType,  TicketCheckout checkout,  List<TicketOption> options,  UserAndUserRoles user)?  checkout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser() when purchase != null:
return purchase(_that.ticketType,_that.purchase,_that.options,_that.user);case TicketCheckoutItemWithUser() when checkout != null:
return checkout(_that.ticketType,_that.checkout,_that.options,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TicketType ticketType,  TicketPurchase purchase,  List<TicketOption> options,  UserAndUserRoles user)  purchase,required TResult Function( TicketType ticketType,  TicketCheckout checkout,  List<TicketOption> options,  UserAndUserRoles user)  checkout,}) {final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser():
return purchase(_that.ticketType,_that.purchase,_that.options,_that.user);case TicketCheckoutItemWithUser():
return checkout(_that.ticketType,_that.checkout,_that.options,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TicketType ticketType,  TicketPurchase purchase,  List<TicketOption> options,  UserAndUserRoles user)?  purchase,TResult? Function( TicketType ticketType,  TicketCheckout checkout,  List<TicketOption> options,  UserAndUserRoles user)?  checkout,}) {final _that = this;
switch (_that) {
case TicketPurchaseItemWithUser() when purchase != null:
return purchase(_that.ticketType,_that.purchase,_that.options,_that.user);case TicketCheckoutItemWithUser() when checkout != null:
return checkout(_that.ticketType,_that.checkout,_that.options,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TicketPurchaseItemWithUser implements TicketItemWithUser {
  const TicketPurchaseItemWithUser({required this.ticketType, required this.purchase, required final  List<TicketOption> options, required this.user, final  String? $type}): _options = options,$type = $type ?? 'purchase';
  factory TicketPurchaseItemWithUser.fromJson(Map<String, dynamic> json) => _$TicketPurchaseItemWithUserFromJson(json);

@override final  TicketType ticketType;
 final  TicketPurchase purchase;
 final  List<TicketOption> _options;
@override List<TicketOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  UserAndUserRoles user;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseItemWithUserCopyWith<TicketPurchaseItemWithUser> get copyWith => _$TicketPurchaseItemWithUserCopyWithImpl<TicketPurchaseItemWithUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketPurchaseItemWithUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseItemWithUser&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&(identical(other.purchase, purchase) || other.purchase == purchase)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,purchase,const DeepCollectionEquality().hash(_options),user);

@override
String toString() {
  return 'TicketItemWithUser.purchase(ticketType: $ticketType, purchase: $purchase, options: $options, user: $user)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseItemWithUserCopyWith<$Res> implements $TicketItemWithUserCopyWith<$Res> {
  factory $TicketPurchaseItemWithUserCopyWith(TicketPurchaseItemWithUser value, $Res Function(TicketPurchaseItemWithUser) _then) = _$TicketPurchaseItemWithUserCopyWithImpl;
@override @useResult
$Res call({
 TicketType ticketType, TicketPurchase purchase, List<TicketOption> options, UserAndUserRoles user
});


@override $TicketTypeCopyWith<$Res> get ticketType;$TicketPurchaseCopyWith<$Res> get purchase;@override $UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class _$TicketPurchaseItemWithUserCopyWithImpl<$Res>
    implements $TicketPurchaseItemWithUserCopyWith<$Res> {
  _$TicketPurchaseItemWithUserCopyWithImpl(this._self, this._then);

  final TicketPurchaseItemWithUser _self;
  final $Res Function(TicketPurchaseItemWithUser) _then;

/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? purchase = null,Object? options = null,Object? user = null,}) {
  return _then(TicketPurchaseItemWithUser(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as TicketPurchase,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,
  ));
}

/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketPurchaseCopyWith<$Res> get purchase {
  
  return $TicketPurchaseCopyWith<$Res>(_self.purchase, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TicketCheckoutItemWithUser implements TicketItemWithUser {
  const TicketCheckoutItemWithUser({required this.ticketType, required this.checkout, required final  List<TicketOption> options, required this.user, final  String? $type}): _options = options,$type = $type ?? 'checkout';
  factory TicketCheckoutItemWithUser.fromJson(Map<String, dynamic> json) => _$TicketCheckoutItemWithUserFromJson(json);

@override final  TicketType ticketType;
 final  TicketCheckout checkout;
 final  List<TicketOption> _options;
@override List<TicketOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  UserAndUserRoles user;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCheckoutItemWithUserCopyWith<TicketCheckoutItemWithUser> get copyWith => _$TicketCheckoutItemWithUserCopyWithImpl<TicketCheckoutItemWithUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketCheckoutItemWithUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketCheckoutItemWithUser&&(identical(other.ticketType, ticketType) || other.ticketType == ticketType)&&(identical(other.checkout, checkout) || other.checkout == checkout)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ticketType,checkout,const DeepCollectionEquality().hash(_options),user);

@override
String toString() {
  return 'TicketItemWithUser.checkout(ticketType: $ticketType, checkout: $checkout, options: $options, user: $user)';
}


}

/// @nodoc
abstract mixin class $TicketCheckoutItemWithUserCopyWith<$Res> implements $TicketItemWithUserCopyWith<$Res> {
  factory $TicketCheckoutItemWithUserCopyWith(TicketCheckoutItemWithUser value, $Res Function(TicketCheckoutItemWithUser) _then) = _$TicketCheckoutItemWithUserCopyWithImpl;
@override @useResult
$Res call({
 TicketType ticketType, TicketCheckout checkout, List<TicketOption> options, UserAndUserRoles user
});


@override $TicketTypeCopyWith<$Res> get ticketType;$TicketCheckoutCopyWith<$Res> get checkout;@override $UserAndUserRolesCopyWith<$Res> get user;

}
/// @nodoc
class _$TicketCheckoutItemWithUserCopyWithImpl<$Res>
    implements $TicketCheckoutItemWithUserCopyWith<$Res> {
  _$TicketCheckoutItemWithUserCopyWithImpl(this._self, this._then);

  final TicketCheckoutItemWithUser _self;
  final $Res Function(TicketCheckoutItemWithUser) _then;

/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketType = null,Object? checkout = null,Object? options = null,Object? user = null,}) {
  return _then(TicketCheckoutItemWithUser(
ticketType: null == ticketType ? _self.ticketType : ticketType // ignore: cast_nullable_to_non_nullable
as TicketType,checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as TicketCheckout,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TicketOption>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAndUserRoles,
  ));
}

/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketTypeCopyWith<$Res> get ticketType {
  
  return $TicketTypeCopyWith<$Res>(_self.ticketType, (value) {
    return _then(_self.copyWith(ticketType: value));
  });
}/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketCheckoutCopyWith<$Res> get checkout {
  
  return $TicketCheckoutCopyWith<$Res>(_self.checkout, (value) {
    return _then(_self.copyWith(checkout: value));
  });
}/// Create a copy of TicketItemWithUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAndUserRolesCopyWith<$Res> get user {
  
  return $UserAndUserRolesCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
