import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_status_websocket_payload.freezed.dart';
part 'ticket_status_websocket_payload.g.dart';

enum TicketStatusType {
  completed,
  refunded,
}

@freezed
abstract class TicketStatusPayload with _$TicketStatusPayload {
  const factory TicketStatusPayload({
    required String id,
    required String userId,
    required String ticketTypeId,
    required TicketStatusType status,
    String? stripePaymentIntentId,
    String? nameplateId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketStatusPayload;

  factory TicketStatusPayload.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusPayloadFromJson(json);
}
