import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_types_with_options_response.freezed.dart';
part 'ticket_types_with_options_response.g.dart';

@freezed
abstract class TicketTypeWithOptionsItem with _$TicketTypeWithOptionsItem {
  const factory TicketTypeWithOptionsItem({
    required TicketTypes ticketType,
    required List<TicketOptions> options,
  }) = _TicketTypeWithOptionsItem;

  factory TicketTypeWithOptionsItem.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeWithOptionsItemFromJson(json);
}

@freezed
abstract class TicketTypesWithOptionsResponse
    with _$TicketTypesWithOptionsResponse {
  const factory TicketTypesWithOptionsResponse({
    required List<TicketTypeWithOptionsItem> ticketTypes,
  }) = _TicketTypesWithOptionsResponse;

  factory TicketTypesWithOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketTypesWithOptionsResponseFromJson(json);
}
