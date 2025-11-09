import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_logs.freezed.dart';
part 'entry_logs.g.dart';

@freezed
abstract class EntryLogs with _$EntryLogs {
  const factory EntryLogs({
    required String ticketPurchaseId,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _EntryLogs;

  factory EntryLogs.fromJson(Map<String, dynamic> json) =>
      _$EntryLogsFromJson(json);
}
