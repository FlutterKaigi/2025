import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout_request.freezed.dart';
part 'ticket_checkout_request.g.dart';

@freezed
abstract class TicketCheckoutRequest with _$TicketCheckoutRequest {
  const factory TicketCheckoutRequest({
    required String ticketTypeId,
    required List<String> optionIds,
    required String successUrl,
    required String cancelUrl,
  }) = _TicketCheckoutRequest;

  factory TicketCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutRequestFromJson(json);
}
