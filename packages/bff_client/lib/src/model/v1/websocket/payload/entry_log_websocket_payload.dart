import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_log_websocket_payload.freezed.dart';
part 'entry_log_websocket_payload.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
sealed class EntryLogWebsocketPayload with _$EntryLogWebsocketPayload {
  const factory EntryLogWebsocketPayload.add({
    required String ticketPurchaseId,
    required DateTime createdAt,
  }) = EntryLogAddWebsocketPayload;

  const factory EntryLogWebsocketPayload.delete({
    required String ticketPurchaseId,
  }) = EntryLogDeleteWebsocketPayload;

  factory EntryLogWebsocketPayload.fromJson(Map<String, dynamic> json) =>
      _$EntryLogWebsocketPayloadFromJson(json);
}
