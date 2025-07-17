import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchases.freezed.dart';
part 'ticket_purchases.g.dart';

enum TicketPurchaseStatus {
  completed,
  refunded,
}

@freezed
abstract class TicketPurchases with _$TicketPurchases {
  const factory TicketPurchases({
    required String id,
    required String userId,
    required String ticketTypeId,
    required TicketPurchaseStatus status,
    String? stripePaymentIntentId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketPurchases;

  factory TicketPurchases.fromJson(Map<String, dynamic> json) =>
      _$TicketPurchasesFromJson(json);
}

@freezed
abstract class TicketPurchaseOptions with _$TicketPurchaseOptions {
  const factory TicketPurchaseOptions({
    required String id,
    required String ticketPurchaseId,
    required String ticketOptionId,
    String? optionValue,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketPurchaseOptions;

  factory TicketPurchaseOptions.fromJson(Map<String, dynamic> json) =>
      _$TicketPurchaseOptionsFromJson(json);
}
