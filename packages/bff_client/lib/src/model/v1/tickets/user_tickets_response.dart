import 'package:bff_client/src/model/v1/tickets/ticket_checkout.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_option.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_purchase.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_type.dart';
import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tickets_response.freezed.dart';
part 'user_tickets_response.g.dart';

@freezed
abstract class UserTicketsResponse with _$UserTicketsResponse {
  const factory UserTicketsResponse({
    required List<TicketItem> tickets,
  }) = _UserTicketsResponse;

  factory UserTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTicketsResponseFromJson(json);
}

@freezed
sealed class TicketItem with _$TicketItem {
  const factory TicketItem.purchase({
    required TicketPurchase purchase,
    required TicketType ticketType,
    required List<TicketOption> options,
  }) = TicketPurchaseItem;

  const factory TicketItem.checkout({
    required TicketCheckout checkout,
    required TicketType ticketType,
    required List<TicketOption> options,
  }) = TicketCheckoutItem;

  factory TicketItem.fromJson(Map<String, dynamic> json) =>
      _$TicketItemFromJson(json);
}

extension TicketPurchaseWithDetailsExtension
    on db_types.TicketPurchaseWithDetails {
  TicketItem toTicketItem() {
    final purchase = this.purchase?.toTicketPurchase();
    final checkout = checkoutSession?.toTicketCheckout();
    final ticketType = this.ticketType;
    final options = this.options.map((e) => e.toTicketOption()).toList();
    if (purchase != null) {
      return TicketItem.purchase(
        purchase: purchase,
        ticketType: ticketType.toTicketType(),
        options: options,
      );
    } else if (checkout != null) {
      return TicketItem.checkout(
        checkout: checkout,
        ticketType: ticketType.toTicketType(),
        options: options,
      );
    } else {
      throw Exception('Invalid ticket item');
    }
  }
}
