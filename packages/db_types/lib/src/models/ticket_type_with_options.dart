import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_type_with_options.freezed.dart';
part 'ticket_type_with_options.g.dart';

@freezed
abstract class TicketTypeWithOptions with _$TicketTypeWithOptions {
  const factory TicketTypeWithOptions({
    @JsonKey(name: 'ticket_type') required TicketTypes ticketType,
    required List<TicketOptions> options,
  }) = _TicketTypeWithOptions;

  factory TicketTypeWithOptions.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeWithOptionsFromJson(json);
}
