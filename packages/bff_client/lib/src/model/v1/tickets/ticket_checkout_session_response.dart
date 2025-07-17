import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_checkout_session_response.freezed.dart';
part 'ticket_checkout_session_response.g.dart';

@freezed
abstract class TicketCheckoutSessionResponse
    with _$TicketCheckoutSessionResponse {
  const factory TicketCheckoutSessionResponse({
    required TicketCheckoutSessions session,
  }) = _TicketCheckoutSessionResponse;

  factory TicketCheckoutSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketCheckoutSessionResponseFromJson(json);
}
