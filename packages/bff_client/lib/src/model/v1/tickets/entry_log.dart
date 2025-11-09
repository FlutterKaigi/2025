import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_log.freezed.dart';
part 'entry_log.g.dart';

@freezed
abstract class EntryLog with _$EntryLog {
  const factory EntryLog({
    required String ticketPurchaseId,
    required DateTime createdAt,
  }) = _EntryLog;

  factory EntryLog.fromJson(Map<String, dynamic> json) =>
      _$EntryLogFromJson(json);
}
