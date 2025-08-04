import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tickets_response.freezed.dart';
part 'user_tickets_response.g.dart';

@freezed
abstract class UserTicketsResponse with _$UserTicketsResponse {
  const factory UserTicketsResponse({
    required List<TicketPurchases> tickets,
    required List<TicketCheckoutSessions> ticketCheckouts,
  }) = _UserTicketsResponse;

  factory UserTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTicketsResponseFromJson(json);
}
