import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout.freezed.dart';
part 'ticket_checkout.g.dart';

@freezed
abstract class TicketCheckout with _$TicketCheckout {
  const factory TicketCheckout({
    required String id,
    required String ticketTypeId,
    required TicketCheckoutStatus status,
    required String stripeCheckoutSessionId,
    required String stripeCheckoutUrl,
    required DateTime expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? ticketCheckoutWorkflowId,
  }) = _TicketCheckout;

  factory TicketCheckout.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutFromJson(json);
}

enum TicketCheckoutStatus {
  pending,
  completed,
  expired,
}

extension TicketCheckoutExtension on db_types.TicketCheckoutSessions {
  TicketCheckout toTicketCheckout() => TicketCheckout(
    id: id,
    ticketTypeId: ticketTypeId,
    status: switch (status) {
      db_types.TicketCheckoutStatus.pending => TicketCheckoutStatus.pending,
      db_types.TicketCheckoutStatus.completed => TicketCheckoutStatus.completed,
      db_types.TicketCheckoutStatus.expired => TicketCheckoutStatus.expired,
    },
    stripeCheckoutSessionId: stripeCheckoutSessionId,
    stripeCheckoutUrl: stripeCheckoutUrl,
    expiresAt: expiresAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    ticketCheckoutWorkflowId: ticketCheckoutWorkflowId,
  );
}
