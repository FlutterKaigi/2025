import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout_sessions.freezed.dart';
part 'ticket_checkout_sessions.g.dart';

enum TicketCheckoutStatus {
  pending,
  completed,
  expired,
  cancelled,
}

@freezed
abstract class TicketCheckoutSessions with _$TicketCheckoutSessions {
  const factory TicketCheckoutSessions({
    required String id,
    required String userId,
    required String ticketTypeId,
    required TicketCheckoutStatus status,
    String? stripePaymentIntentId,
    String? stripeCheckoutSessionId,
    required int totalAmount,
    @RequiredDateTimeConverter() required DateTime expiresAt,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _TicketCheckoutSessions;

  factory TicketCheckoutSessions.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutSessionsFromJson(json);
}

@freezed
abstract class TicketCheckoutOptions with _$TicketCheckoutOptions {
  const factory TicketCheckoutOptions({
    required String id,
    required String checkoutSessionId,
    required String ticketOptionId,
    String? optionValue,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _TicketCheckoutOptions;

  factory TicketCheckoutOptions.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutOptionsFromJson(json);
}
