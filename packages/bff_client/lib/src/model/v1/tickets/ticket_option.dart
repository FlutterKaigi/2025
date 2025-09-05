import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_option.freezed.dart';
part 'ticket_option.g.dart';

@freezed
abstract class TicketOption with _$TicketOption {
  const factory TicketOption({
    required String id,
    required String ticketTypeId,
    required String name,
    String? description,
    int? maxQuantity,
  }) = _TicketOption;

  factory TicketOption.fromJson(Map<String, dynamic> json) =>
      _$TicketOptionFromJson(json);
}

extension TicketOptionExtension on db_types.TicketOptions {
  TicketOption toTicketOption() => TicketOption(
    id: id,
    ticketTypeId: ticketTypeId,
    name: name,
    description: description,
    maxQuantity: maxQuantity,
  );
}
