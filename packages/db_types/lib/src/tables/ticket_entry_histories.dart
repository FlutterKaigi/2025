import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_entry_histories.freezed.dart';
part 'ticket_entry_histories.g.dart';

@freezed
abstract class TicketEntryHistories with _$TicketEntryHistories {
  const factory TicketEntryHistories({
    required String id,
    @RequiredDateTimeConverter() required DateTime enteredAt,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _TicketEntryHistories;

  factory TicketEntryHistories.fromJson(Map<String, dynamic> json) =>
      _$TicketEntryHistoriesFromJson(json);
}
