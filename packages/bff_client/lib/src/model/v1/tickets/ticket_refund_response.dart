import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_refund_response.freezed.dart';
part 'ticket_refund_response.g.dart';

@freezed
abstract class TicketRefundResponse with _$TicketRefundResponse {
  const factory TicketRefundResponse({
    @JsonKey(name: 'workflow_id') required String workflowId,
  }) = _TicketRefundResponse;

  factory TicketRefundResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketRefundResponseFromJson(json);
}

