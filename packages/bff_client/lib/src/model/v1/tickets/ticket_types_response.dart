import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_types_response.freezed.dart';
part 'ticket_types_response.g.dart';

@freezed
abstract class TicketTypesResponse with _$TicketTypesResponse {
  const factory TicketTypesResponse({
    required List<TicketTypes> ticketTypes,
  }) = _TicketTypesResponse;

  factory TicketTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketTypesResponseFromJson(json);
}
