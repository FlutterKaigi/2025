import 'package:bff_client/src/model/v1/tickets/ticket_checkout.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_option.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_purchase.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_type.dart';
import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tickets_list_response.freezed.dart';
part 'tickets_list_response.g.dart';

@freezed
abstract class TicketsListResponse with _$TicketsListResponse {
  const factory TicketsListResponse({
    required List<TicketItemWithUser> tickets,
  }) = _TicketsListResponse;

  factory TicketsListResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketsListResponseFromJson(json);
}

@freezed
sealed class TicketItemWithUser with _$TicketItemWithUser {
  const factory TicketItemWithUser.purchase({
    required TicketType ticketType,
    required TicketPurchase purchase,
    required List<TicketOption> options,
    required UserAndUserRoles user,
  }) = TicketPurchaseItemWithUser;

  const factory TicketItemWithUser.checkout({
    required TicketType ticketType,
    required TicketCheckout checkout,
    required List<TicketOption> options,
    required UserAndUserRoles user,
  }) = TicketCheckoutItemWithUser;

  factory TicketItemWithUser.fromJson(Map<String, dynamic> json) =>
      _$TicketItemWithUserFromJson(json);
}
