import 'package:bff_client/src/model/v1/tickets/ticket_entry_history.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_purchase.dart';
import 'package:bff_client/src/model/v1/users/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_detail_response.freezed.dart';
part 'ticket_detail_response.g.dart';

@freezed
abstract class TicketDetailResponse with _$TicketDetailResponse {
  const factory TicketDetailResponse({
    required TicketPurchase ticketPurchase,
    required User user,
    TicketEntryHistory? entryHistory,
  }) = _TicketDetailResponse;

  factory TicketDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailResponseFromJson(json);
}
