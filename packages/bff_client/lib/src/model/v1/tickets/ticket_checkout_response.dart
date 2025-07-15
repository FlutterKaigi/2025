import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout_response.freezed.dart';
part 'ticket_checkout_response.g.dart';

@freezed
abstract class TicketCheckoutResponse with _$TicketCheckoutResponse {
  const factory TicketCheckoutResponse({
    required String checkoutSessionId,
    required String stripeCheckoutUrl,
    required int totalAmount,
    required DateTime expiresAt,
  }) = _TicketCheckoutResponse;

  factory TicketCheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutResponseFromJson(json);
}
