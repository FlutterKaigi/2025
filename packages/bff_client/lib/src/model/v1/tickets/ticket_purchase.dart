import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchase.freezed.dart';
part 'ticket_purchase.g.dart';

@freezed
abstract class TicketPurchase with _$TicketPurchase {
  const factory TicketPurchase({
    required String id,
    required String ticketTypeId,
    required TicketPurchaseStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? stripePaymentIntentId,
  }) = _TicketPurchase;

  factory TicketPurchase.fromJson(Map<String, dynamic> json) =>
      _$TicketPurchaseFromJson(json);
}

enum TicketPurchaseStatus {
  completed,
  refunded,
}

extension TicketPurchaseExtension on db_types.TicketPurchases {
  TicketPurchase toTicketPurchase() => TicketPurchase(
    id: id,
    ticketTypeId: ticketTypeId,
    status: switch (status) {
      db_types.TicketPurchaseStatus.completed => TicketPurchaseStatus.completed,
      db_types.TicketPurchaseStatus.refunded => TicketPurchaseStatus.refunded,
    },
    createdAt: createdAt,
    updatedAt: updatedAt,
    stripePaymentIntentId: stripePaymentIntentId,
  );
}
