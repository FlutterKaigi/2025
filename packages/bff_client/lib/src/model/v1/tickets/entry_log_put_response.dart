import 'package:bff_client/src/model/v1/tickets/entry_log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_log_put_response.freezed.dart';
part 'entry_log_put_response.g.dart';

@freezed
abstract class EntryLogPutResponse with _$EntryLogPutResponse {
  const factory EntryLogPutResponse({
    required bool success,
    required EntryLog entryLog,
  }) = _EntryLogPutResponse;

  factory EntryLogPutResponse.fromJson(Map<String, dynamic> json) =>
      _$EntryLogPutResponseFromJson(json);
}
