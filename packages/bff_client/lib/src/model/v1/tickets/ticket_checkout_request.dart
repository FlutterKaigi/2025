import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout_request.freezed.dart';
part 'ticket_checkout_request.g.dart';

@freezed
abstract class TicketCheckoutRequest with _$TicketCheckoutRequest {
  const factory TicketCheckoutRequest({
    required String ticketTypeId,
    required List<TicketOptionRequest> options,
  }) = _TicketCheckoutRequest;

  factory TicketCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutRequestFromJson(json);
}

@freezed
abstract class TicketOptionRequest with _$TicketOptionRequest {
  const factory TicketOptionRequest({
    required String optionId,
    required String value,
  }) = _TicketOptionRequest;

  factory TicketOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketOptionRequestFromJson(json);
}
