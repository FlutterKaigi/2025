import 'package:bff_client/src/model/v1/tickets/ticket_checkout.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_option.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_purchase.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_type.dart';
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
    required TicketType ticketType,
    required TicketPurchase purchase,
    required List<TicketOption> options,
  }) = TicketPurchaseItem;

  const factory TicketItem.checkout({
    required TicketType ticketType,
    required TicketCheckout checkout,
    required List<TicketOption> options,
  }) = TicketCheckoutItem;

  factory TicketItem.fromJson(Map<String, dynamic> json) =>
      _$TicketItemFromJson(json);
}
