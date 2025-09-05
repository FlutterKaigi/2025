import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchase_with_details.freezed.dart';
part 'ticket_purchase_with_details.g.dart';

@freezed
abstract class TicketPurchaseWithDetails with _$TicketPurchaseWithDetails {
  const factory TicketPurchaseWithDetails({
    TicketPurchases? purchase,
    TicketCheckoutSessions? checkoutSession,
    required TicketTypes ticketType,
    required List<TicketOptions> options,
  }) = _TicketPurchaseWithDetails;

  factory TicketPurchaseWithDetails.fromJson(Map<String, dynamic> json) =>
      _$TicketPurchaseWithDetailsFromJson(json);
}
