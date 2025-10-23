import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_share_websocket_payload.freezed.dart';
part 'profile_share_websocket_payload.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
sealed class ProfileShareWebsocketPayload with _$ProfileShareWebsocketPayload {
  const factory ProfileShareWebsocketPayload.add({
    required ProfileWithSns profileWithSns,
  }) = ProfileShareAddWebsocketPayload;

  const factory ProfileShareWebsocketPayload.update({
    required ProfileWithSns profileWithSns,
  }) = ProfileShareUpdateWebsocketPayload;

  const factory ProfileShareWebsocketPayload.delete({
    required String profileId,
  }) = ProfileShareDeleteWebsocketPayload;

  factory ProfileShareWebsocketPayload.fromJson(Map<String, dynamic> json) =>
      _$ProfileShareWebsocketPayloadFromJson(json);
}
