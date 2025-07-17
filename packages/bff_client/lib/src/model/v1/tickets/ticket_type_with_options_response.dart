import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_type_with_options_response.freezed.dart';
part 'ticket_type_with_options_response.g.dart';

@freezed
abstract class TicketTypeWithOptionsResponse
    with _$TicketTypeWithOptionsResponse {
  const factory TicketTypeWithOptionsResponse({
    required TicketTypes ticketType,
    required List<TicketOptions> options,
  }) = _TicketTypeWithOptionsResponse;

  factory TicketTypeWithOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeWithOptionsResponseFromJson(json);
}
