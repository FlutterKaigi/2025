import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_entry_history.freezed.dart';
part 'ticket_entry_history.g.dart';

@freezed
abstract class TicketEntryHistory with _$TicketEntryHistory {
  const factory TicketEntryHistory({
    required String id,
    required DateTime enteredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketEntryHistory;

  factory TicketEntryHistory.fromJson(Map<String, dynamic> json) =>
      _$TicketEntryHistoryFromJson(json);
}

extension TicketEntryHistoryExtension on db_types.TicketEntryHistories {
  TicketEntryHistory toTicketEntryHistory() => TicketEntryHistory(
    id: id,
    enteredAt: enteredAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
