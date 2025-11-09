import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_log_delete_response.freezed.dart';
part 'entry_log_delete_response.g.dart';

@freezed
abstract class EntryLogDeleteResponse with _$EntryLogDeleteResponse {
  const factory EntryLogDeleteResponse({
    required bool success,
  }) = _EntryLogDeleteResponse;

  factory EntryLogDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$EntryLogDeleteResponseFromJson(json);
}
