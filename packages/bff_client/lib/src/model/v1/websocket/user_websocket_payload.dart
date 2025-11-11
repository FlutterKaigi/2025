import 'package:bff_client/src/model/v1/websocket/payload/entry_log_websocket_payload.dart';
import 'package:bff_client/src/model/v1/websocket/payload/profile_share_websocket_payload.dart';
import 'package:bff_client/src/model/v1/websocket/payload/ticket_status_websocket_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_websocket_payload.freezed.dart';
part 'user_websocket_payload.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
sealed class UserWebsocketPayload with _$UserWebsocketPayload {
  // { type: "PROFILE_SHARE", payload: ...}
  const factory UserWebsocketPayload.profileShare({
    required ProfileShareWebsocketPayload profileShare,
  }) = UserWebsocketProfileSharePayload;

  // { type: "TICKET_STATUS", ticket_status: ...}
  const factory UserWebsocketPayload.ticketStatus({
    required TicketStatusPayload ticketStatus,
  }) = UserWebsocketTicketStatusPayload;

  // { type: "ENTRY_LOG", entry_log: ...}
  const factory UserWebsocketPayload.entryLog({
    required EntryLogWebsocketPayload entryLog,
  }) = UserWebsocketEntryLogPayload;

  factory UserWebsocketPayload.fromJson(Map<String, dynamic> json) =>
      _$UserWebsocketPayloadFromJson(json);
}
