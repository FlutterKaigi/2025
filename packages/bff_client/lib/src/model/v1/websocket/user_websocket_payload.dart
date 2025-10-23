import 'package:bff_client/src/model/v1/websocket/payload/profile_share_websocket_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_websocket_payload.freezed.dart';
part 'user_websocket_payload.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
sealed class UserWebsocketPayload with _$UserWebsocketPayload {
  // { type: "PROFILE_SHARE", payload: ...}
  const factory UserWebsocketPayload.profileShare({
    required ProfileShareWebsocketPayload profileShare,
  }) = UserWebsocketProfileSharePayload;

  factory UserWebsocketPayload.fromJson(Map<String, dynamic> json) =>
      _$UserWebsocketPayloadFromJson(json);
}
