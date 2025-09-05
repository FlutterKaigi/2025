import 'package:bff_client/src/model/v1/tickets/ticket_option.dart';
import 'package:bff_client/src/model/v1/tickets/ticket_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_type_with_options_response.freezed.dart';
part 'ticket_type_with_options_response.g.dart';

@freezed
abstract class TicketTypeWithOptionsResponse
    with _$TicketTypeWithOptionsResponse {
  const factory TicketTypeWithOptionsResponse({
    required TicketType ticketType,
    required List<TicketOption> options,
  }) = _TicketTypeWithOptionsResponse;

  factory TicketTypeWithOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeWithOptionsResponseFromJson(json);
}
