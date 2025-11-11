import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_purchase_with_details_and_user.freezed.dart';
part 'ticket_purchase_with_details_and_user.g.dart';

@freezed
abstract class TicketPurchaseWithDetailsAndUser
    with _$TicketPurchaseWithDetailsAndUser {
  const factory TicketPurchaseWithDetailsAndUser({
    TicketPurchases? purchase,
    TicketCheckoutSessions? checkoutSession,
    required String ticketTypeId,
    required List<TicketOptions> options,
    EntryLogs? entryLog,
    required UserAndUserRoles user,
    TicketTypes? ticketType,
  }) = _TicketPurchaseWithDetailsAndUser;

  factory TicketPurchaseWithDetailsAndUser.fromJson(
    Map<String, dynamic> json,
  ) => _$TicketPurchaseWithDetailsAndUserFromJson(json);
}
