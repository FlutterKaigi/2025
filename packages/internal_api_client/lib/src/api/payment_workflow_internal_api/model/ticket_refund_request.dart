import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_refund_request.freezed.dart';
part 'ticket_refund_request.g.dart';

@freezed
class TicketRefundRequest with _$TicketRefundRequest {
  const factory TicketRefundRequest({
    @JsonKey(name: 'ticket_purchase_id') required String ticketPurchaseId,
    @JsonKey(name: 'actor_id') required String actorId,
    @JsonKey(name: 'actor_name') required String actorName,
  }) = _TicketRefundRequest;

  factory TicketRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketRefundRequestFromJson(json);
}

