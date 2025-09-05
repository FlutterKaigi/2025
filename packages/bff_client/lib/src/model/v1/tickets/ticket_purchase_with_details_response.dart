import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchase_with_details_response.freezed.dart';
part 'ticket_purchase_with_details_response.g.dart';

@freezed
abstract class UserTicketsWithDetailsResponse
    with _$UserTicketsWithDetailsResponse {
  const factory UserTicketsWithDetailsResponse({
    required List<TicketPurchaseWithDetails> tickets,
  }) = _UserTicketsWithDetailsResponse;

  factory UserTicketsWithDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTicketsWithDetailsResponseFromJson(json);
}


@freezed
abstract class TicketPurchaseWithDetails
    with _$TicketPurchaseWithDetails {
  const factory TicketPurchaseWithDetails({
    required TicketPurchases purchase,
    required TicketTypes ticketType,
    required List<TicketOptions> options,
  }) = _TicketPurchaseWithDetails;

  factory TicketPurchaseWithDetails.fromJson(
    Map<String, dynamic> json,
  ) => _$TicketPurchaseWithDetailsFromJson(json);
}
